FROM amazonlinux:2 AS builder
WORKDIR /root
RUN yum install tar gzip -y
COPY server-jre-8u172-linux-x64.tar.gz .
RUN echo "3d0a5db2300423a1fd6ee25c229dbd5320d79204c73844337f5b6a082d58541f *server-jre-8u172-linux-x64.tar.gz" > server-jre-8u172-linux-x64.tar.gz-CHECKSUM
RUN sha256sum -c server-jre-8u172-linux-x64.tar.gz-CHECKSUM
RUN tar xvzf server-jre-8u172-linux-x64.tar.gz

FROM amazonlinux:2

COPY --from=builder /root/jdk1.8.0_172/jre /usr/jre
ENV PATH="/usr/jre/bin:${PATH}"
