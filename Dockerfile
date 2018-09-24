FROM amazonlinux:2 AS builder
WORKDIR /root
RUN yum install tar gzip -y
COPY serverjre-10.0.2_linux-x64_bin.tar.gz .
RUN echo "4ca492e0dd46c51bb3263d7347f6ede04fceb07fde3f01fed2c0336b18596c41 *serverjre-10.0.2_linux-x64_bin.tar.gz" > serverjre-10.0.2_linux-x64_bin.tar.gz-CHECKSUM
RUN sha256sum -c serverjre-10.0.2_linux-x64_bin.tar.gz-CHECKSUM
RUN tar xvzf serverjre-10.0.2_linux-x64_bin.tar.gz

FROM amazonlinux:2

COPY --from=builder /root/jdk-10.0.2/ /usr/java
ENV PATH="/usr/java/bin:${PATH}"
