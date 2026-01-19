
function temperature() {
  let celsius = document.getElementById("celsius").value;
  let fahrenheit = (celsius * 9 / 5) + 32;
  document.getElementById("fahrenheit").value = fahrenheit;
}


function weight() {
  let kilo = document.getElementById("kilo").value;
  let pounds = kilo * 2.2;
  document.getElementById("pounds").innerHTML = pounds;
}

function distance() {
  let km = document.getElementById("km").value;
  let miles = km * 0.62137;
  document.getElementById("miles").innerHTML = miles;
}
