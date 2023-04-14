package com.techelevator.dao;

import com.techelevator.model.Itinerary;
import com.techelevator.dao.ItineraryDao;
import com.techelevator.model.ThingToDoDto;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcItineraryDao implements ItineraryDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcItineraryDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Itinerary> getAllSites() {

        List<Itinerary> itineraries = new ArrayList<>();
        String sql = "Select * from itinerary;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Itinerary itinerary = mapRowToItinerary(results);
            itineraries.add(itinerary);
        }

        return itineraries;

    }
    @Override
    public boolean create(Itinerary itinerary) {
        String sql = "INSERT into itinerary (itinerary_title, itinerary_date, starting_time) VALUES (?, ?, ?)";

        int results = jdbcTemplate.update(sql, itinerary.getItineraryTitle(), itinerary.getItineraryDate(), itinerary.getStartingTime());

        if(results == 1) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void delete(int id){
        String sql = "DELETE from itinerary WHERE itinerary_id = ?";
        jdbcTemplate.update(sql, id);
    }

    private Itinerary mapRowToItinerary(SqlRowSet rs) {
        Itinerary itinerary = new Itinerary();
        itinerary.setItineraryId(rs.getInt("itinerary_id"));
        itinerary.setItineraryTitle(rs.getString("itinerary_title"));
        itinerary.setItineraryDate(rs.getDate("itinerary_date"));
        itinerary.setStartingTime(rs.getTime("starting_time"));

        return itinerary;
    }



}
