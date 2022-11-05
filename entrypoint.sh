#!/bin/bash

set -e

function setup() {

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
