FROM quay.io/volvocars/base:latest  #Add functionality to fetch base based on images used in jhub

MAINTAINER Leonard Aukea <leonard.aukea@volvocars.com>

ENV LANG en_US.utf8

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk --update add bash curl ca-certificates libstdc++ glib \
    && curl "https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub" -o /etc/apk/keys/sgerrand.rsa.pub \
    && curl -L "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk" -o glibc.apk \
    && apk add --allow-untrusted glibc.apk \
    && curl -L "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-bin-2.23-r3.apk" -o glibc-bin.apk \
    && apk add --allow-untrusted glibc-bin.apk \
    && apk add g++ gcc unixodbc-dev \
    && curl -L "https://github.com/andyshinn/alpine-pkg-glibc/releases/download/2.25-r0/glibc-i18n-2.25-r0.apk" -o glibc-i18n.apk \
    && apk add --allow-untrusted glibc-i18n.apk \
    && /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 \
    && /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc/usr/lib \
    && rm -rf glibc*apk /var/cache/apk/* \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh

# Install standard python libs
RUN conda install -y python=3 \
    && conda install -y ipykernel \
    && conda update conda \
    && conda clean --all --yes
RUN pip install --upgrade pip papermill pandas boto3 psycopg2 sqlalchemy

COPY src/run_notebook.sh ./
ENTRYPOINT ["bash", "./run_notebook.sh"]

