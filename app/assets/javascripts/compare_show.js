document.addEventListener('DOMContentLoaded', function() {
  var button = document.querySelector('#compare-button'); // try using var instead of let to fix Heroku issue
  var state1 = document.querySelector("#state1")
  var state2 = document.querySelector("#state2")
  var flash = document.querySelector("#js-flash")

  button.addEventListener('click', function() {
    if(state1.value == state2.value){
      flash.innerHTML = "You cannot compare the same state. Please select two different states."
    }
  });
});
