FROM postgres:12.2
COPY Create_user_1.sql /docker-entrypoint-initdb.d/
COPY Create_table_2.sql /docker-entrypoint-initdb.d/
COPY Grant_table_3.sql /docker-entrypoint-initdb.d/
COPY postgresql.conf /etc/postgresql
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]