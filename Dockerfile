FROM amazonlinux:2 AS builder
WORKDIR /root
RUN yum install wget tar -y
RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/server-jre-8u152-linux-x64.tar.gz
RUN echo "7307a55dc385921c7d9fb90bd84c452df26ba05261e907713bd731d5f78b15cc *server-jre-8u152-linux-x64.tar.gz" > server-jre-8u152-linux-x64.tar.gz-CHECKSUM
RUN sha256sum -c server-jre-8u152-linux-x64.tar.gz-CHECKSUM
RUN tar xvzf server-jre-8u152-linux-x64.tar.gz

FROM amazonlinux:2

COPY --from=builder /root/jdk1.8.0_152/jre /usr/jre
ENV PATH="/usr/jre/bin:${PATH}"
