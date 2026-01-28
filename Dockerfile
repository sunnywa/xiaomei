# 使用 Ubuntu 20.04 LTS 作为基础镜像
FROM ubuntu:20.04

# 更新包列表并安装必要的工具
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
    wget \
    vim \
    && rm -rf /var/lib/apt/lists/*


# 暴露 nginx 端口
EXPOSE 80

# 设置 nginx 以非守护进程模式运行，并作为主进程
CMD ["nginx", "-g", "daemon off;"]
