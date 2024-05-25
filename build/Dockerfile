FROM ubuntu:24.04

RUN apt update && apt install -y curl
RUN apt install -y jq

COPY request.sh /app/request.sh
COPY 20231020_01110305000006_L00.jpg /app/image.jpg

ARG SERVICE1_URL
ENV URL $SERVICE1_URL
ARG EXPECTED_RESULT
ENV EXPECTED_RESULT $EXPECTED_RESULT

WORKDIR /app
CMD ["bash", "request.sh"]