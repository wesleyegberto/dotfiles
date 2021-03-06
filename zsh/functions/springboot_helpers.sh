#!/bin/sh

# Usage: `new_spring_boot <Project_Name> [<Group_Id>]`
new_spring_boot() {
  local API_NAME
  local GROUP_ID

  GROUP_ID="$2"
  API_NAME="$1"
  if [ -z "$GROUP_ID" ]; then
    GROUP_ID="com.github.wesleyegberto"
  fi

  curl https://start.spring.io/starter.zip -d javaVersion=11 \
      -d dependencies=devtools,web -d packageName=$GROUP_ID -d groupId=$GROUP_ID \
      -d artifactId=$API_NAME -d name=$API_NAME \
    | tar -xvf -
  rm -rf .mvn/ mvnw mvnw.cmd HELP.md
}
