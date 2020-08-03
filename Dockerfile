FROM nvidia/cuda:9.1-base
LABEL author=DanielJunior email="danieljunior@id.uff.br"
USER root

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update && apt-get install -y software-properties-common && \
    apt-get update --fix-missing && add-apt-repository ppa:deadsnakes/ppa && \
    apt-get install -y python3.6 \
    wget bzip2 ca-certificates gcc g++ nano cython build-essential \
    libglib2.0-0 libxext6 libsm6 libxrender1

# RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh -O ~/anaconda.sh && \
#     /bin/bash ~/anaconda.sh -b -p /opt/conda && \
#     rm ~/anaconda.sh && \
#     ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
#     echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
#     echo "source activate base" > ~/.bashrc

RUN mkdir -p /app
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip && pip install -r /app/requirements.txt

EXPOSE 8888