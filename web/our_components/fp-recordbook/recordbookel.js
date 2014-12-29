Polymer('fp-recordbookel', {
	observe: {
		exam: 'reloadExam'
	},
	
    ready: function() {
    },
    
    reloadExam: function() {
		this.$.ajax.addEventListener('core-response', this.loadexamResponse);
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