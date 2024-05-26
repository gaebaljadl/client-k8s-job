FROM ubuntu:24.04

RUN apt update && apt install -y curl
RUN apt install -y jq
RUN apt install -y python3
RUN apt install -y python3-pip

COPY request.sh /app/request.sh
COPY 20231020_01110305000006_L00.jpg /app/image.jpg

ARG SERVICE1_URL
ENV URL $SERVICE1_URL
ARG EXPECTED_RESULT
ENV EXPECTED_RESULT $EXPECTED_RESULT

COPY requirements.txt /app/requirements.txt

WORKDIR /app

RUN mv /usr/lib/python3.12/EXTERNALLY-MANAGED /usr/lib/python3.12/EXTERNALLY-MANAGED.old
RUN pip3 install -r ./requirements.txt

COPY request.py /app/request.py

CMD ["python3", "request.py"]