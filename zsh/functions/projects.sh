#!/usr/bin/env bash

# Try to compile any project that I usually work with
build() {
    if [ -f pom.xml ]; then # Java project
        mvn clean compile

    elif [ -f $(ls | grep -E "^.*\.[sln|csproj]$") ]; then # .Net project
        dotnet clean
        dotnet build

    elif [ -f package.json ]; then # Node project
        cat package.json | jq '.scripts | to_entries | .[] | " \(.key) -> \(.value) "' | fzf | awk '{print $2}' | xargs npm run

    else
        echo "There is no project to build"
    fi
}

tests() {
    if [ -f pom.xml ]; then # Java project
        mvn test

    elif [ -f $(ls | grep -E "^.*\.[sln|csproj]$") ]; then # .Net project
        dotnet test

    elif [ -f package.json ]; then # Node project
        npm test

    else
        echo "There is no project to test"
    fi
}

# Try to run any project that I usually work with
run() {
    if [ -f run_dev.sh ]; then
        sh run_dev.sh

    elif [ -f run_local.sh ]; then
        sh run_local.sh

    elif [ -f pom.xml ]; then # Java project
        mvn spring-boot:run

    elif [ -f $(ls | grep -E "^.*\.[sln|csproj]$") ]; then # .Net project
        dotnet watch run

    elif [ -f package.json ]; then # Node project
        cat package.json | jq '.scripts | to_entries | .[] | " \(.key) -> \(.value) "' | fzf | awk '{print $2}' | xargs npm run

    else
        echo "There is no project to run"
    fi
}

cleanup_java_ide() {
    rm -rf \
        .mvn mvnw mvnw.cmd HELP.md target \
        .classpath .project .settings .idea .vscode
}

# Usage: `new_spring_boot <Project_Name> [<Group_Id>]`
new_spring_boot() {
    local API_NAME
    local GROUP_ID

    API_NAME="$1"
    GROUP_ID="$2"
    if [ -z "$GROUP_ID" ]; then
    GROUP_ID="com.github.wesleyegberto"
    fi

    curl https://start.spring.io/starter.zip -d javaVersion=11 \
        -d dependencies=devtools,web -d packageName=$GROUP_ID -d groupId=$GROUP_ID \
        -d artifactId="$API_NAME" -d name="$API_NAME" \
        | tar -xvf -
    rm -rf .mvn/ mvnw mvnw.cmd HELP.md
}

