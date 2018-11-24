pragma solidity ^0.4.20;

contract DontCallMeUber {
    
    struct Trip {
        uint value;
        uint driverId;
    }
    
    struct Driver {
        uint id;
        bool isFree;
    }
    
    uint numDrivers;
    mapping(uint => Driver) drivers;
    
    uint numTrips;
    mapping(uint => Trip) trips;
    
    function NoUber() {
        numDrivers = 0;
        numTrips = 0;
    }
    
    function signUp() {
        Driver driver = drivers[++numDrivers];
        driver.id = numDrivers;
        driver.isFree = true;
    }
    
    function signTrip(uint _driver, uint _value) {
        Trip trip = trips[++numTrips];
        Driver driver = drivers[_driver];
        trip.value= _value;
        trip.driverId = driver.id;
    }
    
    function callDriver(uint _driver) {
        Driver driver = drivers[_driver];
        require( driver.isFree );
         driver.isFree = false;
    }
    
    function acceptTrip(uint _trip, uint _value, uint _driver) payable{
        Trip trip = trips[_trip];
        Driver driver = drivers[_driver];
        
        trip.value = _value;
        driver.isFree = false;
        
    }
    
    // TODO
    function startTrip(uint _trip) {
        Trip trip = trips[_trip];
        
    }
    
    function endTrip(uint _trip) {
        Trip trip = trips[_trip];
    }
    
    // CREATE ENUM FOR TRIP STATUS
    
}
