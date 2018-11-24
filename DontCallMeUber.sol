pragma solidity ^0.4.20;

contract DontCallMeUber {
    
      enum TripStatus {
        WAITING,
        ACCEPTED,
        REFUSED,
        STARTED,
        FINALIZED
    }
    
    
    struct Trip {
        uint value;
        address driverId;
        TripStatus status;
    }
    
    struct Driver {
        address id;
        bool isFree;
    }

    mapping(address => Driver) drivers;
    
    uint numTrips;
    mapping(uint => Trip) trips;
    
    function DontCallMeUber() {
        numTrips = 0;
    }
    function signUp(address _driver) {
        Driver driver = drivers[_driver];
        driver.id = msg.sender;
        driver.isFree = true;
    }
    
    function signTrip(address _driver, uint _value) {
        Trip trip = trips[++numTrips];
        Driver driver = drivers[_driver];
        trip.value= _value;
        trip.driverId = driver.id;
        trip.status = TripStatus.WAITING;
    }
    
    function callDriver(address _driver) {
        Driver driver = drivers[_driver];
        require( driver.isFree );
        driver.isFree = false;
    }
    
    function acceptTrip(address _driver, uint _trip, uint _value) payable{
        Trip trip = trips[_trip];
        Driver driver = drivers[_driver];
        trip.value = _value;
        
        require( trip.value <= msg.value );
        require( msg.sender != driver.id ); 
        
        trip.status = TripStatus.ACCEPTED;
        trip.driverId = msg.sender;
        driver.isFree = false;
        
        var payment = _value;
        
        driver.id.transfer(payment);
        
    }
    
    function startTrip(uint _trip) {
        Trip trip = trips[_trip];
        trip.status = TripStatus.STARTED;
    }
    
    function endTrip(uint _trip) {
        Trip trip = trips[_trip];
        trip.status = TripStatus.FINALIZED;
    }

}
