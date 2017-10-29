FROM python:3.5
LABEL maintainer="elrichxu@gmail.com"
ADD . /root/code
WORKDIR /root/code
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
RUN apt-get update
RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
RUN pip install -U pip setuptools cython -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install bcolz -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
  tar -xvzf ta-lib-0.4.0-src.tar.gz && \
  cd ta-lib/ && \
  ./configure --prefix=/usr && \
  make && \
  make install
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple TA-Lib
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple rqalpha
RUN rqalpha version
RUN rqalpha update_bundle
# CMD make run
