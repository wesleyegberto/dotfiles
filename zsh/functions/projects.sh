#!/usr/bin/env bash

# Try to run any project that I usually work with
run() {
    if [ -f run_dev.sh ]; then
        sh run_dev.sh

    elif [ -f run_local.sh ]; then
        sh run_local.sh

    elif [ -f pom.xml ]; then # Java project
        mvn spring-boot:run

    elif [ -f package.json ]; then # Node project
        cat package.json | jq '.scripts | to_entries | .[] | " \(.key) -> \(.value) "' | fzf | awk '{print $2}' | xargs npm run

    elif [ -f $(ls | grep -E ".*\.sln$|.*\.csproj$") ]; then # .Net project
        dotnet watch run

    else
        echo "There is no project to run"
    fi
}
