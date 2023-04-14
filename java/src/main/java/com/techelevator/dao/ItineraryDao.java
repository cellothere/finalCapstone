package com.techelevator.dao;

import com.techelevator.model.Itinerary;

import java.util.List;

public interface ItineraryDao {

    List<Itinerary> getAllSites();

    boolean create(Itinerary itinerary);

    void delete(int Id);


}
