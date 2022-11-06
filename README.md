# Vendure Docker

Docker container for developing on Vendure

## Setup

clone Vendure to the same directory as this repo

```
git clone https://github.com/vendure-ecommerce/vendure.git
```

You should now hava a `vendure` directory, that will be mounted into your container

### DB

Update `vendure/packages/dev-server/dev-config.ts` to the following db settings from our `postgres` in the `docker-compose.yml` file
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
                database: 'vendure',
            };
...
```

## Run

Build the image and run the container (this will mount `vendure` into the container as a volume)
```
docker compose up -d --build
```

Follow the logs to see the build status (can take 6 to 10 minutes to complete)
```
docker logs -f vendure
```

Once you see `### Ready to Start ###`, `exec` into the container to start the server
```
docker exec -it vendure bash
```

You are now in the container
```
# navigate to the project
cd /app/vendure/

# start the dev server
yarn dev-server:start

# watch the output for the URLs
```


## Docs

- https://github.com/vendure-ecommerce/vendure#development
