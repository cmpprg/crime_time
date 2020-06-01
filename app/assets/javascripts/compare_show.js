document.addEventListener('DOMContentLoaded', function() {
  let button = document.querySelector('#compare-button'); // try using var instead of let to fix Heroku issue
  let state1 = document.querySelector("#state1")
  let state2 = document.querySelector("#state2")
  let flash = document.querySelector("#js-flash")

  button.addEventListener('click', function() {
    if(state1.value == state2.value){
      flash.innerHTML = "You cannot compare the same state. Please select two different states."
    }
  });
});
