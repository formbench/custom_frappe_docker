# syntax=docker/dockerfile:1.3

ARG ERPNEXT_VERSION
FROM frappe/erpnext-worker:${ERPNEXT_VERSION}

COPY repos ../apps

USER root

RUN apt-get update && apt-get install -y \
    libmagic-dev \
    nano \
    && rm -rf /var/lib/apt/lists/*
RUN install-app frappe_s3_attachment

USER frappe