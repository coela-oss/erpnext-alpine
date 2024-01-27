#!/bin/bash

TARGET_NAME=$1
FILE="docker-bake.hcl"

if [ -z "$TARGET_NAME" ]; then
    echo "Usage: $0 [target name] in docker-bake.hcl"
    exit 1
fi

if [ ! -f "$FILE" ]; then
    echo "File not found: $FILE. Build bake file to exec bubbles-out.sh before use this script."
    exit 1
fi

in_target=false
while IFS= read -r line
do
    if [[ $line =~ ^target\ \"$TARGET_NAME\"\ \{$ ]]; then
        in_target=true
        continue
    fi

    if [[ $line == "}" ]] && [ "$in_target" = true ]; then
        in_target=false
        break
    fi

    if [ "$in_target" = true ]; then
        if [[ $line =~ context\ =\ \"(.+)\" ]]; then
            context=${BASH_REMATCH[1]}
        fi
        if [[ $line =~ dockerfile\ =\ \"(.+)\" ]]; then
            dockerfile=${BASH_REMATCH[1]}
        fi
        if [[ $line =~ tags\ =\ \[(.+)\] ]]; then
            tags=${BASH_REMATCH[1]}
        fi
    fi
done < "$FILE"

if [ -n "$context" ] && [ -n "$dockerfile" ] && [ -n "$tags" ]; then
    IFS=',' read -ra TAGS_ARRAY <<< "$tags"
    tag=$(echo ${TAGS_ARRAY[0]} | xargs | tr -d '"')
    docker build -t $tag -f $context/$dockerfile $context --no-cache
    #echo "docker build -t $tag -f $context/$dockerfile $context"
else
    echo "Error: target section '$TARGET_NAME' is incomplete or not found in the file."
fi