#!/bin/bash

set -e

readonly PATH_TO_CURR_DIR=`dirname $0`

needle generate $PATH_TO_CURR_DIR/Sources/Products/Notes/NeedleGenerated.swift $PATH_TO_CURR_DIR/Sources
