FROM node:14

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y vim

COPY entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]
CMD ["sleep","infinity"]