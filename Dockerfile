FROM	fedora:latest
WORKDIR	/tmp
USER	root
ADD	skypeforlinux-64-alpha.rpm /tmp
RUN	export PATH=/bin:/sbin:/usr/bin:/usr/sbin;			\
	echo 'proxy=http://proxy.darkzone.un:3128' >>/etc/yum.conf;	\
	/bin/dnf install -y deltarpms;					\
	/bin/dnf update -y;						\
	/bin/dnf install -y						\
		/tmp/skypeforlinux-64-alpha.rpm				\
		hostname						\
		sudo							\
		zsh;							\
	groupadd gods;							\
	useradd -s /bin/zsh -G gods -m -c 'Tommy Reynolds' reynolds;	\
	echo '%gods ALL=(ALL) NOPASSWD: ALL' >>/etc/sudoers
CMD	[ "/bin/zsh", "-l" ]
