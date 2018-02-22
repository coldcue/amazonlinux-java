FROM amazonlinux:2 AS builder
WORKDIR /root
RUN yum install tar -y
COPY server-jre-8u161-linux-x64.tar.gz .
RUN echo "eb5776cacfd57fbf0ffb907f68c58a1cc6f823e761f4e75d78a6e3240846534e *server-jre-8u161-linux-x64.tar.gz" > server-jre-8u161-linux-x64.tar.gz-CHECKSUM
RUN sha256sum -c server-jre-8u161-linux-x64.tar.gz-CHECKSUM
RUN tar xvzf server-jre-8u161-linux-x64.tar.gz

FROM amazonlinux:2

COPY --from=builder /root/jdk1.8.0_161/jre /usr/jre
ENV PATH="/usr/jre/bin:${PATH}"
