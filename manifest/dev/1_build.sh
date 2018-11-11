#!/bin/bash
CURRENT_DIR=$(dirname $0)
docker build -t app "$CURRENT_DIR/../../."
