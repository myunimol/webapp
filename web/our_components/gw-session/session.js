Polymer('gw-session', {
	ready: function() {
		this.super();
		
		this.elementName = "gw-sessionel";
		this.elementProperty = "session";
	},
	
	observe: {
		sessions: 'reloadSessions'
	},

    reloadSessions: function() {
    	this.elements = this.sessions
    }
});