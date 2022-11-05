# Vendure Docker

Docker container for developing on Vendure

## Setup

clone Vendure to the same directory as this repo

```
git clone https://github.com/vendure-ecommerce/vendure.git
```

You should now hava a `vendure` directory, that will be mounted into your container

## Run

Build the image and run the container, mounting `vendure`
```
docker compose up -d --build
```
