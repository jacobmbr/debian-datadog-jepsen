# FIXME: tutum/debian will be deprecated soon: https://github.com/tutumcloud/tutum-debian/blob/master/README.md
FROM tutum/debian:jessie

RUN rm /etc/apt/apt.conf.d/docker-clean && apt-get update
RUN apt install software-properties-common -y
RUN apt install apt-transport-https -y
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 382E94DE
RUN apt-add-repository "deb https://apt.datadoghq.com/ stable 6"
RUN apt update
RUN apt install datadog-agent

RUN apt-get install -y bzip2 curl faketime iproute iptables iputils-ping libzip2 logrotate man man-db net-tools ntpdate psmisc python rsyslog sudo sysvinit sysvinit-core sysvinit-utils tar unzip vim wget && apt-get remove -y --purge --auto-remove systemd
