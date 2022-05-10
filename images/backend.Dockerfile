# syntax=docker/dockerfile:1.3

ARG ERPNEXT_VERSION
FROM frappe/erpnext-worker:${ERPNEXT_VERSION}

COPY repos ../apps

USER root

RUN apt-get update && apt-get install libmagic1
RUN install-app frappe_s3_attachment

USER frappe