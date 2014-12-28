Polymer('gw-session', {
	observe: {
		sessions: 'reloadSessions'
	},

    reloadSessions: function() {
    	this.async(function() {
	    	var i = 0;
	    	var container = document.getElementById('gwexpandible'+i);
	    	while (container != null) {
	    		container.elementIndex = i;
	    		container.addEventListener('click', function() {
	    			document.getElementById('collapse-element' + this.elementIndex).toggle();
	    		})
	    		
	    		var button = document.getElementById('enrolled-button'+i);
	    		button.elementId = this.sessions[i].id;
	    		button.onResponse = this.enrollResponse;
	    		
	    		button.addEventListener('click', function() {
	    			var reqst = document.getElementById("gwsession-request");
	    			reqst.addEventListener('core-response', this.onResponse);
	    			
	    	        reqst.params = '{"id": "' + this.elementId + '"}';
	    	        alert(reqst.params);
	    	        reqst.go();
	    		})
	    		
	    		i++;
	    		container = document.getElementById('gwexpandible'+i);
	    	}
    	}, null, 1000);
    },
    
    enrollResponse: function(event) {
    	if (event.details.result == 'success') {
    		//TODO: cosa fa se va bene la prenotazione
    	} else {
    		//TODO: messaggio di errore
    	}
    }
});