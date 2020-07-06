FROM ubuntu:16.04

COPY . /app
WORKDIR /app

RUN apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update

RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv
RUN apt-get install -y git
RUN apt-get install -y libsm6 libxext6 libxrender-dev

# update pip
RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel

RUN pip install -r requirements.txt 

ENV FLASK_APP server.py
ENV FLASK_RUN_HOST 0.0.0.0
ENV FLASK_ENV development
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

CMD ["flask", "run"] 
