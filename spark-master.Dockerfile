#1 define java version to be used
FROM openjdk:8
ARG MAVEN_VERSION=3.8.6

# 2- Define a constant with the working directory
ARG USER_HOME_DIR="/root"

# 3- Define the SHA key to v

# 4- Define the URL where maven can be downloaded from
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries
RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && echo "Downloading maven" \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  \
  && echo "Unziping maven" \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  \
  && echo "Cleaning and setting links" \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

# 5- Define environmental variables required by Maven, like Maven_Home directory and where the maven repo is located
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
ARG shared_workspace=/opt/workspace

ENV SHARED_WORKSPACE=${shared_workspace}

VOLUME ${shared_workspace}
CMD ["bash"]
#6 Now proceed with setting up spark
ARG spark_version=3.3.1
ARG hadoop_version=3

RUN apt-get update -y && \
    apt-get install -y curl && \
    curl https://archive.apache.org/dist/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop${hadoop_version}.tgz -o spark.tgz && \
    tar -xf spark.tgz && \
    mv spark-${spark_version}-bin-hadoop${hadoop_version} /usr/bin/ && \
    mkdir /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/logs && \
    rm spark.tgz

ENV SPARK_HOME /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}
ENV SPARK_MASTER_HOST spark-master
ENV SPARK_MASTER_PORT 7077
# mvn can also be packaged within the container
#EXPOSE ${spark_master_web_ui} ${SPARK_MASTER_PORT}
##CMD bin/spark-class org.apache.spark.deploy.master.Master >> logs/spark-master.out
##CMD mvn package
##CMD bin/spark-submit --class "com.example.IndexCreate" --master local[4] target/demo-1.0.0.jar
#RUN mvn package
WORKDIR usr/src/SparkApp
ENV SPARK_APP /usr/src/SparkApp/SparkCode
COPY . .
#RUN /bin/bash -c 'mvn clean package'
#ENTRYPOINT ["java","-jar","target/demo-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080:8080
#ENTRYPOINT ["java","-jar","target/spring-boot-0.0.1-SNAPSHOT.jar"]
