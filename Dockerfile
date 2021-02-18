FROM python:3.8-slim
  
RUN apt-get update && apt-get install

RUN apt-get install -y \
  dos2unix \
  libpq-dev \
  libmariadb-dev-compat \
  libmariadb-dev \
  gcc \
  && apt-get clean

RUN python -m pip install

COPY requirements.txt requirements.txt
RUN python -m pip install -r requirements.txt

RUN mkdir /code
WORKDIR /code
ADD . /code/