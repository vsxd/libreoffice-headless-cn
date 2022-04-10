FROM --platform=amd64 ubuntu:20.04

LABEL maintainer="vsxd <sun.xd@hotmail.com>" \
	  version.ubuntu="20.04"

ENV DEBIAN_FRONTEND noninteractive

RUN sed -i 's/ports.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
	sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
	apt-get update && \
	apt-get install -y locales tzdata xfonts-wqy && \
	locale-gen zh_CN.UTF-8 && \
	update-locale LANG=zh_CN.UTF-8 LANGUAGE=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8 && \
	ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	dpkg-reconfigure --frontend noninteractive tzdata && \
	find /var/lib/apt/lists -type f -delete && \
	find /var/cache -type f -delete

ENV LANG=zh_CN.UTF-8 LANGUAGE=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8

# ADD ./source-han-sans-and-serif.tar.gz /usr/share/fonts/

RUN apt-get update && \
	apt-get -y -q install \
		libreoffice \
		libreoffice-writer \
		ure \
		libreoffice-java-common \
		libreoffice-core \
		libreoffice-common \
		openjdk-8-jre \
		fonts-opensymbol \
		hyphen-fr \
		hyphen-de \
		hyphen-en-us \
		hyphen-it \
		hyphen-ru \
		ttf-wqy-microhei \
		ttf-wqy-zenhei \
		fonts-dejavu \
		fonts-dejavu-core \
		fonts-dejavu-extra \
		fonts-droid-fallback \
		fonts-dustin \
		fonts-f500 \
		fonts-fanwood \
		fonts-freefont-ttf \
		fonts-liberation \
		fonts-lmodern \
		fonts-lyx \
		fonts-sil-gentium \
		fonts-texgyre \
		fonts-tlwg-purisa && \
	apt-get -y -q remove libreoffice-gnome && \
	apt -y autoremove && \
	find /var/lib/apt/lists -type f -delete && \
	find /var/cache -type f -delete

VOLUME ["/tmp"]

WORKDIR "/tmp"

ENTRYPOINT ["/usr/bin/libreoffice", "--nologo", "--norestore", "--nolockcheck", "--nodefault", "--invisible", "--headless"]
