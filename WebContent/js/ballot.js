var divs = ['page1', 'page2', 'page3'];
var visiblePageId = null;
var name1, name2;

function showLayer(page) {
	if(visiblePageId === page) {
		visiblePageId = null;
	}
	else {
		visiblePageId = page;
	}
	hideNonVisibleDivs();
}
function hideNonVisibleDivs() {
  var i, divId, div;
  for(i = 0; i < divs.length; i++) {
    divId = divs[i];
    div = document.getElementById(divId);
    console.log("Hello"+div);
    if(visiblePageId === divId) {
      div.style.visibility = "visible";
    } else {
      div.style.visibility = "hidden";
    }
  }
}

function onInputClick(candidate, position) {
	var candidateInfo = candidate.split(";");
	for (var i = 0; i < candidateInfo.length; i++) {
		if (position == "President") {
			name1 = candidateInfo[1];
		}
		if (position == "Chairman") {
			name2 = candidateInfo[1];
		}
		if (position == "EC") {
			name3 = candidateInfo[1];
		}
	}
}
function summary() {

	var selectedval = [];
	$("input[type='checkbox']:checked").each(function(i){
		selectedval[i] = $("#checkBox").val();
		console.log(selectedval[i]);
	});
	
	if(name1 === undefined){
		name1 = "None selected";
	}
	if(name2 === undefined){
		name2 = "None selected";
	}
	
	document.getElementById('summary').innerHTML = "Your selection Summary <br>"
		+ "<br> President -> "
		+ name1
		+ "<br>"
		+ " Chairman -> " 
		+ name2
		+ "<br>"
		+ "Committee -> "
		+ selectedval;
}

