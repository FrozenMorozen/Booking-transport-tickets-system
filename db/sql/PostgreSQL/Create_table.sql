-- Create table 
-- Страна
create table tab_сountry (at_id numeric primary key
                          , at_name_country varchar(200));
-- Город
create table tab_city (at_id numeric primary key
                      , ref_country numeric 
                      , at_name_city varchar(200)
                      , constraint fk_tab_сountry foreign key (ref_country) references tab_сountry(at_id));
-- Станция
create table tab_station (at_id numeric primary key
                         , ref_city numeric
                         , at_name_station varchar(200)
                         , constraint fk_tab_city foreign key (ref_city) references tab_city(at_id));
-- Расстояние между станциями
create table tab_distances_station ( at_id numeric primary key
                                   , ref_station_A numeric
                                   , ref_station_B numeric
                                   , at_value numeric
                                   , at_unit varchar(20)
                                   , constraint fk_tab_station_A foreign key (ref_station_A) references tab_station(at_id)
                                   , constraint fk_tab_station_B foreign key (ref_station_B) references tab_station(at_id));
-- Типы вагонов
create table tab_type_railway_car ( at_id numeric primary key
                                  , at_name_type varchar(200));
-- Схема посадочных мест
create table tab_seating_railway_car(at_id numeric primary key
                                    , at_number_seat varchar(3)
                                    , ref_type numeric
                                    , constraint pk_tab_seating_railway_car unique (at_number_seat, ref_type)
                                    , constraint fk_tab_type_railway_car foreign key (ref_type) references tab_type_railway_car(at_id));
-- Парк вагонов
create table tab_park_rail_car ( at_id numeric primary key
                               , ref_type numeric
                               , at_number numeric
                               , constraint fk_tab_type_railway_car_2 foreign key (ref_type) references tab_type_railway_car(at_id));
-- Поезда
create table tab_train (at_id numeric primary key
                       , at_name_traint varchar(100)
                       , at_date_departure date
                       , ref_station_A numeric
                       , ref_station_B numeric
                       , constraint fk_tab_station_A_2 foreign key (ref_station_A) references tab_station(at_id)
                       , constraint fk_tab_station_B_2 foreign key (ref_station_B) references tab_station(at_id));
-- Таблица связь поезда и его вагонов
create table tab_train_park_car ( at_id numeric primary key
                                , ref_train numeric
                                , ref_rail_car numeric
                                , constraint fk_tab_train foreign key (ref_train) references tab_train(at_id)
                                , constraint fk_tab_park_rail_car foreign key (ref_rail_car) references tab_park_rail_car(at_id));
-- Данные пассажиров
create table tab_passenger (at_id numeric primary key
                           , ref_parent_id numeric
                           , at_last_name varchar(1000)
                           , at_first_name varchar(1000)
                           , at_birthday date
                           , at_ser_pas numeric
                           , at_num_pas numeric);
-- История бронирования 
create table tab_history_reservation ( at_id numeric primary key
                                     , at_date_resert date
                                     , at_end_date_resert date
                                     , ref_passenger numeric
                                     , ref_seat numeric
                                     , constraint fk_tab_passenger foreign key (ref_passenger) references tab_passenger(at_id)
                                     , constraint fk_tab_seating_railway_car foreign key (ref_seat) references tab_seating_railway_car(at_id)
                                     );
-- Расписание поездов
create table tab_train_schedule ( at_id numeric primary key
                                , at_date_coming date
                                , ref_station_A numeric
                                , at_date_incoming date
                                , ref_station_B numeric
                                , at_time_stop numeric
                                , at_unit varchar(20)
                                , constraint fk_tab_station_A_3 foreign key (ref_station_A) references tab_station(at_id)
                                , constraint fk_tab_station_B_3 foreign key (ref_station_B) references tab_station(at_id)); 
                                                           
