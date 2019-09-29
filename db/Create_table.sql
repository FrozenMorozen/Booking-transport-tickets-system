-- Create table 
-- Страна
create table tab#сountry (at#id integer primary key
                          , at#name_country varchar2(200));
-- Город
create table tab#city (at#id integer primary key
                      , ref#country number
                      , at#name_city varchar2(200)
                      , constraint fk#tab#сountry foreign key (ref#country) references tab#сountry(at#id));
-- Станция
create table tab#station (at#id integer primary key
                         , ref#city number
                         , at#name_station number
                         , constraint fk#tab#city foreign key (ref#city) references tab#city(at#id));
-- Расстояние между станциями
create table tab#distances_station ( at#id integer primary key
                                   , ref#station_A number
                                   , ref#station_B number
                                   , at#value number
                                   , at#unit varchar2(20)
                                   , constraint fk#tab#station_A foreign key (ref#station_A) references tab#station(at#id)
                                   , constraint fk#tab#station_B foreign key (ref#station_B) references tab#station(at#id));
-- Типы вагонов
create table tab#type_railway_car ( at#id integer primary key
                                  , at#name_type varchar2(200));
-- Схема посадочных мест
create table tab#seating_railway_car(at#id integer primary key
                                    , at#number_seat varchar2(3)
                                    , ref#type number
                                    , constraint pk#tab#seating_railway_car unique (at#number_seat, ref#type)
                                    , constraint fk#tab#type_railway_car foreign key (ref#type) references tab#type_railway_car(at#id));
-- Парк вагонов
create table tab#park_rail_car ( at#id integer primary key
                               , ref#type number
                               , at#number number
                               , constraint fk#tab#type_railway_car_2 foreign key (ref#type) references tab#type_railway_car(at#id));
-- Поезда
create table tab#train (at#id integer primary key
                       , at#name_traint varchar2(100)
                       , at#date_departure date
                       , ref#station_A number
                       , ref#station_B number
                       , constraint fk#tab#station_A_2 foreign key (ref#station_A) references tab#station(at#id)
                       , constraint fk#tab#station_B_2 foreign key (ref#station_B) references tab#station(at#id));
-- Таблица связь поезда и его вагонов
create table tab#train_park_car ( at#id integer primary key
                                , ref#train number
                                , ref#rail_car number
                                , constraint fk#tab#train foreign key (ref#train) references tab#train(at#id)
                                , constraint fk#tab#park_rail_car foreign key (ref#rail_car) references tab#park_rail_car(at#id));
-- Данные пассажиров
create table tab#passenger (at#id integer primary key
                           , ref#parent_id number
                           , at#last_name varchar2(1000)
                           , at#first_name varchar2(1000)
                           , at#birthday date
                           , at#ser_pas number
                           , at#num_pas number);
-- История бронирования 
create table tab#history_reservation ( at#id integer primary key
                                     , at#date_resert date
                                     , at#end_date_resert date
                                     , ref#passenger number
                                     , ref#seat number
                                     , constraint fk#tab#passenger foreign key (ref#passenger) references tab#passenger(at#id)
                                     , constraint fk#tab#seating_railway_car foreign key (ref#seat) references tab#seating_railway_car(at#id)
                                     );
-- Расписание поездов
create table tab#train_schedule ( at#id integer primary key
                                , at#date_coming date
                                , ref#station_A number
                                , at#date_incoming date
                                , ref#station_B number
                                , at#time_stop number
                                , at#unit varchar2(20)
                                , constraint fk#tab#station_A_3 foreign key (ref#station_A) references tab#station(at#id)
                                , constraint fk#tab#station_B_3 foreign key (ref#station_B) references tab#station(at#id)); 
                                );                           
