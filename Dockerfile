FROM ubuntu

RUN apt-get update \
  && apt-get install -y \
  curl \
  mono-complete \
  mono-xsp4 \
  zip

RUN mkdir /home/omnidb && \
    cd /home/omnidb && \
    curl -sS http://www.omnidb.com.br/OmniDB-1.3.zip > omnidb.zip && \
    unzip omnidb.zip

WORKDIR "/home/omnidb"

EXPOSE 9000
CMD cd /home/omnidb/OmniDB-1.3 && xsp4 --port 9000 && /bin/bash
