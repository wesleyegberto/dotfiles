#!/usr/bin/env bash

awsFindGroupName() {
    if [ -z "$1" ]; then
        aws logs describe-log-groups \
            | jq '.logGroups[] | " \(.logGroupName) -> \(.storedBytes) bytes "' \
            | fzf \
            | awk '{print $2}'
    else
        aws logs describe-log-groups \
            | jq '.logGroups[] | " \(.logGroupName) -> \(.storedBytes) bytes "' \
            | fzf -q "$1" \
            | awk '{print $2}'
    fi
}

awsFindLogStream() {
    aws logs describe-log-streams \
        --log-group-name "/aws/lambda/$1" | \
        jq '.logStreams[] | {logStreamName: .logStreamName, creationTime: (.creationTime / 1000 | todate), firstEventTimestamp: (.firstEventTimestamp / 1000 | todate), arn: .arn}'
}

awsLogStreamFzf() {
    aws logs describe-log-streams --log-group-name "$1" \
        | jq '.logStreams[] | "\(.creationTime / 1000 | todate) -> \(.firstEventTimestamp / 1000 | todate) - \(.logStreamName) - \(.storedBytes) bytes"' \
        | sort -r \
        | fzf \
        | awk '{print $5}'
}

awsLambdaLog() {
    local groupName
    local logStream
    local logs
    groupName="/aws/lambda/$1"
    echo "logGroup: $groupName"
    logStream=$(awsLogStreamFzf "$groupName")
    if [ -z "$logStream" ]; then
        echo "Log stream not found"
        return
    fi
    echo "logStream: $logStream"

    logs=$(aws logs get-log-events --log-group-name "$groupName" --log-stream-name "$logStream" \
        | jq '.events[].message' \
        | sed 's/^"//g;s/"$//g')
    echo -e "$logs"
}

awsLambdaEventView() {
    aws lambda list-event-source-mappings --function-name "$1" | jq '.EventSourceMappings[]'
}

awsLambdaEventOff() {
    local lambdaName
    local eventUuid
    lambdaName=$1
    eventUuid=$(aws lambda list-event-source-mappings --function-name "$lambdaName" | jq '.EventSourceMappings[].UUID' | sed 's/^"//g;s/"$//g')
    echo "Lambda $lambdaName - Disabling $eventUuid"
    aws lambda update-event-source-mapping --function-name "$lambdaName" --uuid "$eventUuid" --no-enabled
}

awsLambdaEventOn() {
    local lambdaName
    local eventUuid
    lambdaName=$1
    eventUuid=$(aws lambda list-event-source-mappings --function-name "$lambdaName" | jq '.EventSourceMappings[].UUID' | sed 's/^"//g;s/"$//g')
    echo "Lambda $lambdaName - Enabling $eventUuid"
    aws lambda update-event-source-mapping --function-name "$lambdaName" --uuid "$eventUuid" --enabled
}

awsSqsFind() {
    aws sqs list-queues | jq '.QueueUrls[]' | grep "$1"
}

awsSqsGetAttr() {
    aws sqs get-queue-attributes --queue-url "$1" --attribute-names All
}

awsSqsGetMsg() {
    aws sqs receive-message --queue-url "$1" | jq '.Messages[]'
}

awsSqsReadMsg() {
    local queueUrl
    queueUrl=$(aws sqs list-queues | jq '.QueueUrls[]' | fzf -q "$1" | sed 's/^"//g;s/"$//g')
    echo "Reading $queueUrl"
    awsSqsGetMsg "$queueUrl"
}

awsSqsSendMsg() {
    local queueUrl
    queueUrl="$2"
    if [ -z "$queueUrl" ]; then
        queueUrl=$(aws sqs list-queues | jq '.QueueUrls[]' | fzf -q "$2" | sed 's/^"//g;s/"$//g')
    fi
    echo "Sending '$1' to $queueUrl"
    aws sqs send-message --queue-url "$queueUrl" --message-body "'$1'" | jq
}
