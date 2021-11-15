FROM python:3.10.0-bullseye

RUN apt-get update && apt-get install -y curl
# RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/usr/bin sh
RUN curl -fsSL https://gitee.com/duchenpaul/arduino-cli/raw/master/install.sh | BINDIR=/usr/bin sh
RUN arduino-cli core update-index

RUN pip install --no-cache-dir pyyaml
COPY compile.py /usr/src/app/

VOLUME /root/.arduino15/
COPY arduino-cli.yaml /root/.arduino15/arduino-cli.yaml

WORKDIR /usr/src/sketch
CMD [ "python", "-u", "/usr/src/app/compile.py" ]
