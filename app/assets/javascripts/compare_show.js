document.addEventListener('DOMContentLoaded', function() {
  // selectors and buttons for compare page
  var compareButton = document.querySelector('#compare-button');
  var state1 = document.querySelector("#state1");
  var state2 = document.querySelector("#state2");
  // 'p' node on application layout page for flash notice
  var flash = document.querySelector("#js-flash");
  // table 1 selectors for compare page
  var state1AA = document.querySelector('.state-1-table .aggravated-assault');
  var state1HO = document.querySelector('.state-1-table .homicide');
  var state1RA = document.querySelector('.state-1-table .rape');
  var state1PC = document.querySelector('.state-1-table .property-crime');
  var state1AR = document.querySelector('.state-1-table .arson');
  // table 2 selectors for compare page
  var state2AA = document.querySelector('.state-2-table .aggravated-assault');
  var state2HO = document.querySelector('.state-2-table .homicide');
  var state2RA = document.querySelector('.state-2-table .rape');
  var state2PC = document.querySelector('.state-2-table .property-crime');
  var state2AR = document.querySelector('.state-2-table .arson');
  // helper functions
  function appendTdTo(row, value){
    var element = document.createElement('td');
    var text = value;
    element.innerHTML = text;
    row.appendChild(element);
  };

  function deleteAllTds(){
    var tds = document.querySelectorAll('td')
    tds.forEach(function(td){
      td.remove()
    });
  };

  if (document.querySelector('#compare-button') !== null) {
    // compare page > when compare button is clicked, all this happens ->>
    compareButton.addEventListener('click', function() {
      if(state1.value == state2.value){
        flash.innerHTML = "You cannot compare the same state. Please select two different states."
      } else {
        deleteAllTds()
        // fetch table 1 data
        fetch(`https://crime-time-fbi-api.herokuapp.com/api/v1/crimes/states?state=${state1.value}`)
        .then(function(response){
          return response.json()
        }).then(function(body){
          var attr = body.data.attributes;
          // compare page update aggravted assault table 1
          appendTdTo(state1AA, attr.aggravated_assault_total);
          appendTdTo(state1AA, `${attr.aggravated_assault_percent_state}%`);
          appendTdTo(state1AA, `${attr.aggravated_assault_percent_national}%`);
          // compare page update homicide table 1
          appendTdTo(state1HO, attr.homicide_total);
          appendTdTo(state1HO, `${attr.homicide_percent_state}%`);
          appendTdTo(state1HO, `${attr.homicide_percent_national}%`);
          // compare page update rape table 1
          appendTdTo(state1RA, attr.rape_total);
          appendTdTo(state1RA, `${attr.rape_percent_state}%`);
          appendTdTo(state1RA, `${attr.rape_percent_national}%`);
          // compare page update property crime table 1
          appendTdTo(state1PC, attr.property_crime_total);
          appendTdTo(state1PC, `${attr.property_crime_percent_state}%`);
          appendTdTo(state1PC, `${attr.property_crime_percent_national}%`);
          // compare page update arson table 1
          appendTdTo(state1AR, attr.arson_total);
          appendTdTo(state1AR, `${attr.arson_percent_state}%`);
          appendTdTo(state1AR, `${attr.arson_percent_national}%`);
        });
        //end fetch table 1

        // fetch table 2 data
        fetch(`https://crime-time-fbi-api.herokuapp.com/api/v1/crimes/states?state=${state2.value}`)
        .then(function(response){
          return response.json()
        }).then(function(body){
          var attr = body.data.attributes;

          // compare page update aggravted assault table 2
          appendTdTo(state2AA, attr.aggravated_assault_total);
          appendTdTo(state2AA, `${attr.aggravated_assault_percent_state}%`);
          appendTdTo(state2AA, `${attr.aggravated_assault_percent_national}%`);
          // compare page update homicide table 2
          appendTdTo(state2HO, attr.homicide_total);
          appendTdTo(state2HO, `${attr.homicide_percent_state}%`);
          appendTdTo(state2HO, `${attr.homicide_percent_national}%`);
          // compare page update rape table 2
          appendTdTo(state2RA, attr.rape_total);
          appendTdTo(state2RA, `${attr.rape_percent_state}%`);
          appendTdTo(state2RA, `${attr.rape_percent_national}%`);
          // compare page update property crime table 2
          appendTdTo(state2PC, attr.property_crime_total);
          appendTdTo(state2PC, `${attr.property_crime_percent_state}%`);
          appendTdTo(state2PC, `${attr.property_crime_percent_national}%`);
          // compare page update arson table 2
          appendTdTo(state2AR, attr.arson_total);
          appendTdTo(state2AR, `${attr.arson_percent_state}%`);
          appendTdTo(state2AR, `${attr.arson_percent_national}%`);
        });
        // end fetch table 2
      };
      //end conditional statement
    });
    //end click listner for compare button
  };
  //end conditional to check if compare button exists
});
//end document load
