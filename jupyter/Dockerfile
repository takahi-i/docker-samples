FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    python3.6 \
    python3-pip \
    python3.6-dev

RUN pip3 install --upgrade pip

RUN pip install jupyter notebook scikit-learn sklearn numpy scipy

WORKDIR /work

ENTRYPOINT ["jupyter-notebook", "--ip=0.0.0.0", "--port=6565", "--allow-root"]
