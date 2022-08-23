# syntax=docker/dockerfile:1.3

ARG ERPNEXT_VERSION
FROM frappe/erpnext-worker:${ERPNEXT_VERSION}

COPY repos ../apps

USER root

RUN apt-get update && apt-get install -y \
    libmagic-dev \
    nano \
    yarn \
    && rm -rf /var/lib/apt/lists/* \
    && yarn global add sass
RUN install-app frappe_s3_attachment

USER frappe