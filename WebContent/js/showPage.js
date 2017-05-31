var currentLayer = 'page1';

function showLayer(lyr) {
    hideLayer(currentLayer);
    document.getElementById(lyr).style.visibility = 'visible';
    currentLayer = lyr;
}

function hideLayer(lyr) {
    document.getElementById(lyr).style.visibility = 'hidden';
}
