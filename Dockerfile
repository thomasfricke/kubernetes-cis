FROM debian

ADD kubernetes-cis-benchmark /kubernetes-cis-benchmark
WORKDIR /kubernetes-cis-benchmark
RUN sed s+/etc+/host/etc+ -i */*.sh */*/*.sh
RUN apt-update && apt install -y procps curl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x kubectl && mv kubectl /usr/local/bin
