#!/bin/bash

set -e

function does_db_exist() {
    psql -U $PG_USER -h $PG_HOST -lqt | cut -d \| -f 1 | grep -wq $1
}

function ready() {
    echo -e "##############################################"
    echo -e "########### Ready to Start ###################"
    echo -e "##############################################"
}

function db_setup() {

    DB_NAME="vendure"

    sleep 10 # wait for db to be up
    export PGPASSWORD=$PG_PASS

    if does_db_exist $DB_NAME
    then
        echo -e "$DB_NAME db exists, skipping create"
    else
        echo -e "$DB_NAME db does not exist, creating"
        psql -U $PG_USER -h $PG_HOST -c "CREATE DATABASE vendure ENCODING = 'UTF8';"
    fi

    cd /app/vendure/packages/dev-server/

    yarn populate
}

function versions() {

    echo -e "### node version ###"
    node -v

    echo -e "### yarn version ###"
    yarn -v

    echo -e "### npm version ###"
    npm -v
}

function setup() {

    FILE=/app/vendure/package.json

    if [ ! -f "$FILE" ]; then
        echo -e "vendure source code repo not found."
        echo -e "did you clone it correctly?"
        exit 2
    fi

    cd /app/vendure/
    
    echo -e ">>> step 1"
    yarn

    echo -e ">>> step 2"
    yarn bootstrap

    echo -e ">>> step 3"
    yarn build
}

versions

setup

db_setup

ready

exec "$@"
