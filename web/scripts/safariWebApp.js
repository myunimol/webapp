// added this glitch to avoid link opening into new Safari window 
$(document).ready(
		function() {

			var nonBlockingTargets = [ "__blank", "_blank", "blank", "new",
					"_new", "__new" ];

			function isWordInArrayOfWords(words, word) {
				if (word == null)
					return false;
				return words.indexOf(word.toLowerCase()) > -1;
			}

			$("a").on('click', function() {
				var target = $(this).attr("target");
				if (!isWordInArrayOfWords(nonBlockingTargets, target)) {
					window.location = $(this).attr("href");
					return false;
				}
			});
		});
