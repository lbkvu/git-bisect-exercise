#!/bin/bash

# if no argument, start with 1st commit
# else, start with $1 commit
usage_exit()
{
    echo "Usage: $0 <good-commit>" 1>&2
    exit 1
}

test_valid_commit_id()
{
    if [[ $(git cat-file -t $1 2>/dev/null) == "commit" ]]; then
        echo "true"
    else
        echo "false"
    fi
}

if [[ $# -eq 0 ]]; then
    GOOD_COMMIT=$(git log --oneline | tail -n 1 | cut -d" " -f1)
elif [[ "$#" -eq 1 ]]; then
    if [[ $(test_valid_commit_id $1) == "true" ]]; then
        GOOD_COMMIT=$1
    else
        echo "Invalid commit!"
        exit 1
    fi
else
    usage_exit
fi

git bisect start HEAD $GOOD_COMMIT --
git bisect run ./test_result.sh
git bisect reset
