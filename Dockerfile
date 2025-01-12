FROM continuumio/anaconda3

# 必要なライブラリをインストールします
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    g++ \
    gcc \
    libgl1-mesa-dev \
    make \
    unzip \
    chromium \
    udev \
    libzbar-dev \
    build-essential \
    libta-lib0 \
    libta-lib-dev

# フォントインストール
RUN wget https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip -O /tmp/fonts_noto.zip && \
    mkdir -p /usr/share/fonts &&\
    unzip /tmp/fonts_noto.zip -d /usr/share/fonts

# 必要なライブラリをインストールします
RUN pip install --upgrade pip
RUN pip install \
    aioinflux \
    backtesting \
    ccxt \
    data_cache \
    gast \
    git+https://github.com/richmanbtc/crypto_data_fetcher.git@v0.0.14#egg=crypto_data_fetcher \
    git+https://github.com/twopirllc/pandas-ta

RUN pip install \
    hyperas \
    hyperopt==0.2.5 \
    influxdb \
    influxdb-client \
    japanize-matplotlib \
    joblib \
    keras \
    line-bot-sdk \
    mlflow \
    mplfinance \
    nest-asyncio \
    numpy

RUN pip install \
    opencv-contrib-python \
    pandas \
    pandarallel \
    pyppeteer \
    py4j \
    scikit-learn \
    scipy \
    seaborn \
    shap \
    slicer \
    sqlalchemy

RUN pip install tensorflow-datasets &&\
    pip install xgboost &&\
    pip install ipyleaflet &&\
    pip install TA-Lib-Precompiled &&\
    pip install pybotters &&\
    pip install pandas_ta &&\
    pip install telethon &&\
    pip install lightgbm &&\
    pip install scikit-optimize &&\
    pip install html5lib


RUN pip install \
    paramiko \
    openapi-spec-validator \
    albumentations \
    onnxruntime \
    onnx

RUN pip install -U jupyterlab

ARG USERNAME=jnbuser
ARG GROUPNAME=jnbuser
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME
