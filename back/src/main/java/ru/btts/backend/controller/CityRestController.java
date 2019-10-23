package ru.btts.backend.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ru.btts.backend.entity.City;
import ru.btts.backend.service.impl.CityServiceImpl;
import ru.btts.backend.service.impl.CountryServiceImpl;

import java.util.List;
import java.util.concurrent.TimeUnit;


@RestController
@RequestMapping("city")
@Slf4j
public class CityRestController {

    private final CityServiceImpl cityService;
    private final CountryServiceImpl countryService;

    @Autowired
    public CityRestController(final CityServiceImpl cityService,
                              final CountryServiceImpl countryService) {
        this.cityService = cityService;
        this.countryService = countryService;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<City>> getCitiesByFilter(
            @RequestParam(value = "text", required = false) String filter) {

        List<City> resultPoints = cityService.findCityByFilter(filter);
        CacheControl cache = CacheControl.maxAge(30, TimeUnit.MINUTES);

        log.info("Get cities by filter='" + filter + "' : " + resultPoints);

        return ResponseEntity.ok()
                .cacheControl(cache)
                .body(resultPoints);
    }
}