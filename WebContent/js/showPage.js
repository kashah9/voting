var divs = ['page1', 'page2', 'page3'];
var visiblePageId = null;

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


