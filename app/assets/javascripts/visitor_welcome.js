document.addEventListener('DOMContentLoaded', function() {

  var nationAA = document.querySelector('.national-stats .aggravated-assault')
  var nationHO = document.querySelector('.national-stats .homicide')
  var nationRA = document.querySelector('.national-stats .rape')
  var nationPC = document.querySelector('.national-stats .property-crime')
  var nationAR = document.querySelector('.national-stats .arson')

  // helper functions
  function appendTdTo(row, value){
    var element = document.createElement('td');
    var text = value;
    element.innerHTML = text;
    row.appendChild(element);
  };

  if(document.querySelector('.top-ten')){
    fetch(`https://crime-time-fbi-api.herokuapp.com/api/v1/crimes/national`)
    .then(function(response){
      return response.json()
    }).then(function(body){
      var attr = body.data.attributes;
      // welcom page update aggravted assault row
      appendTdTo(nationAA, attr.aggravated_assault_total);
      appendTdTo(nationAA, `${attr.aggravated_assault_percent_of_total}%`);
      // welcom page update homicide row
      appendTdTo(nationHO, attr.homicide_total);
      appendTdTo(nationHO, `${attr.homicide_percent_of_total}%`);
      // welcom page update rape row
      appendTdTo(nationRA, attr.rape_total);
      appendTdTo(nationRA, `${attr.rape_percent_of_total}%`);
      // welcom page update property crime row
      appendTdTo(nationPC, attr.property_crime_total);
      appendTdTo(nationPC, `${attr.property_crime_percent_of_total}%`);
      // welcom page update arson row
      appendTdTo(nationAR, attr.arson_total);
      appendTdTo(nationAR, `${attr.arson_percent_of_total}%`);
    });
  };
});
