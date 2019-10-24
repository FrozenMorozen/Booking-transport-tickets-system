package ru.btts.backend.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ru.btts.backend.entity.Country;

import java.util.List;


@Repository
public interface CountryRepository extends CrudRepository<Country, Long> {

    List<Country> findByNameContainingIgnoreCase(String name);
}
