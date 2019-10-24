package ru.btts.backend.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.btts.backend.dao.CityRepository;
import ru.btts.backend.entity.City;
import ru.btts.backend.entity.Country;
import ru.btts.backend.service.CityService;

import java.util.List;

@Service
public class CityServiceImpl implements CityService {

		@Autowired
		private CityRepository cityRepository;

		@Override
		public List<City> findCityByFilter(String nameFilter){
				return cityRepository.findByNameContainingIgnoreCase(nameFilter);
		}

		@Override
		public List<City> findCitiesByCountry(Country country) {
				return cityRepository.findByCountry(country);
		}

		@Override
		public void add(City city) {
				cityRepository.save(city);
		}

		@Override
		public void clear() {
				cityRepository.deleteAll();
		}
}
