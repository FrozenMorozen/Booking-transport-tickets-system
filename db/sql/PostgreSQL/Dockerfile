FROM postgres:12.2
MAINTAINER Grachev Victor <victorgrachev@mail.ru>
COPY Create_user.sql /docker-entrypoint-initdb.d/
COPY Create_table.sql /docker-entrypoint-initdb.d/
COPY Grant_table.sql /docker-entrypoint-initdb.d/
COPY postgresql.conf /etc/postgresql
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]