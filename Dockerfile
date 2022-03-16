FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN apt-get update && \
    apt-get --no-install-recommends install -y \
    python3 python3-pip git python-is-python3
    
RUN git clone https://github.com/TeamUltroid/Ultroid.git
RUN pip3 install virtualenv
RUN virtualenv -p /usr/bin/python3 venv
#RUN pip3 install --no-cache-dir -r Ultroid/requirements.txt
RUN pip install -U -r Ultroid/requirements.txt \ 
RUN pip install -U -r Ultroid/resources/startup/optional-requirements.txt

COPY . ./
CMD ["bash","startup"]
