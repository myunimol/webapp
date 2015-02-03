Polymer('myunimol-problem', {
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
    selectProblemAction: function(e, detail) {
    	if(detail.isSelected) {
    		var selectedItem = detail.item.$.label.innerHTML;
    		this.selectedProblem = selectedItem;
    		if(selectedItem == this.problems[this.problems.length-1]) {
    			this.$.other.style.display = "block";
    		} else {
    			this.$.other.style.display = "none";
    		}
    	}
    },
    selectedProblem: "",
    problems: ["Libretto",
               "Home",
               "Rubrica",
               "Ricerca in rubrica",
               "Appelli prenotati",
               "Appelli disponibili",
               "News di Ateneo",
               "News di Corso di Studi",
               "News di Dipartimento",
               "Pagamenti",
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
    		this.$.ajax.params = '{"type":"'+this.selectedProblem+'", "other":"'+this.$.otherProblem.value+'", "details":"'+this.$.details.value+'"}';
    		this.$.ajax.go();
    	}
    },
    checkFields: function() {
    	var msg = "";
    	var other = this.$.otherProblem.value;
    	var details = this.$.details.value;
    	if (this.selectedProblem == this.problems[this.problems.length-1]) {
    		if(other.length < 3) {
    			msg += "Compila il campo Altro";
    		}
    	} else if (this.selectedProblem == ""){
    		msg += "Compila il campo relativo al tipo di problema";
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
    	this.selectedProblem = "";
    	// showing thank you toast
    	this.$.thankyouToast.toggle();
    	// showing button
    	this.$.buttonSend.disabled = false;
    	this.$.buttonSend.style.display = "inline-block";
    	this.$.sending.active = false;
    },
    handleAjaxError: function(error) {
    	console.log(error);
    	this.$.errorMsg.innerHTML = "A causa di un problema nel sistema di segnalazione dei problemi non è stato possibile segnalare il problema... <br><strong>OMG questo sì che è un problema molto serio!!! -_-</strong><br><br>Ad ogni modo, per segnalare il problema puoi inviare una mail a <a href='mailto:toc-toc@teammolise.rocks'>toc-toc@teammolise.rocks</a>"
    	// showing sending error
    	this.$.errorMsgDialog.toggle();
    	// showing button
    	this.$.buttonSend.disabled = false;
    	this.$.buttonSend.style.display = "inline-block";
    	this.$.sending.active = false;
    }
});