# Booking-transport-tickets-system
Система бронирования транспортных билетов

Пользователи БД СУБД Oracle:
1) SYS
Username: oracle
Password: oracle
2) Пользователь чтобы юзать БД с сервера
Username: developer
Password: developer

Пользователи БД СУБД PostgreSQL:
Username: developer
Password: developer

Команда запуска контейнера Oracle: 
sudo docker run -d -p 49161:1521 victorgrachev/database_btts

Команда запуска контейнера PostgreSQL:
sudo docker run -d -p 5432:5432 