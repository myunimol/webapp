function standardPolymerLoad() {
	setMenuAction();
}

function setMenuAction() {
	var navicon = document.getElementById('navicon');
	navicon.addEventListener('click', function() {
		document.getElementById('drawerPanel').togglePanel();
	});
}

function freeze() {
	if (document.isFreezed)
		return;
	var spinner = document.createElement("paper-spinner");
	var div = document.createElement("div");
	var content = document.getElementById("activeContentHandler");
	if (content != null)
		content.style.display = "none";
	div.id = 'FREEZEDIV';
	div.style = "position: fixed; background-color: rgba(0, 0, 0, 0.5); width:100%; height:100%; top:0; left:0";
	spinner.id = 'FREEZESPINNER';
	spinner.className = 'centerSpinner';
	spinner.active = true;
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
	if (content != null)
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