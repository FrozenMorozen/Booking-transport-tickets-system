package ru.btts.backend.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ru.btts.backend.entity.City;
import ru.btts.backend.entity.Country;

import java.util.List;

@Repository
public interface CityRepository extends CrudRepository<City, Long> {

		List<City> findByNameContainingIgnoreCase(String name);
		List<City> findByCountry(Country country);
}

