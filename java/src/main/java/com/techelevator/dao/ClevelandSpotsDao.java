package com.techelevator.dao;


import com.techelevator.model.ThingToDo;

import java.util.List;

public interface ClevelandSpotsDao {

    List<ThingToDo> findAll();

    List<ThingToDo> findFreeActivities();

}
