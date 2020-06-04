document.addEventListener('DOMContentLoaded', function() {
  // selectors and buttons for search page
  var userState = document.querySelector('#user-state')
  // table selectors on search page
  var dashStateAA = document.querySelector('.state-stats .aggravated-assault');
  var dashStateHO = document.querySelector('.state-stats .homicide');
  var dashStateRA = document.querySelector('.state-stats .rape');
  var dashStatePC = document.querySelector('.state-stats .property-crime');
  var dashStateAR = document.querySelector('.state-stats .arson');

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
  if (document.querySelector('#user-state')) {
    // fetch table data
    fetch(`https://crime-time-fbi-api.herokuapp.com/api/v1/crimes/states?state=${userState.textContent}`)
    .then(function(response){
      return response.json()
    }).then(function(body){
      var attr = body.data.attributes;
      // compare page update aggravted assault table
      appendTdTo(dashStateAA, attr.aggravated_assault_total);
      appendTdTo(dashStateAA, `${attr.aggravated_assault_percent_state}%`);
      appendTdTo(dashStateAA, `${attr.aggravated_assault_percent_national}%`);
      // compare page update homicide table
      appendTdTo(dashStateHO, attr.homicide_total);
      appendTdTo(dashStateHO, `${attr.homicide_percent_state}%`);
      appendTdTo(dashStateHO, `${attr.homicide_percent_national}%`);
      // compare page update rape table
      appendTdTo(dashStateRA, attr.rape_total);
      appendTdTo(dashStateRA, `${attr.rape_percent_state}%`);
      appendTdTo(dashStateRA, `${attr.rape_percent_national}%`);
      // compare page update property crime table
      appendTdTo(dashStatePC, attr.property_crime_total);
      appendTdTo(dashStatePC, `${attr.property_crime_percent_state}%`);
      appendTdTo(dashStatePC, `${attr.property_crime_percent_national}%`);
      // compare page update arson table
      appendTdTo(dashStateAR, attr.arson_total);
      appendTdTo(dashStateAR, `${attr.arson_percent_state}%`);
      appendTdTo(dashStateAR, `${attr.arson_percent_national}%`);
    });
    //end fetch table
  };
});
