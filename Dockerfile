FROM amazonlinux:2 AS builder
WORKDIR /root
RUN yum install tar -y
COPY server-jre-8u162-linux-x64.tar.gz .
RUN echo "6942684acb6001748a01fc090a18f52ebd8cbfcf7be27ec6131981906bfa8b53 *server-jre-8u162-linux-x64.tar.gz" > server-jre-8u162-linux-x64.tar.gz-CHECKSUM
RUN sha256sum -c server-jre-8u162-linux-x64.tar.gz-CHECKSUM
RUN tar xvzf server-jre-8u162-linux-x64.tar.gz

FROM amazonlinux:2

COPY --from=builder /root/jdk1.8.0_162/jre /usr/jre
ENV PATH="/usr/jre/bin:${PATH}"
