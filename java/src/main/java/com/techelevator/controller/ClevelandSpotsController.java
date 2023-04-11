package com.techelevator.controller;


import com.techelevator.dao.ClevelandSpotsDao;
import com.techelevator.model.LoginDto;
import com.techelevator.model.LoginResponseDto;
import com.techelevator.model.ThingToDo;
import com.techelevator.model.User;
import com.techelevator.security.jwt.JWTFilter;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin
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
}


//    @RequestMapping(value = "/login", method = RequestMethod.POST)
//    public ResponseEntity<LoginResponseDto> login(@Valid @RequestBody LoginDto loginDto) {
//
//        UsernamePasswordAuthenticationToken authenticationToken =
//                new UsernamePasswordAuthenticationToken(loginDto.getUsername(), loginDto.getPassword());
//
//        Authentication authentication = authenticationManagerBuilder.getObject().authenticate(authenticationToken);
//        SecurityContextHolder.getContext().setAuthentication(authentication);
//        String jwt = tokenProvider.createToken(authentication, false);
//
//        User user = userDao.findByUsername(loginDto.getUsername());
//
//        HttpHeaders httpHeaders = new HttpHeaders();
//        httpHeaders.add(JWTFilter.AUTHORIZATION_HEADER, "Bearer " + jwt);
//        return new ResponseEntity<>(new LoginResponseDto(jwt, user), httpHeaders, HttpStatus.OK);
//    }