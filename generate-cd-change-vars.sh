#!/bin/bash

# Declare lists of image tags to choose from
declare -a express_tags=("5416e81" "a621cc7" "274cd50" "a6269f1" "9ebf646" "a99518b")
declare -a buslog_tags=("4ed1e59" "111a75a" "e37f056" "0f06e32" "16c937a" "55d6009")
declare -a ctrlr_tags=("2b6d88e" "2d4d04f" "570e2a2" "6eebbb0" "af07e54" "8aa7e29")
declare -a flask_ui_tags=("f3c1948" "1b8d478" "577b34a" "4b49dde" "554232f" "b7c2aa4")

# Choose a random tag from each list
RANDOM=$(date +%s)
EXPRESS_TAG=${express_tags[ $RANDOM % ${#express_tags[@]} ]}
BUSLOG_TAG=${buslog_tags[ $RANDOM % ${#buslog_tags[@]} ]}
CTRLR_TAG=${ctrlr_tags[ $RANDOM % ${#ctrlr_tags[@]} ]}
FLASK_UI_TAG=${flask_ui_tags[ $RANDOM % ${#flask_ui_tags[@]} ]}

# Export pipeline variables
cf_export EXPRESS_TAG
cf_export BUSLOG_TAG
cf_export CTRLR_TAG
cf_export FLASK_UI_TAG