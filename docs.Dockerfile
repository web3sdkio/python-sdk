FROM python:3.9 as build

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt
COPY Makefile /app/Makefile

RUN make init

COPY web3sdkio /app/web3sdkio
COPY docs /app/docs
RUN make build-docs

FROM halverneus/static-file-server

WORKDIR /docs

COPY --from=build /app/docs/site /docs/site
ENV FOLDER=/docs/site