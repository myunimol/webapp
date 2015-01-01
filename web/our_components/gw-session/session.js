Polymer('gw-session', {
	ready: function() {
	},
	
	observe: {
		sessions: 'reloadSessions'
	},

    reloadSessions: function() {
    	this.$.sessionsContainer.innerHTML = "";
    	for (var i = 0; i < this.sessions.length; i++) {
    		var element = document.createElement("gw-sessionel");
    		element.session = this.sessions[i];
    		
    		this.$.sessionsContainer.appendChild(element);
    	}
    	
    	if (this.sessions.length == 0) {
    		var element = document.createElement("div");
    		element.className = 'noSessions';
    		element.innerHTML = "Nessun appello disponibile";
    		this.$.sessionsContainer.appendChild(element);
    	}
    }
});