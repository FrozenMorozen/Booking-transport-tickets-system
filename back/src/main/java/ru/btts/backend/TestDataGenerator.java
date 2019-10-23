package ru.btts.backend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;
import ru.btts.backend.entity.City;
import ru.btts.backend.entity.Country;
import ru.btts.backend.service.impl.CityServiceImpl;
import ru.btts.backend.service.impl.CountryServiceImpl;

@Component
public class TestDataGenerator implements ApplicationRunner {

    private final CountryServiceImpl countryService;
    private final CityServiceImpl cityService;

    @Autowired
    public TestDataGenerator(CountryServiceImpl countryService, CityServiceImpl cityService) {
        this.countryService = countryService;
        this.cityService = cityService;
    }

    @Override
    public void run(ApplicationArguments args) throws Exception {
        clearData();
        generateTestData();
    }

    private void clearData() {
        cityService.clear();
        countryService.clear();
    }

    private void generateTestData() {

        Country country = new Country("Russia");
        City city = new City("Moscow",country);

        countryService.add(country);
        cityService.add(city);

        city = new City("Novosibirsk",country);

        cityService.add(city);

        country = new Country("Belarus");
        city = new City("Minsk",country);

        countryService.add(country);
        cityService.add(city);


        country = new Country("USA");
        city = new City("New-York",country);

        countryService.add(country);
        cityService.add(city);

        country = new Country("Belgium");
        city = new City("Brussel",country);

        countryService.add(country);
        cityService.add(city);
    }
}
