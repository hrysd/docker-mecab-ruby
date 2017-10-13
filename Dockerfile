FROM ruby:2.4

ENV LANG=C.UTF-8

RUN curl -L -o mecab-0.996.tar.gz "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE" \
      && tar zxfv mecab-0.996.tar.gz \
      && rm mecab-0.996.tar.gz \
      && cd mecab-0.996 \
      && ./configure \
      && make \
      && make check \
      && make install

RUN ldconfig

RUN curl -L -o mecab-ipadic-2.7.0-20070801.tar.gz "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM" \
      && tar zxfv mecab-ipadic-2.7.0-20070801.tar.gz \
      && rm mecab-ipadic-2.7.0-20070801.tar.gz \
      && cd mecab-ipadic-2.7.0-20070801 \
      && ./configure --with-charset=utf8 \
      && make \
      && make install

RUN gem update --system
RUN gem install mecab
