Polymer('fp-recordbookel', {
	observe : {
		exam : 'reloadExam'
	},

	ready : function() {
	},

	reloadExam : function() {
		if (this.exam.vote == 'SUP' || this.exam.vote == 'IDO')
			this.$.container.setAttribute("kind", "ido");
		else if (this.exam.vote == "/")
			this.$.container.setAttribute("kind", "notPassed");
		else {
			this.$.container.setAttribute("kind", "passed");
			// if (this.exam.vote == "30L")
			// this.exam.vote = "30 / 30 e lode"
			// else
			// this.exam.vote = this.exam.vote + " / 30"
			if (this.exam.vote == "" || this.exam.vote == "/") {
				this.exam.vote = "-";
			}
		}
		if (this.exam.date == "" || this.exam.date == "/"
				|| this.exam.date == null) {
			this.$.placeholderDate.innerHTML = "";
			this.exam.date = "";
		}
		this.exam.name = this.exam.name.replace(/\d+[ \s ]-[ \s ]/, '');
		this.$.ajax
				.addEventListener('myunimol-response', this.loadexamResponse);
		this.$.container.ajax = this.$.ajax;
		this.$.container.collapse = this.$.collapse;
		this.$.container.exam = this.exam;

		this.$.ajax.details = this.$.details;

		var examName = this.$.examName;
		var examDate = this.$.examDate;
		
		this.$.container.addEventListener('click', function() {
			var animateHeader = function(elem, expanding, foutDuration, finDuration) {
				$(elem).fadeOut(foutDuration, "swing", function() {
					if(expanding) {
						elem.style.textAlign = "center";
						$(elem).fadeIn(finDuration, "swing");
					} else {
						elem.style.textAlign = "left";
						$(elem).fadeIn(finDuration*5, "swing");
					}
				});
			};
			var fadingDuration = 300;
			if (!this.ajax.loaded) {
				this.collapse.toggle();
				this.ajax.params = '{"id":"' + this.exam.id + '"}';
				this.ajax.go();
				animateHeader(examName, true, fadingDuration, fadingDuration);
				animateHeader(examDate, true, fadingDuration, fadingDuration);
			} else {
				this.collapse.toggle();
				animateHeader(examName, this.collapse.opened, fadingDuration, fadingDuration);
				animateHeader(examDate, this.collapse.opened, fadingDuration, fadingDuration);
			}
		});
	},

	loadexamResponse : function(event) {
		var fpexam = this.details;
		var ajax = this;

		ajax.loaded = true;
		fpexam.exam = event.detail.response;
		fpexam.details = event.detail.response.details;
	},

	spin : function(status) {
		this.$.fprecordbookSpinner.active = status;
	}
});