FROM debezium/connect:2.7.3.Final

WORKDIR /kafka/connect/plugins


RUN echo "Start downloading JDBC connectors"
RUN curl -L -o kafka-connect-jdbc.zip https://github.com/confluentinc/kafka-connect-jdbc/archive/refs/tags/v10.8.0.zip
RUN unzip kafka-connect-jdbc.zip && \
    mv kafka-connect-jdbc-10.8.0 kafka-connect-jdbc && \
    rm kafka-connect-jdbc.zip


RUN echo "Downloading Postgres Driver"
RUN curl -L -o postgresql-42.7.2.jar https://jdbc.postgresql.org/download/postgresql-42.7.2.jar

RUN mkdir -p /kafka/connect/jdbc
RUN mv postgresql-42.7.2.jar /kafka/connect/jdbc

# install JSONata Transform plugin
RUN echo "Start downloading JSONata Transform plugin"
RUN curl -L -o rayokota-kafka-connect-jsonata-0.1.0.zip  https://hub-downloads.confluent.io/api/plugins/rayokota/kafka-connect-jsonata/versions/0.1.0/rayokota-kafka-connect-jsonata-0.1.0.zip
RUN unzip rayokota-kafka-connect-jsonata-0.1.0.zip && \
    rm rayokota-kafka-connect-jsonata-0.1.0.zip