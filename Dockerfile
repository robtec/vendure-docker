FROM node:16

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y vim

WORKDIR /app/vendure

COPY entrypont.sh /app/vendure/

ENTRYPOINT ["./entrypoint.sh"]
CMD ["bash"]