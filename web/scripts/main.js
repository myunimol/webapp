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
	div.id = 'FREEZEDIV';
	div.style = "position: fixed; background-color: rgba(0, 0, 0, 0.5); width:100%; height:100%; top:0; left:0";
	spinner.id = 'FREEZESPINNER';
	spinner.className = 'centerSpinner';
	spinner.active = true;
	document.body.appendChild(div);
	document.body.appendChild(spinner);
	document.isFreezed = true;
}

function unfreeze() {
	var div = document.getElementById('FREEZEDIV');
	var spinner = document.getElementById('FREEZESPINNER');
	document.body.removeChild(div);
	document.body.removeChild(spinner);
	document.isFreezed = false;
}

function removeAllListeners(element) {
    var elClone = element.cloneNode(true);
    element.parentNode.replaceChild(elClone, element);
    return elClone;
}

document.addEventListener("polymer-ready", standardPolymerLoad);