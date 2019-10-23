package ru.btts.backend.service;


import ru.btts.backend.entity.Country;

import java.util.List;

public interface CountryService {

    List<Country> findCountryByFilter(String nameFilter);

    void add(Country country);

    void clear();
}
