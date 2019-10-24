package ru.btts.backend.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.btts.backend.dao.CountryRepository;
import ru.btts.backend.entity.Country;
import ru.btts.backend.service.CountryService;

import java.util.List;


@Service
public class CountryServiceImpl implements CountryService {

    @Autowired
    private CountryRepository countryRepository;

    @Override
    public List<Country> findCountryByFilter(String nameFilter){
        return countryRepository.findByNameContainingIgnoreCase(nameFilter);
    }

    @Override
    public void add(Country country) {
        countryRepository.save(country);
    }

    @Override
    public void clear() {
        countryRepository.deleteAll();
    }
}
