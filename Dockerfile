FROM ppc64le/centos
RUN yum install -y openssh*
RUN yum install -y yum psmisc
RUN yum install -y sysstat
RUN yum install -y nano wget curl net-tools lsof
RUN yum install -y sg3_utils
RUN yum install -y java-1.8.0-openjdk
USER root
WORKDIR /root
ADD  dt7_rest.tar.gz /root
COPY start.sh /root/start.sh
ENTRYPOINT ["/root/start.sh"]
