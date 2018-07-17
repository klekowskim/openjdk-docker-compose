FROM gitlab/dind

RUN apt-get update && apt-get -y install \
    curl openssl ca-certificates openssl
    # OpenJdk
RUN wget https://download.java.net/java/GA/jdk10/10.0.1/fb4372174a714e6b8c52526dc134031e/10/openjdk-10.0.1_linux-x64_bin.tar.gz \
        && mkdir /usr/share/java
RUN tar xzf openjdk-10.0.1_linux-x64_bin.tar.gz -C /usr/share/java \
        && rm openjdk-10.0.1_linux-x64_bin.tar.gz \
        && ls /usr/share/java \
        && chmod +x /usr/share/java/jdk-10.0.1/bin

ENV JAVA_HOME /usr/share/java/jdk-10.0.1
ENV PATH="${JAVA_HOME}/bin:${PATH}"

RUN java --version