var BROWSER_IE = 1;
var BROWSER_SAFARI = 2;
var BROWSER_MOZILLA = 3;
var BROWSER_OPERA = 4;

var browserType;

(function () { // closure away userAgent
  var userAgent = navigator.userAgent.toLowerCase();
  if (userAgent.indexOf('opera') != -1) { // opera contains msie and opera
    browserType = BROWSER_OPERA;
  }
  else if (userAgent.indexOf('safari') != -1) {
    browserType = BROWSER_SAFARI;
  }
  else if (userAgent.indexOf('msie') != -1) {
      browserType = BROWSER_IE;
  }
  else {
    browserType = BROWSER_MOZILLA;
  }
})();

var fileList = new Array();
var currentProgress = 0;
var fileIndex = 0, tmpProgress = 0;
var timerID;

function addFile(fileName, type, filePath, fileSize){
  var obj = new Object();
  obj.fileName = fileName;
  obj.type = type;
  obj.filePath = filePath;
  obj.fileSize = fileSize;
  fileList.push(obj);
}

function updateProgressBar(step){
  var progressBar = document.getElementById("progress");
  currentProgress += step;
  progressBar.style.width = currentProgress + "%";
  tmpProgress = currentProgress;
}

function updateTmpProgressBar(step){
  if (window.closed) return;

  tmpProgress += step;
  if (tmpProgress <= 100 && tmpProgress < currentProgress + fileList[fileIndex].fileSize){
    var progressBar = document.getElementById("progress");
    progressBar.style.width = tmpProgress + "%";
  }
}

function fileLoader_onReadyStateChange() {
  var fileLoader = event.srcElement;
  if (fileLoader.readyState == "complete" || fileLoader.readyState == "loaded") {
    fileLoaded();
    fileLoader.detachEvent("onreadystatechange", fileLoader_onReadyStateChange);
    document.body.removeChild(fileLoader);
  }
}

function fileLoader_onLoad(evt) {
  fileLoaded();
  var fileLoader = evt.target;
  fileLoader.removeEventListener("load", fileLoader_onLoad, false);
  document.body.removeChild(fileLoader);
}

function fileLoaded() {
  updateProgressBar(fileList[fileIndex].fileSize);

  fileIndex ++;
  if (fileIndex < fileList.length) {
    setTimeout("loadOneFile()", 0);
  }
  else {
    finishLoading();
  }
}

function loadOneFile() {
  if (window.closed) return;

  var file = fileList[fileIndex];
  if (file.type == "SCRIPT") {
    var fileLoader = document.createElement("SCRIPT");
    document.body.appendChild(fileLoader);
    if (browserType == BROWSER_IE) {
      fileLoader.language = "JavaScript";
      fileLoader.attachEvent("onreadystatechange", fileLoader_onReadyStateChange);
    }
    else {
      fileLoader.lang = "javascript";
      fileLoader.addEventListener("load", fileLoader_onLoad, false);
    }
    fileLoader.src = file.filePath;
  }
  else if (file.type == "STYLE") {
    if (browserType == BROWSER_IE) {
      var fileLoader = document.createElement("LINK");
      fileLoader.disabled = true;
      fileLoader.rel = "stylesheet";
      fileLoader.type = "text/css";
      document.body.appendChild(fileLoader);
      fileLoader.href = file.filePath;
      fileLoader.attachEvent("onreadystatechange", fileLoader_onReadyStateChange);
    }
    else {
      var fileLoader = document.createElement("SCRIPT");
      document.body.appendChild(fileLoader);
      fileLoader.lang = "javascript";
      fileLoader.addEventListener("load", fileLoader_onLoad, false);
      fileLoader.src = file.filePath;
    }
  }
}

function startLoading() {
  loadOneFile();
  timerID = setInterval("updateTmpProgressBar(1)", 500);
}

function finishLoading(){
  clearInterval(timerID);
  openApp();
}

function window_onload() {
  addFile("skin", "STYLE", "dorado/smartweb2.loadStyleSheet.d?skin=default", 10);
  addFile("const", "SCRIPT", "dorado/smartweb2.loadConst.d?language=cn&country=ZH", 10);
  addFile("utils", "SCRIPT", "dorado/smartweb2.loadRes.d?res=/deprecated.js", 10);
  addFile("base", "SCRIPT", "dorado/smartweb2.loadRes.d?res=/dorado-all.js", 20);
  addFile("preferences", "SCRIPT", "dorado/smartweb2.loadFile.d?file=/skins/default/preferences.js", 10);

  startLoading();
}
