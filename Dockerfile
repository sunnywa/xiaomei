# 使用 Ubuntu 20.04 LTS 作为基础镜像
FROM ubuntu:20.04

# 设置非交互式环境变量，避免安装过程中出现提示
ENV DEBIAN_FRONTEND=noninteractive

# 更新包列表并安装必要的工具
# RUN apt-get update && apt-get install -y \
#     nginx \
#     stress-ng \
#     fio \
#     iperf3 \
#     sysstat \
#     bc \
#     procps \
#     python3 \
#     curl \
#     wget \
#     vim \
#     && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    nginx \
    stress-ng \
    fio \
    iperf3 \
    sysstat \
    bc \
    procps \
    python3 \
    curl \
    coreutils \
    perl \
    linux-tools-$(uname -r) linux-headers-$(uname -r) linux-tools-common \
    kmod \
    iputils-ping \
    util-linux \
    netcat-openbsd \
    strace \
    tcpdump \
    nmap \
    dnsutils \
    telnet \
    socat \
    lsof \
    htop \
    ltrace \
    gdb \
    tree \
    jq \
    openssl \
    cgroup-tools \
    git \
    make \
    gcc \
    wget \
    vim \
    && rm -rf /var/lib/apt/lists/*

# 创建必要的目录
RUN mkdir -p /var/www/html && mkdir -p /test

# 暴露 nginx 端口
EXPOSE 80

# 设置 nginx 以非守护进程模式运行，并作为主进程
CMD ["nginx", "-g", "daemon off;"]
