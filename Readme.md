# Debezium
#### Sync Database Source to Database Destination


## Table of Contents
1. [Introduction](#introduction)
2. [Requirements](#requirements)
3. [Installation](#installation)
4. [Configuration](#configuration)
5. [ManualTest](#manualtest)


## Introduction
This project is a simple example of how to use Debezium to sync data from one database to another. In this case, we are syncing data from the `source-db` database to the `destination-db` database. The `source-db` database is a MySQL database and the `destination-db` database is a PostgreSQL database.


## Requirements
- Docker
- Docker Compose
- MySQL
- PostgreSQL
- Debezium
- Kafka
- Zookeeper
- Kafka Connect JDBC
- Kafka Connect Debezium


## Installation
1. Clone the repository
2. Run the following command to start the services:
```bash
docker-compose up -d --build
```
3. When the services are up and running, You can open makefile and run the following command to create the connectors:
```bash
make registry
```
4. You can check the plugins running with the following command:
```bash
make plugins
```
5. You can check the connectors running with the following command:
```bash
make connectors
```

## Configuration
1. You can change the configuration of the connectors in the `.docker/debezium/connectors` directory.
2. You can change the configuration of the databases in the `.docker/postgres/config/postgres.cnf` and `.docker/mysql/config/mysql.cnf` files.
3. You can change the configuration of the services in the `.docker/docker-compose.yml` file.


## ManualTest
1. Open Mysql Connection with the following command:
```bash
docker exec -it mysql_cdc /bin/sh -c "mysql -u root -p"
```

2. Create a new database:
```sql
INSERT INTO a_profile(id, name,verified, mobile, email, created_at) values
                                                       (1, 'Amin', 'Y', '+989119119191', 'INFO@Ghaninia.ir', NOW());
```

3. Open PostgreSQL Connection with the following command:
```bash
docker exec -it postgres_cdc /bin/sh -c "psql -U destination-db -d destination-db"
```

4. Check the data in the `a_profile` table:
```sql
SELECT * FROM profiles;
```

5. You should see the data that you inserted in the MySQL database in the PostgreSQL database.

6. Down the services:
```bash
docker-compose down -v && docker volume prune
```