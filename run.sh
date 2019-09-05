#!/bin/bash

#check vars
if [ -z "$LIQUIBASE_CHANGELOGFILE" ]
then
  echo "\$LIQUIBASE_CHANGELOGFILE is empty.Exit"
  exit 1
fi

if [ -z "$MARIADB_HOST" ]
then
  echo "\$MARIADB_HOST is empty.Exit"
  exit 1
fi

if [ -z "$MARIADB_DB" ]
then
  echo "\$MARIADB_HOST is empty.Exit"
  exit 1
fi

if [ -z "$MARIADB_PORT" ]
then
  echo "\$MARIADB_PORT is empty.Exit"
  exit 1
fi

if [ -z "$MARIADB_USER" ]
then
  echo "\$MARIADB_USER is empty.Exit"
  exit 1
fi

if [ -z "$MARIADB_PASS" ]
then
  echo "\$MARIADB_PASS is empty.Exit"
  exit 1
fi

/usr/local/bin/liquibase --classpath=${LIQUIBASE_CLASSPATH} --changeLogFile=${LIQUIBASE_CHANGELOGFILE} --url="jdbc:mariadb://${MARIADB_HOST}:${MARIADB_PORT}/${MARIADB_DB}" --username=${MARIADB_USER} --password=${MARIADB_PASS} $@