# 使用 Ubuntu 20.04 LTS 作为基础镜像
FROM swr.cn-north-4.myhuaweicloud.com/ddn-k8s/quay.io/centos/centos:7.6.1810

# 设置中文语言环境（可选）
ENV LANG=en_US.UTF-8

# 安装 EPEL 仓库
RUN yum install -y epel-release

# 更新系统并安装必要的工具
RUN yum update -y && yum install -y \
    nginx \
    stress-ng \
    fio \
    iperf3 \
    sysstat \
    bc \
    procps-ng \
    python3 \
    wget \
    vim \
    net-tools \
    pciutils \
    && yum clean all

# 暴露 nginx 端口
EXPOSE 80

# 设置 nginx 以非守护进程模式运行，并作为主进程
CMD ["nginx", "-g", "daemon off;"]
