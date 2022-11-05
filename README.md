# Vendure Docker

Docker container for developing on Vendure

## Setup

clone Vendure to the same directory as this repo

```
git clone https://github.com/vendure-ecommerce/vendure.git
```

You should now hava a `vendure` directory, that will be mounted into your container

### DB

Update `packages/dev-server/dev-config.ts` with your database details, you can use those set in the `docker-compose.yml` for to use `postgres`

Update `packages/dev-server/dev-config.ts` to the following, settings from our `postgreSQL` in the `docker-compose.yml` file
```
...
function getDbConfig(): ConnectionOptions {
    const dbType = process.env.DB || 'mysql';
    switch (dbType) {
        case 'postgres':
            console.log('Using postgres connection');
            return {
                synchronize: true,
                type: 'postgres',
                host: 'database',
                port: 5432,
                username: 'pguser',
                password: 'mysecretpassword',
                database: 'vendure-dev',
            };
...
```

## Run

Build the image and run the container, mounting `vendure`
```
docker compose up -d --build
```
