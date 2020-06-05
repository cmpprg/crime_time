document.addEventListener('DOMContentLoaded', function() {
  // selectors and buttons for search page
  var state = document.querySelector("#state");
  // table selectors on search page
  var stateAA = document.querySelector('.state-table .aggravated-assault');
  var stateHO = document.querySelector('.state-table .homicide');
  var stateRA = document.querySelector('.state-table .rape');
  var statePC = document.querySelector('.state-table .property-crime');
  var stateAR = document.querySelector('.state-table .arson');

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

  if (document.querySelector('#state')){
    state.addEventListener('change', function(){
      deleteAllTds()
      // fetch table data
      fetch(`https://crime-time-fbi-api.herokuapp.com/api/v1/crimes/states?state=${state.value}`)
      .then(function(response){
        return response.json()
      }).then(function(body){
        var attr = body.data.attributes;
        // compare page update aggravted assault table
        appendTdTo(stateAA, attr.aggravated_assault_total);
        appendTdTo(stateAA, `${attr.aggravated_assault_percent_state}%`);
        appendTdTo(stateAA, `${attr.aggravated_assault_percent_national}%`);
        // compare page update homicide table
        appendTdTo(stateHO, attr.homicide_total);
        appendTdTo(stateHO, `${attr.homicide_percent_state}%`);
        appendTdTo(stateHO, `${attr.homicide_percent_national}%`);
        // compare page update rape table
        appendTdTo(stateRA, attr.rape_total);
        appendTdTo(stateRA, `${attr.rape_percent_state}%`);
        appendTdTo(stateRA, `${attr.rape_percent_national}%`);
        // compare page update property crime table
        appendTdTo(statePC, attr.property_crime_total);
        appendTdTo(statePC, `${attr.property_crime_percent_state}%`);
        appendTdTo(statePC, `${attr.property_crime_percent_national}%`);
        // compare page update arson table
        appendTdTo(stateAR, attr.arson_total);
        appendTdTo(stateAR, `${attr.arson_percent_state}%`);
        appendTdTo(stateAR, `${attr.arson_percent_national}%`);
      });
      //end fetch table
    });
  };
});
