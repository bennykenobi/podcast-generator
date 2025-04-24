FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  python3 \
  python3-pip \
  python3-venv \
  git

RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

RUN pip install pyYAML

COPY feed.py /user/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]