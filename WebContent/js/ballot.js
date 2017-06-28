
var name1, name2;
function onInputClick(candidate, position) {
	var candidateInfo = candidate.split(";");
	for (var i = 0; i < candidateInfo.length; i++) {
		if (position == "President") {
			name1 = candidateInfo[1];
		}
		if (position == "Chairman") {
			name2 = candidateInfo[1];
		}
	}
}
function summary() {

	// for two positions for now (manually add id for each position)
	var selectedVal = "";
	var selectedLabel1 = $("#label1 input[type='radio']:checked");
	var selectedLabel2 = $("#label2 input[type='radio']:checked");
	if (selectedLabel1.length > 0 || selectedLabel2.length > 0) {
		selectedVal1 = selectedLabel1.val();
		selectedVal2 = selectedLabel2.val();
	}
	// console.log();
	document.getElementById('summary').innerHTML = "Your selection Summary <br>"
			+ selectedVal1
			+ " President -> "
			+ name1
			+ "<br>"
			+ selectedVal2
			+ " Chairman -> " + name2;
}

