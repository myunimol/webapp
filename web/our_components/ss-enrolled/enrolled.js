Polymer('ss-enrolled', {
	ready: function() {
	},
	
	observe: {
		sessions: 'reloadSessions'
	},

    reloadSessions: function() {
    	this.$.sessionsContainer.innerHTML = "";
    	if (this.sessions.length == 0) {
    		document.getElementById("no-sessions").style.display = "block";
    	} else {
    		document.getElementById("no-sessions").style.display = "none";
        	for (var i = 0; i < this.sessions.length; i++) {
        		var element = document.createElement("ss-enrolledel");
        		element.session = this.sessions[i];
        		
        		this.$.sessionsContainer.appendChild(element);
        	}
    	}
    }
});