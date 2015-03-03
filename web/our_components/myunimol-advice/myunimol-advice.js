Polymer('myunimol-advice', {
	//applyAuthorStyles: true,

    //resetStyleInheritance: true,

    created: function() { 
    	
    },

    enteredView: function() {
    	
    },

    leftView: function() {
    	
    },

    attributeChanged: function(attrName, oldVal, newVal) {
    	
    },
    ready: function() {
    	
    },
    selectAdviceAction: function(e, detail) {
    	if(detail.isSelected) {
    		var selectedItem = detail.item.$.label.innerHTML;
    		this.selectedAdvice = selectedItem;
    		if(selectedItem == this.advices[this.advices.length-1]) {
    			this.$.other.style.display = "block";
    		} else {
    			this.$.other.style.display = "none";
    		}
    	}
    },
    selectedAdvice: "",
    advices: ["Miglioramento del Libretto",
               "Miglioramento della Home",
               "Miglioramento della Rubrica",
               "Miglioramento appelli prenotati",
               "Miglioramento appelli disponibili",
               "Miglioramento delle News",
               "Miglioramento dei Pagamenti",
               "Altro"],
    sendAction: function() {
    	this.$.buttonSend.disabled = true;
    	this.$.buttonSend.style.display = "none";
    	this.$.sending.active = true;
    	if(!this.checkFields()) {
    		this.$.errorMsgDialog.toggle();
    		// showing button
        	this.$.buttonSend.disabled = false;
        	this.$.buttonSend.style.display = "inline-block";
        	this.$.sending.active = false;
    	} else {
//    		 send data to server
    		this.$.ajax.params = '{"type":"'+this.selectedAdvice+'", "other":"'+this.$.otherProblem.value+'", "details":"'+this.$.details.value+'"}';
    		this.$.ajax.go();
    	}
    },
    checkFields: function() {
    	var msg = "";
    	var other = this.$.otherProblem.value;
    	var details = this.$.details.value;
    	if (this.selectedAdvice == this.advices[this.advices.length-1]) {
    		if(other.length < 3) {
    			msg += "Compila il campo Altro";
    		}
    	} else if (this.selectedAdvice == ""){
    		msg += "Compila il campo relativo al tipo di suggerimento";
    	}
    	if(msg!="") {
    		this.$.errorMsg.innerHTML = msg;
    		return false;
    	}
    	return true;
    },
    handleServletResponse: function(resp) {
    	console.log(resp);
    	// clear actual (sent) values
    	this.$.otherProblem.value = "";
    	this.$.details.value = "";
    	this.selectedAdvice = "";
    	// showing thank you toast
    	this.$.thankyouToast.toggle();
    	// showing button
    	this.$.buttonSend.disabled = false;
    	this.$.buttonSend.style.display = "inline-block";
    	this.$.sending.active = false;
    },
    handleAjaxError: function(error) {
    	console.log(error);
    	this.$.errorMsg.innerHTML = "A causa di un problema nel sistema di segnalazione dei suggerimenti non &egrave; stato possibile segnalare il problema... <br><strong>OMG questo s&igrave; che &egrave; un problema molto serio!!! -_-</strong><br><br>Ad ogni modo, per segnalare il problema puoi inviare una mail a <a href='mailto:toc-toc@teammolise.rocks'>toc-toc@teammolise.rocks</a>"
    	// showing sending error
    	this.$.errorMsgDialog.toggle();
    	// showing button
    	this.$.buttonSend.disabled = false;
    	this.$.buttonSend.style.display = "inline-block";
    	this.$.sending.active = false;
    }
});