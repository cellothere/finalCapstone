package com.techelevator.controller;


import com.techelevator.dao.ClevelandSpotsDao;
import com.techelevator.model.LoginDto;
import com.techelevator.model.LoginResponseDto;
import com.techelevator.model.ThingToDo;
import com.techelevator.model.User;
import com.techelevator.security.jwt.JWTFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin
//TODO build an authitication that works. Is it not authenticating on the front end? Roles in sql are ROLE_USER and ROLE_ADMIN
//@PreAuthorize("hasRole('ROLE_USER')")
public class ClevelandSpotsController {

    private ClevelandSpotsDao clevelandSpotsDao;

    public ClevelandSpotsController(ClevelandSpotsDao clevelandSpotsDao){
        this.clevelandSpotsDao = clevelandSpotsDao;
    }

    @RequestMapping(value = "/thingsToDo", method = RequestMethod.GET)
    public List<ThingToDo> getAllThingsToDo() {
        return clevelandSpotsDao.findAll();
    }

    @RequestMapping(value ="/thingsToDo/freeAdmission", method = RequestMethod.GET)
    public List<ThingToDo> findFreeActivities(){
            return clevelandSpotsDao.findFreeActivities();
    }

    @RequestMapping(value = "thingsToDo/{id}", method = RequestMethod.GET)
    public ThingToDo findThingToDoById(@PathVariable int id) {
        ThingToDo thingToDo = clevelandSpotsDao.getThingToDoById(id);

        if(thingToDo == null){
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No landmark with this location ID");
        } else {
            return thingToDo;
        }
    }
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "thingsToDo/create", method = RequestMethod.POST)
    public boolean createThingToDO(@RequestBody ThingToDo thingToDo){
        return clevelandSpotsDao.create(thingToDo);
    }
}


