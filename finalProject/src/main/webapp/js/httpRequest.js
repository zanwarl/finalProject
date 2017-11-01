var XHR = null;

function getXHR() {
	if(window.ActiveXObject) {
		return new ActiveXObject('Msxml2.XMLHTTP');
	} else if(window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else {
		return null;
	}
}

function sendRequest(url, params, callback, method) {
	XHR = getXHR();
	
	//1.접속방식의 검증
	var httpMethod = method?method:'GET';
	if(httpMethod != 'GET' && httpMethod != 'POST') {
		httpMethod = 'GET';
	}
	
	//2.파라미터 검증
	var httpParams = (params==null || params=='')?null:params;
	
	//3.접속방식에 따른 파라미터 처리
	var httpUrl = url;
	if(httpMethod == 'GET' && httpParams != null) {
		httpUrl = url + '?' + httpParams;
	}
	
	XHR.onreadystatechange = callback;
	XHR.open(httpMethod,httpUrl,true);
	XHR.setRequestHeader('Cotent-Type','application/x-www-form-urlencoded');
	XHR.send(httpMethod == 'POST'?httpParams:null);
}



