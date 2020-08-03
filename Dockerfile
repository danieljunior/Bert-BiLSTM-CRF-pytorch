FROM nvidia/cuda:9.1-base
LABEL author=DanielJunior email="danieljunior@id.uff.br"
USER root

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && apt-get update --fix-missing &&\
    apt-get install -y python3.6 \
    curl bzip2 ca-certificates gcc g++ nano cython build-essential \
    libglib2.0-0 libxext6 libsm6 libxrender1 git

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py

RUN mkdir -p /app
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip && pip install -r /app/requirements.txt

EXPOSE 8888