function standardPolymerLoad() {
	setMenuAction();
}

function setMenuAction() {
	var navicon = document.getElementById('navicon');
	navicon.addEventListener('click', function() {
		document.getElementById('drawerPanel').togglePanel();
	});
}

function freeze(contentId) {
	if (document.isFreezed)
		return;
	if (contentId == "" || contentId == null)
		contentId = "activeContentHandler";
	var spinner = document.createElement("paper-spinner");
	var div = document.createElement("div");
	var content = document.getElementById(contentId);
	div.id = 'FREEZEDIV';
	div.style.position = "absolute";
	div.style.textAlign = "center";
	div.style.width = content.offsetWidth+"px";
	div.style.height = content.offsetHeight+"px";
	console.log(content.offsetWidth)
	var pos = getPosition(content);
	console.log(pos);
	div.style.top = pos.y;
	div.style.left = pos.x;
	spinner.id = 'FREEZESPINNER';
	spinner.className = 'centerSpinner';
	var spinnerSize = {width: 28, height: 28};
	var spinnerTop = ((content.offsetHeight-spinnerSize.height)/2);
	var spinnerLeft = ((content.offsetWidth-spinnerSize.width)/2);
	spinner.style.top = spinnerTop+"px";
	spinner.style.left = spinnerLeft+"px";
	spinner.active = true;
	content.style.display = "none";
	document.body.appendChild(div);
	div.appendChild(spinner);
	document.isFreezed = true;
}

function unfreeze(contentId) {
	if (contentId == "" || contentId == null)
		contentId = "activeContentHandler";
	var div = document.getElementById('FREEZEDIV');
	var spinner = document.getElementById('FREEZESPINNER');
	var content = document.getElementById(contentId);
	div.removeChild(spinner);
	document.body.removeChild(div);
	content.style.display = "block";
	document.isFreezed = false;
}

function removeAllListeners(element) {
    var elClone = element.cloneNode(true);
    element.parentNode.replaceChild(elClone, element);
    return elClone;
}

function getPosition(element) {
    var xPosition = 0;
    var yPosition = 0;
  
    while(element) {
        xPosition += (element.offsetLeft - element.scrollLeft + element.clientLeft);
        yPosition += (element.offsetTop - element.scrollTop + element.clientTop);
        element = element.offsetParent;
    }
    return { x: xPosition, y: yPosition };
}

document.addEventListener("polymer-ready", standardPolymerLoad);