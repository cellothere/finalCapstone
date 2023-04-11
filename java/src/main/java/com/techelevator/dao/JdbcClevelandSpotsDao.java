package com.techelevator.dao;

import com.techelevator.model.ThingToDo;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcClevelandSpotsDao implements ClevelandSpotsDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcClevelandSpotsDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public List<ThingToDo> findAll(){

        List<ThingToDo> thingsToDo = new ArrayList<>();
        String sql = "select * from landmark;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            ThingToDo thingToDo = mapRowToThingToDo(results);
            thingsToDo.add(thingToDo);
        }

        return thingsToDo;

    }
    @Override
    public List<ThingToDo> findFreeActivities(){
        List<ThingToDo> thingsToDo = new ArrayList<>();
        String sql = "select * from landmark WHERE admission = true;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while (results.next()) {
            ThingToDo thingToDo = mapRowToThingToDo(results);
            thingsToDo.add(thingToDo);
        }

        return thingsToDo;
    }
    @Override
    public ThingToDo getThingToDoById(int id){
        ThingToDo thingToDo = null;
        String sql = "select * from landmark WHERE landmark_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);

        if (results.next()) {
            ThingToDo thingToDo2 = mapRowToThingToDo(results);
            thingToDo = thingToDo2;
        }
        return thingToDo;
    }


//    adding a comment

    private ThingToDo mapRowToThingToDo(SqlRowSet rs) {
        ThingToDo thingToDo = new ThingToDo();
        thingToDo.setId(rs.getInt("landmark_id"));
        thingToDo.setImageUrl(rs.getString("landmark_img_url"));
        thingToDo.setDescription(rs.getString("landmark_description"));
        thingToDo.setName(rs.getString("landmark_name"));
        thingToDo.setType(rs.getString("landmark_type"));
        thingToDo.setLatitude(rs.getBigDecimal("landmark_latitude"));
        thingToDo.setLongitude(rs.getBigDecimal("landmark_longitude"));
        thingToDo.setHours(rs.getString("hours_of_operations"));
        thingToDo.setKidFriendly(rs.getBoolean("kid_friendly"));
        thingToDo.setFreeAdmission(rs.getBoolean("admission"));
        thingToDo.setRestaurantType(rs.getString("restaurant_type"));
        thingToDo.setOutdoor(rs.getBoolean("is_outdoor"));
        thingToDo.setLandmarkRating(rs.getDouble("landmark_rating"));
        return thingToDo;
    }

}
