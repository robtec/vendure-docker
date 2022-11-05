#!/bin/bash

set -e

function setup() {

    FILE=/app/vendure/package.json

    if [ ! -f "$FILE" ]; then
        echo -e "vendure source code repo not found."
        echo -e "did you clone it correctly?"
        exit 2
    fi

    cd /app/vendure/
    
    # steps as per https://github.com/vendure-ecommerce/vendure#development
    
    echo -e ">>> step 1"
    yarn

    echo -e ">>> step 2"
    yarn bootstrap

    echo -e ">>> step 3"
    yarn build
}

setup

exec "$@"
