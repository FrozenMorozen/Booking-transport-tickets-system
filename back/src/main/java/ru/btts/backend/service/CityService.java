package ru.btts.backend.service;

import ru.btts.backend.entity.City;
import ru.btts.backend.entity.Country;

import java.util.List;

public interface CityService {

		List<City> findCityByFilter(String nameFilter);

		List<City> findCitiesByCountry(Country country);

		void add(City city);

		void clear();
}
