class Fast {

  // **************** Private Members **************** \\ 

  int _fastLengthHour;           // length of fast (hours)
  int _fastLengthMinute;         // length of fast (minutes)

  // ****************** Constructor ****************** \\ 
  
  // default constructor
  Fast();

  // **************** Public Methods **************** \\ 
  
  // set the fast method chosen by user
  setFast(int hour, int minute) { 
    _fastLengthHour = hour;
    _fastLengthMinute = minute; 
  }

  // get fast length (hour)
  getFastLengthHour() { return _fastLengthHour; }

  // get fast length (minute)
  getFastLengthMinute() { return _fastLengthMinute; }

}