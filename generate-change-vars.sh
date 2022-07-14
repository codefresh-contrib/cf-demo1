#!/bin/bash

# Creates Codefresh pipeline variables which can be used to automate a
# pretend developer making commits to a demo Git repo (changing a color).

# Outputs
# -------
# COLOR_CHOICE = 1 of 7 randomized colors to include in the code change/commit
# JIRA_ISSUE = 1 of 13 randomized JIRA issue numbers (they start with KPT-)
# COMMIT_MESSAGE = 1 of 6 randomized commit messages
# COMMITTER_NAME = 1 committer name
# COMMITTER_EMAIL = corresponding committer email

# Note: Output variables are published with both export and cf_export. Export
# allows other commands in the same freestyle step as this script to see
# the variables, and cf_export allows subsequent steps to see the variables.

function choose_color() {
    # Sets output var COLOR_CHOICE
    declare -a COLOR_LIST=("LemonChiffon" "LightCyan" "LightBlue" \
    "LightGoldenRodYellow" "LightGrey" "Lavender" "HoneyDew")
    COLOR_INDEX=$(($RANDOM % 7 + 1))
    export COLOR_CHOICE=${COLOR_LIST[COLOR_INDEX]}
    cf_export COLOR_CHOICE || true
    # echo "Color choice: $COLOR_CHOICE"
}

function choose_jira_issue() {
    # Sets output var JIRA_ISSUE
    declare -a ISSUE_LIST=("KPT-17" "KPT-18" "KPT-19" "KPT-20" "KPT-21" "KPT-22" "KPT-23" "KPT-24" "KPT-25" "KPT-26" "KPT-27" "KPT-28" "KPT-29")
    ISSUE_INDEX=$(($RANDOM % 13 + 1))
    export JIRA_ISSUE=${ISSUE_LIST[ISSUE_INDEX]}
    export JIRA_ISSUE_PREFIX=KPT
    cf_export JIRA_ISSUE || true
    # echo "JIRA issue: $JIRA_ISSUE"
}

function choose_commit_message() {
    # Sets output var COMMIT_MESSAGE
    declare -a MESSAGE_LIST=("Update style.css" "Update background color" \
        "Apply $COLOR_CHOICE color scheme" "Add highlights for pizzaz" "Code refactor" "Update dependencies")
    MESSAGE_INDEX=$(($RANDOM % 6 + 1))
    export COMMIT_MESSAGE=${MESSAGE_LIST[MESSAGE_INDEX]}
    cf_export COMMIT_MESSAGE || true
    # echo "Commit message: $COMMIT_MESSAGE"
}

function choose_commiter() {
    # Sets output vars COMMITTER_NAME and COMMITTER_EMAIL
    declare -a NAME_LIST=("cf-sa-demo")
    declare -a EMAIL_LIST=("salesdemosa@codefresh.io")
    # COMMITTER_INDEX=$(($RANDOM % 2))
    COMMITTER_INDEX=0
    export COMMITTER_NAME=${NAME_LIST[COMMITTER_INDEX]}
    export COMMITTER_EMAIL=${EMAIL_LIST[COMMITTER_INDEX]}
    cf_export COMMITTER_NAME || true
    cf_export COMMITTER_EMAIL || true
    # echo "Committer: $COMMITTER_NAME $COMMITTER_EMAIL"
}


# ********************** Main Area ***********************
choose_color
choose_jira_issue
choose_commit_message
choose_commiter
