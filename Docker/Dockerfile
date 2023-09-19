FROM ubuntu:20.04

MAINTAINER bhaas@broadinstitute.org


ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y gcc g++ perl python3 automake make cmake \
                                       wget curl libdb-dev \
				       bzip2 zlibc zlib1g zlib1g-dev  default-jre \
                       python-setuptools python-dev build-essential \
				       unzip libbz2-dev  liblzma-dev && \
    apt-get clean



# Set the locale
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
        update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8


RUN apt-get install -y git && apt-get clean

RUN ln -sf /usr/bin/python3 /usr/bin/python

RUN apt-get install -y python3-distutils

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py

RUN pip install numpy


RUN curl -L https://cpanmin.us | perl - App::cpanminus

## set up tool config and deployment area:

ENV SRC /usr/local/src
ENV BIN /usr/local/bin

ENV DATA /usr/local/data
RUN mkdir $DATA


## perl lib installations

RUN cpanm install PerlIO::gzip
RUN cpanm install Set::IntervalTree
RUN cpanm install DB_File
RUN cpanm install URI::Escape
RUN cpanm install Carp::Assert
RUN cpanm install JSON::XS.pm


######################
## Tool installations:
######################


########
# Samtools
 
ENV SAMTOOLS_VERSION=1.9

RUN SAMTOOLS_URL="https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2" && \
   cd $SRC && \
   wget $SAMTOOLS_URL && \
   tar xvf samtools-${SAMTOOLS_VERSION}.tar.bz2 && \
   cd samtools-${SAMTOOLS_VERSION}/htslib-${SAMTOOLS_VERSION} && ./configure && make && make install && \
   cd ../ && ./configure --without-curses && make && make install



## Bowtie2
WORKDIR $SRC
RUN wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.3.3.1/bowtie2-2.3.3.1-linux-x86_64.zip/download -O bowtie2-2.3.3.1-linux-x86_64.zip && \
    unzip bowtie2-2.3.3.1-linux-x86_64.zip && \
    mv bowtie2-2.3.3.1-linux-x86_64/bowtie2* $BIN && \
    rm *.zip && \
    rm -r bowtie2-2.3.3.1-linux-x86_64

## Jellyfish
WORKDIR $SRC
RUN wget https://github.com/gmarcais/Jellyfish/releases/download/v2.2.7/jellyfish-2.2.7.tar.gz && \
    tar xvf jellyfish-2.2.7.tar.gz && \
    cd jellyfish-2.2.7/ && \
    ./configure && make && make install && \
    ln -sf $SRC/jellyfish-2.2.7/bin/jellyfish $BIN/.



########
# Trinity

ENV TRINITY_VERSION=2.14.0

RUN TRINITY_URL="https://github.com/trinityrnaseq/trinityrnaseq/releases/download/Trinity-v${TRINITY_VERSION}/trinityrnaseq-v${TRINITY_VERSION}.FULL.tar.gz" && \
   cd $SRC && \
   wget $TRINITY_URL && \
   tar xvf trinityrnaseq-v${TRINITY_VERSION}.FULL.tar.gz && \
   cd trinityrnaseq-v${TRINITY_VERSION} && make


ENV TRINITY_HOME /usr/local/src/trinityrnaseq-v${TRINITY_VERSION}

ENV PATH=${PATH}:${TRINITY_HOME}

## Salmon
WORKDIR $SRC
ENV SALMON_VERSION=1.5.2
RUN wget https://github.com/COMBINE-lab/salmon/releases/download/v${SALMON_VERSION}/Salmon-${SALMON_VERSION}_linux_x86_64.tar.gz && \
    tar xvf Salmon-${SALMON_VERSION}_linux_x86_64.tar.gz && \
    ln -sf $SRC/salmon-${SALMON_VERSION}_linux_x86_64/bin/salmon $BIN/.



########
## TrinityFusion


RUN apt-get install -y curl python3-dev
RUN pip install pysam

WORKDIR $SRC

ENV TrinityFusionVersion 0.4.0
ENV TrinityFusion_CO 0ccd3126e104ce0cdf5d1976d409cbc585717a03

RUN git clone https://github.com/trinityrnaseq/TrinityFusion.git && \
	cd TrinityFusion && \
    git checkout ${TrinityFusion_CO} && \
    git submodule init && git submodule update && \
    git submodule foreach --recursive git submodule init && \
    git submodule foreach --recursive git submodule update && \
    cd CTAT-LR-fusion && make

