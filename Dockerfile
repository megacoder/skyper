FROM	fedora:latest
WORKDIR	/tmp
USER	root
ADD	skypeforlinux-64-alpha.rpm /tmp
RUN	export PATH=/bin:/sbin:/usr/bin:/usr/sbin;			\
	echo 'proxy=http://proxy.darkzone.un:3128' >>/etc/yum.conf;	\
	dnf update -y;							\
	dnf install -y /tmp/skypeforlinux-64.alpha.rom;			\
	dnf install -y zsh;						\
	groupadd gods;							\
	useradd -s /bin/zsh -G gods -m -c 'Tommy Reynolds' reynolds;	\
	date
CMD	[ "/bin/zsh", "-l" ]
