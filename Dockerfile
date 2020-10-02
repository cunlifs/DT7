FROM ppc64le/centos
ENV http_proxy http://9.196.156.29:3128
ENV https_proxy http://9.196.156.29:3128
RUN yum install -y openssh*
RUN yum install -y yum psmisc
RUN yum install -y sysstat
RUN yum install -y nano wget curl net-tools lsof
RUN yum install -y sg3_utils
RUN yum install -y java-1.8.0-openjdk
USER root
EXPOSE 80 8080
WORKDIR /root
ADD https://github.com/cunlifs/DT7/releases/tag/v1/dt7_rest.tar.gz /root/
#ADD  dt7_rest.tar.gz /root
#COPY start.sh /root/start.sh
#RUN chmod +x /root/start.sh
#ENTRYPOINT ["/root/start.sh"]
CMD sleep 60000
