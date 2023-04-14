package com.techelevator.controller;

import com.techelevator.dao.ItineraryDao;
import com.techelevator.model.Itinerary;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;


@RestController
@CrossOrigin
public class ItineraryController {

    @Autowired
    private ItineraryDao itineraryDao;


    @RequestMapping(path = "/itinerary", method = RequestMethod.GET)
    public List<Itinerary> getAllItineraries() {
        return itineraryDao.getAllSites();
    }


    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/itinerary/create", method = RequestMethod.POST)
    public void create(@RequestBody Itinerary itinerary){
        itineraryDao.create(itinerary);
    }

    @RequestMapping(path = "/itinerary/{id}/delete", method = RequestMethod.DELETE)
    public void delete(@PathVariable int id) {
        itineraryDao.delete(id);
    }
}
