FROM ubuntu

RUN apt-get update \
  && apt-get install -y \
  curl \
  mono-complete \
  mono-xsp4 \
  zip

RUN curl -o /tmp/OmniDB.zip http://www.omnidb.com.br/OmniDB-1.3.zip
RUN unzip /tmp/OmniDB.zip -d /opt/
RUN rm -f /tmp/OmniDB.zip
RUN rm -f /tmp/OmniDB.zip && apt-get remove -y curl unzip

WORKDIR "/opt/OmniDB-1.3"

EXPOSE 9000
CMD xsp4 --nonstop --port 9000
