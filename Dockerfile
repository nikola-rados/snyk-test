FROM python:3.10-slim

ENV PIP_INDEX_URL="https://pypi.pacificclimate.org/simple/"

COPY . /tmp
WORKDIR /tmp

RUN apt-get update && \
    apt-get install -y build-essential cdo libhdf5-serial-dev netcdf-bin libnetcdf-dev && \
    rm -rf /var/lib/apt/lists/* && \
    strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5 && \
    apt-get remove -y python3-urllib3 && \
    pip install -U pip && \
    pip install gunicorn