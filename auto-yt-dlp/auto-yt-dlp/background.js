function copyToClipboard( text ){
    var copyDiv = document.createElement('div');
    copyDiv.contentEditable = true;
    document.body.appendChild(copyDiv);
    copyDiv.innerHTML = text;
    copyDiv.unselectable = "off";
    copyDiv.focus();
    document.execCommand('SelectAll');
    document.execCommand("Copy", false, null);
    document.body.removeChild(copyDiv);
}

//copies to clipboard a string of all open urls delimited by > and end of string by < 
chrome.browserAction.onClicked.addListener(function(tab){
	var links = "";
	const re = new RegExp('.*youtube.com\/watch.*');
	chrome.windows.getAll({populate:true},function(windows){
  		windows.forEach(function(window){
    		window.tabs.forEach(function(tab){
    			if (re.test(tab.url)){
      				links = links + tab.url + ';';
      			}
    		});
    		copyToClipboard(links);
;  		});
	});
});
