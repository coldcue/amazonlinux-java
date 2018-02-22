FROM amazonlinux:2 AS builder
WORKDIR /root
RUN yum install tar -y
COPY serverjre-9.0.4_linux-x64_bin.tar.gz .
RUN echo "d29b6b3008c814abd8ab5e4bde9278d6ee7699898333992ee8d080612b5197ca *serverjre-9.0.4_linux-x64_bin.tar.gz" > serverjre-9.0.4_linux-x64_bin.tar.gz-CHECKSUM
RUN sha256sum -c serverjre-9.0.4_linux-x64_bin.tar.gz-CHECKSUM
RUN tar xvzf serverjre-9.0.4_linux-x64_bin.tar.gz

FROM amazonlinux:2

COPY --from=builder /root/jdk-9.0.4/ /usr/java
ENV PATH="/usr/java/bin:${PATH}"
