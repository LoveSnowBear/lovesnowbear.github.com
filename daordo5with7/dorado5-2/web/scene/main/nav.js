function showCovering() {
  var frameCovering = document.getElementById("frameCovering");
  frameCovering.style.display = "";
}
  
function hideCovering() {
  var frameCovering = document.getElementById("frameCovering");
  frameCovering.style.display = "none";
}

function openPage(path) {
  showCovering();
  
  var frameSample = document.getElementById("frameContent");
  setTimeout("document.getElementById(\"frameContent\").src = unescape(\"" +
    escape(path) + "\")", 0);
}