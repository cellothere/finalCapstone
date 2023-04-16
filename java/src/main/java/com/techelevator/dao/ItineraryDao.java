package com.techelevator.dao;

import com.techelevator.model.Itinerary;
import com.techelevator.model.ThingToDoDto;
import com.techelevator.model.User;

import java.util.List;

public interface ItineraryDao {

    List<Itinerary> getAllItineraries();

    boolean create(Itinerary itinerary, int userId);

    void delete(int Id);

    List<Itinerary> getAllItinerariesByUserId(int userId);

    Itinerary getItineraryByItineraryId(int itineraryId);

    void addThingToDoToItinerary(int itineraryId, int landmarkId, int sequenceId);


}
