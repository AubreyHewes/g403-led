FROM debian:buster

WORKDIR /app

RUN \
    apt -yq update && \
    apt -yq install \
        libusb-1.0.0 \
        python3 \
        virtualenv \
    && \
    virtualenv --python=python3 ./env && \
    \
    apt clean && \
    rm -rf /var/apt/lists/*

ADD /requirements.txt /app/requirements.txt
RUN env/bin/pip install -r ./requirements.txt

ADD /g403-led.py /app/g403-led.py

ENTRYPOINT ["/app/g403-led.py"]
