Polymer('fp-recordbook', {
	observe: {
		exams: 'reloadSessions'
	},
	
    ready: function() {
    },
    
    reloadSessions: function() {
    	this.$.examsContainer.innerHTML = "";
    	for (var i = 0; i < this.exams.length; i++) {
    		var element = document.createElement("fp-recordbookel");
    		element.exam = this.exams[i];
    		
    		this.$.examsContainer.appendChild(element);
    	}
    	this.spin(false);
    },
    
    loadexamResponse: function(event) {
    	var fpexam = document.getElementById('fp-details'+event.detail.response.id);
    	var ajax = document.getElementById('fpSingleRetriever'+event.detail.response.id);
    	ajax.loaded = true;
    	fpexam.exam = event.detail.response;
    	fpexam.details = event.detail.response.details;
    	//document.getElementById('collapse-element' + event.detail.response.id).toggle();
    },
    
    spin: function(status) {
    	this.$.fprecordbookSpinner.active = status;
    }
});