FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  python3-full \
  python3-pip \
  git

RUN pip install pyYAML

COPY feed.py /user/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
