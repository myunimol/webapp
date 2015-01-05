Polymer('fp-recordbookel', {
	observe: {
		exam: 'reloadExam'
	},
	
    ready: function() {
    },
    
    reloadExam: function() {
    	if (this.exam.vote == 'SUP' || this.exam.vote == 'IDO')
    		this.$.container.setAttribute("kind", "ido");
    	else if (this.exam.vote == "/")
    		this.$.container.setAttribute("kind", "notPassed");
    	else {
    		this.$.container.setAttribute("kind", "passed");
    		if (this.exam.vote == "30L")
    			this.exam.vote = "30 / 30 e lode"
			else
    			this.exam.vote = this.exam.vote + " / 30"
    	}
    	
		this.$.ajax.addEventListener('myunimol-response', this.loadexamResponse);
		this.$.container.ajax = this.$.ajax;
		this.$.container.collapse = this.$.collapse;
		this.$.container.exam = this.exam;
		
		this.$.ajax.details = this.$.details;
		
		this.$.container.addEventListener('click', function() {
			if (!this.ajax.loaded) {
				this.collapse.toggle();
    			this.ajax.params = '{"id":"' + this.exam.id + '"}';
    			this.ajax.go();
			} else {
				this.collapse.toggle();
			}
    	});
    },
    
    loadexamResponse: function(event) {
    	var fpexam = this.details;
    	var ajax = this;
    	
    	ajax.loaded = true;
    	fpexam.exam = event.detail.response;
    	fpexam.details = event.detail.response.details;
    },
    
    spin: function(status) {
    	this.$.fprecordbookSpinner.active = status;
    }
});