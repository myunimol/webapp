Polymer('fp-recordbook', {
	observe: {
		exams: 'reloadSessions'
	},
	
    ready: function() {
    	this.super();
		this.elementName = "fp-recordbookel";
		this.elementProperty = "exam";
    },
    
    reloadSessions: function() {
    	this.elements = this.exams;
    }
});