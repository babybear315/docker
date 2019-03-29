FROM centos:7

ARG JAVA_MAJOR_VERSION=8
ARG JAVA_UPDATE_VERSION=201
ARG JAVA_BUILD_NUMER=09
ARG JAVA_SID=42970487e3af4f5aa5bca3f542482c60

ENV JAVA_HOME=/usr/local/java
ENV CLASSPATH=./:$JAVA_HOME/lib:$JAVA_HOME/jre/lib/ext
ENV PATH=$PATH:$JAVA_HOME/bin:$JAVA_HOME/jre/bin
ENV TZ=Asia/Taipei

RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& curl -s -L --header "Cookie: oraclelicense=accept-securebackup-cookie;" --url "http://download.oracle.com/otn-pub/java/jdk/${JAVA_MAJOR_VERSION}u${JAVA_UPDATE_VERSION}-b${JAVA_BUILD_NUMER}/${JAVA_SID}/jdk-${JAVA_MAJOR_VERSION}u${JAVA_UPDATE_VERSION}-linux-x64.tar.gz" | tar xz -C /usr/local \
&& ln -s /usr/local/jdk1.${JAVA_MAJOR_VERSION}.0_${JAVA_UPDATE_VERSION} /usr/local/java \
&& echo "JAVA_HOME=$JAVA_HOME" >> /etc/profile \
&& echo "CLASSPATH=./:\$JAVA_HOME/lib:\$JAVA_HOME/jre/lib/ext" >> /etc/profile \
&& echo "PATH=\$PATH:\$JAVA_HOME/bin:\$JAVA_HOME/jre/bin" >> /etc/profile \
&& echo "export PATH JAVA_HOME CLASSPATH" >> /etc/profile
