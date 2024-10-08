FROM python:3.8 as build

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG TARGETOS
ARG TARGETARCH

ARG Version
ARG GitCommit
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM" 


RUN apt-get update && apt-get install -y nano git vim
RUN git clone https://github.com/boston-dynamics/spot-sdk.git

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
COPY requirements.txt requirements.txt
RUN python3.8 -m pip install --upgrade pip
RUN python3.8 -m pip install -r requirements.txt
CMD ["/bin/sh"]
