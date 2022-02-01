FROM openjdk:13.0.2

ARG liquibase_version=3.6.3
ARG liquibase_download_url=https://github.com/liquibase/liquibase/releases/download/liquibase-parent-${liquibase_version}
ARG tarfile=liquibase-${liquibase_version}-bin.tar.gz

WORKDIR /workspace

# ENV DERBY_PORT=${DERBY_PORT:-1527}\
#     LIQUIBASE_CLASSPATH=${LIQUIBASE_CLASSPATH:-/opt/jdbc-driver/derbytools.jar}\
#     LIQUIBASE_CHANGELOGFILE=${LIQUIBASE_CHANGELOGFILE:-changelog.xml}\
#     DERBY_PORT=${DERBY_PORT:-1527}\
#     DERBY_HOST=${DERBY_HOST:-localhost}\
#     DERBY_DB=${DERBY_DB:-dbtest}\
#     LIQUIBASE_DEFAULTSCHEMA=${LIQUIBASE_DEFAULTSCHEMA:-app}
ENV LIQUIBASE_CLASSPATH=${LIQUIBASE_CLASSPATH:-/opt/jdbc-driver/mariadb-java-client-2.4.3.jar}\
    LIQUIBASE_DRIVER=${LIQUIBASE_DRIVER:-org.mariadb.jdbc.Driver}

ADD ${liquibase_download_url}/${tarfile} /tmp/${tarfile}
ADD https://downloads.mariadb.com/Connectors/java/connector-java-2.4.3/mariadb-java-client-2.4.3.jar /tmp/mariadb-java-client-2.4.3.jar

ADD run.sh /run.sh


RUN mkdir -p /opt/liquibase && \
    chmod +x /run.sh && \
    tar -xzf /tmp/${tarfile} -C /opt/liquibase/ && \
    mkdir /opt/jdbc-driver/ -p && \
    cp /tmp/mariadb-java-client-2.4.3.jar /opt/jdbc-driver/ && \
    chmod +x /opt/liquibase/liquibase && \
    rm /tmp/${tarfile} /tmp/mariadb-java-client-2.4.3.jar -Rf && \
    ln -s /opt/liquibase/liquibase /usr/local/bin/liquibase

ENTRYPOINT [ "/run.sh" ]
