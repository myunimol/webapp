Polymer('fp-recordbook', {
	observe: {
		exams: 'reloadSessions'
	},
	
    ready: function() {
    },
    
    reloadSessions: function() {
    	this.spin(false);
    	this.async(function() {
    		var i = 0;
	    	var container = document.getElementById('fpexpandible'+i);
	    	while (container != null) {
	    		container.exam = this.exams[i];
	    		container.ajaxResponse = this.loadexamResponse;
	    		container.addEventListener('click', function() {
	    			var ajax = document.getElementById('fpSingleRetriever'+this.exam.id);
	    			if (!ajax.loaded) {
	    				document.getElementById('collapse-element' + this.exam.id).toggle();
		    			ajax.params = '{"id":"' + this.exam.id + '"}';
		    			ajax.addEventListener('core-response', this.ajaxResponse);
		    			ajax.go();
	    			} else {
	    				document.getElementById('collapse-element' + this.exam.id).toggle();
	    			}
	    		})
	    		
	    		i++;
	    		container = document.getElementById('fpexpandible'+i);
	    	}
    	}, null, 1000);
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