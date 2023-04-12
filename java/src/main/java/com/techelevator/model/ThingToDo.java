package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.math.BigDecimal;


public class ThingToDo {
    private int id;
    @JsonProperty
    private String imageUrl;
    @JsonProperty
    private String description;
    @JsonProperty
    private String name;
    @JsonProperty
    private String type;
    @JsonProperty
    private BigDecimal latitude;
    @JsonProperty
    private BigDecimal longitude;
    @JsonProperty
    private String hours;
    @JsonProperty
    private boolean kidFriendly;
    @JsonProperty
    private boolean freeAdmission;
    @JsonProperty
    private String restaurantType;
    @JsonProperty
    private boolean outdoor;
    @JsonProperty
    private double landmarkRating;

    public ThingToDo() {
    }
    public ThingToDo(int id, String imageUrl, String description, String name, String type,
                     BigDecimal latitude, BigDecimal longitude, String hours, boolean kidFriendly,
                     boolean freeAdmission, String restaurantType, boolean outdoor, double landmarkRating) {
        this.id = id;
        this.imageUrl = imageUrl;
        this.description = description;
        this.name = name;
        this.type = type;
        this.latitude = latitude;
        this.longitude = longitude;
        this.hours = hours;
        this.kidFriendly = kidFriendly;
        this.freeAdmission = freeAdmission;
        this.restaurantType = restaurantType;
        this.outdoor = outdoor;
        this.landmarkRating = landmarkRating;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public BigDecimal getLatitude() {
        return latitude;
    }

    public void setLatitude(BigDecimal latitude) {
        this.latitude = latitude;
    }

    public BigDecimal getLongitude() {
        return longitude;
    }

    public void setLongitude(BigDecimal longitude) {
        this.longitude = longitude;
    }

    public String getHours() {
        return hours;
    }

    public void setHours(String hours) {
        this.hours = hours;
    }

    public boolean isKidFriendly() {
        return kidFriendly;
    }

    public void setKidFriendly(boolean kidFriendly) {
        this.kidFriendly = kidFriendly;
    }

    public boolean isFreeAdmission() {
        return freeAdmission;
    }

    public void setFreeAdmission(boolean freeAdmission) {
        this.freeAdmission = freeAdmission;
    }

    public String getRestaurantType() {
        return restaurantType;
    }

    public void setRestaurantType(String restaurantType) {
        this.restaurantType = restaurantType;
    }

    public boolean isOutdoor() {
        return outdoor;
    }

    public void setOutdoor(boolean outdoor) {
        this.outdoor = outdoor;
    }

    public double getLandmarkRating() {
        return landmarkRating;
    }

    public void setLandmarkRating(double landmarkRating) {
        this.landmarkRating = landmarkRating;
    }
}




//}
//
//
//
//    private int id;
//    private String username;
//    @JsonIgnore
//    private String password;
//    @JsonIgnore
//    private boolean activated;
//    private Set<Authority> authorities = new HashSet<>();
//
//    public User() { }
//
//    public User(int id, String username, String password, String authorities) {
//        this.id = id;
//        this.username = username;
//        this.password = password;
//        if(authorities != null) this.setAuthorities(authorities);
//        this.activated = true;
//    }
//
//    public int getId() {
//        return id;
//    }
//
//    public void setId(int id) {
//        this.id = id;
//    }
//
//    public String getUsername() {
//        return username;
//    }
//
//    public void setUsername(String username) {
//        this.username = username;
//    }
//
//    public String getPassword() {
//        return password;
//    }
//
//    public void setPassword(String password) {
//        this.password = password;
//    }
//
//    public boolean isActivated() {
//        return activated;
//    }
//
//    public void setActivated(boolean activated) {
//        this.activated = activated;
//    }
//
//    public Set<Authority> getAuthorities() {
//        return authorities;
//    }
//
//    public void setAuthorities(Set<Authority> authorities) {
//        this.authorities = authorities;
//    }
//
//    public void setAuthorities(String authorities) {
//        String[] roles = authorities.split(",");
//        for(String role : roles) {
//            String authority = role.contains("ROLE_") ? role : "ROLE_" + role;
//            this.authorities.add(new Authority(authority));
//        }
//    }
//
//    @Override
//    public boolean equals(Object o) {
//        if (this == o) return true;
//        if (o == null || getClass() != o.getClass()) return false;
//        User user = (User) o;
//        return id == user.id &&
//                activated == user.activated &&
//                Objects.equals(username, user.username) &&
//                Objects.equals(password, user.password) &&
//                Objects.equals(authorities, user.authorities);
//    }
//
//    @Override
//    public int hashCode() {
//        return Objects.hash(id, username, password, activated, authorities);
//    }
//
//    @Override
//    public String toString() {
//        return "User{" +
//                "id=" + id +
//                ", username='" + username + '\'' +
//                ", activated=" + activated +
//                ", authorities=" + authorities +
//                '}';
//    }
//}
