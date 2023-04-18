package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class ItineraryLandmark {


    @JsonProperty
    public int itineraryId;
    @JsonProperty
    public int landmarkId;
    @JsonProperty
    public int sequenceNumber;

    public ItineraryLandmark() {}


    public ItineraryLandmark(int itineraryId, int landmarkId, int sequenceNumber) {
        this.itineraryId = itineraryId;
        this.landmarkId = landmarkId;
        this.sequenceNumber = sequenceNumber;
    }

    public int getItineraryId() {
        return itineraryId;
    }

    public void setItineraryId(int itineraryId) {
        this.itineraryId = itineraryId;
    }

    public int getLandmarkId() {
        return landmarkId;
    }

    public void setLandmarkId(int landmarkId) {
        this.landmarkId = landmarkId;
    }

    public int getSequenceNumber() {
        return sequenceNumber;
    }

    public void setSequenceNumber(int sequenceNumber) {
        this.sequenceNumber = sequenceNumber;
    }
}