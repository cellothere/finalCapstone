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
        String sql = "Select landmark_id, landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, " +
                "hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating From landmark;";

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

    @Override
    public boolean create(ThingToDo thingToDo){
        String sql = "INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, restaurant_type, landmark_rating, is_outdoor, kid_friendly, admission )" +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        int results = jdbcTemplate.update(sql, thingToDo.getImageUrl(), thingToDo.getDescription(), thingToDo.getName(), thingToDo.getType(),
                thingToDo.getLatitude(), thingToDo.getLongitude(), thingToDo.getHours(), thingToDo.getRestaurantType(), thingToDo.getLandmarkRating(), thingToDo.isOutdoor(), thingToDo.isKidFriendly(), thingToDo.isFreeAdmission() );

        if(results == 1) {
            return true;
        }
        else {
            return false;
        }
    }

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
