FROM ubuntu:20.04

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN apt-get update && \
    apt-get --no-install-recommends install -y \
    python3 python3-pip git python-is-python3 \
    tzdata software-properties-common apt-transport-https wget zip unzip htop git curl vim nano zip sudo net-tools x11-utils eterm iputils-ping build-essential xvfb x11vnc supervisor \
    
RUN git clone https://github.com/TeamUltroid/Ultroid.git && cd Ultroid
RUN pip3 install virtualenv
RUN virtualenv -p /usr/bin/python3 venv

RUN python3 -m venv venv . ./venv/bin/activate
RUN pip3 install --no-cache-dir -r requirements.txt
RUN pip3 install -U -r requirements.txt
RUN pip3 install -U -r resources/startup/optional-requirements.txt


CMD ["bash","startup"]
