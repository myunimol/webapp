function standardPolymerLoad() {
	setMenuAction();
	var toast = document.createElement("paper-toast");
	document.errorHandlerToast = toast;
	document.body.appendChild(toast);
	
	var preload = document.getElementById("preloader-spinner");
	var realContent = document.getElementById("after-loading");
	
	if (preload != null && preload != undefined) {
		preload.style.display = "none";
		realContent.style.display = "block";
	}
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
	div.style.position = "block";
	div.style.textAlign = "center";
	div.style.width = content.offsetWidth+"px";
	div.style.height = content.offsetHeight+"px";
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
	                 "Perch&eacute; i Kamikaze portano un casco???",
	                 "Cosa faceva uno sputo su una scala? Saliva.",
	                 '"Non so se mi spiego..." disse il paracadute.',
	                 '"Non so se mi spiedo..." disse un pollo sul girarrosto.',
	                 "Il marinaio spieg&ograve; le vele al vento, ma il vento non cap&igrave;",
	                 'Misticismo di uno Streptococcus termophilus: "Ecce Yomo."',
	                 "Ragazzo scoppia di salute: 9 morti e 3 feriti.",
	                 '"Mi hanno messo in cinta!", disse una fibbia.',
	                 'La mela al verme: "Non parlare, bacami !".',
	                 "Arrestato un concorso che era stato bandito...",
	                 "Perch&eacute; le tende piangono? Perch&eacute; sono da sole.",
	                 '"Che vitaccia!" disse il cacciavite...',
	                 '"Wonder Woman sei spacciata!"; "Lo so, sono un\'eroina..."',
	                 "Come si prende un pollo per amazzarlo? Vivo.",
	                 "Perch&eacute; in America fa freddo? Perch&eacute; &egrave; stata scoperta.",
	                 "Papa Leone visse anni ruggenti?",
	                 'No: il contrario di "melodia" non &egrave; "Se-lo-tenga"...',
	                 "Aperta a Cattolica chiesa protestante...",
	                 "Nuova lavatrice lanciata sul mercato: 10 morti e 6 feriti...",
	                 "Elettricista impazzito d&agrave; alla luce un figlio...",
	                 "Bimbo scoppia di salute: i genitori in prognosi riservata...",
	                 "Disegnatore fa cadere mina per terra: 22 morti...",
	                 "Cosa nasce tra un elettricista ed una domestica? Un elettrodomestico...",
	                 "Catastrofi del secolo scorso: Hiroshima 45, Cernobyl 86, Windows 95...",
	                 "Le uniche cose che girano sotto Windows 95 sono le palle.",
	                 "Lo stitico quando muore va in purgatorio?",
	                 "\"Gestante\": participio presente o preservativo imperfetto?"
	                 ];
	var randomNumber = Math.floor(Math.random()*loadingMsgArray.length);
	
	p.innerHTML = loadingMsgArray[randomNumber];
	spinner.id = 'FREEZESPINNER';
	spinner.style.position = "relative";
	spinner.style.margin = "0 auto";
	var spinnerTop = ((content.offsetHeight-spinnerSize.height)/2);
	spinner.style.top = spinnerTop+"px";
	spinner.active = true;
	content.style.display = "none";
	div.appendChild(spinner);
	div.appendChild(p);
	content.parentNode.insertBefore(div, content.nextSibling);
	document.isFreezed = true;
}

function unfreeze(contentId) {
	if (contentId == "" || contentId == null)
		contentId = "activeContentHandler";
	var div = document.getElementById('FREEZEDIV');
	var spinner = document.getElementById('FREEZESPINNER');
	var content = document.getElementById(contentId);
	div.removeChild(spinner);
	content.parentNode.removeChild(div);
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