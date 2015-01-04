function standardPolymerLoad() {
	setMenuAction();
	var toast = document.createElement("paper-toast");
	document.errorHandlerToast = toast;
	document.body.appendChild(toast);
}

function setMenuAction() {
	var navicon = document.getElementById('navicon');
	if (navicon != null)
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
	var p = document.createElement("p");
	var content = document.getElementById(contentId);
	var spinnerSize = {width: 28, height: 28};
	div.id = 'FREEZEDIV';
	div.style.position = "absolute";
	div.style.textAlign = "center";
	div.style.width = content.offsetWidth+"px";
	div.style.height = content.offsetHeight+"px";
	var pos = getPosition(content);
	div.style.top = pos.y;
	div.style.left = pos.x;
	p.id = "FREEZEP";
	p.style.margin = "0 auto";
	p.style.position = "relative";
	var pTop = content.offsetHeight/2 + spinnerSize.height + 5;
	p.style.top = pTop+"px";
	p.style.fontSize = "smaller";
	p.style.fontStyle = "italic";
	var loadingMsgArray = [
	                 'Ma la lana di vetro si fa con le pecore di Murano???',
	                 "L'equinozio? Un cavallo fannullone?",
	                 "San Remo? Il protettore dei fratelli Abbagnale?",
	                 "Le guardie forestali quando muoiono vanno al Gran Paradiso?",
	                 "La storia di Adamo ed Eva fu il primo melo-dramma?",
	                 "L'insalata russa e il pomodoro non dorme...",
	                 '"Ieri ho vomitato tutto il giorno." "Vedi di rimetterti."',
	                 "Perché i Kamikaze portano un casco???",
	                 "Cosa faceva uno sputo su una scala? Saliva.",
	                 '"Non so se mi spiego..." disse il paracadute.',
	                 '"Non so se mi spiedo..." disse un pollo sul girarrosto.',
	                 "Il marinaio spiegò le vele al vento, ma il vento non capì...",
	                 'Misticismo di uno Streptococcus termophilus: "Ecce Yomo."',
	                 "Ragazzo scoppia di salute: 9 morti e 3 feriti.",
	                 '"Mi hanno messo in cinta!", disse una fibbia.',
	                 'La mela al verme: "Non parlare, bacami !".',
	                 "Arrestato un concorso che era stato bandito...",
	                 "Perché le tende piangono? Perché sono da sole.",
	                 '"Che vitaccia!" disse il cacciavite...',
	                 '"Wonder Woman sei spacciata!"; "Lo so, sono un\'eroina..."',
	                 "Come si prende un pollo per amazzarlo? Vivo.",
	                 "Perché in America fa freddo? Perché è stata scoperta.",
	                 "Papa Leone visse anni ruggenti?",
	                 'No: il contrario di "melodia" non è "Se-lo-tenga"...',
	                 "Aperta a Cattolica chiesa protestante..."
	                 ];
	var randomNumber = Math.floor(Math.random()*loadingMsgArray.length);
	
	p.innerHTML = loadingMsgArray[randomNumber];
	spinner.id = 'FREEZESPINNER';
	spinner.className = 'centerSpinner';
	var spinnerTop = ((content.offsetHeight-spinnerSize.height)/2);
	var spinnerLeft = ((content.offsetWidth-spinnerSize.width)/2);
	spinner.style.top = spinnerTop+"px";
	spinner.style.left = spinnerLeft+"px";
	spinner.active = true;
	content.style.display = "none";
	document.body.appendChild(div);
	div.appendChild(spinner);
	div.appendChild(p);
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

function showError(message) {
	
}

window.onerror = function(error, url, line) {
    document.errorHandlerToast.text = "Ooops, errore imprevisto!";
    //document.errorHandlerToast.show();
};

document.addEventListener("polymer-ready", standardPolymerLoad);