paging = function(pageName, totalCnt, listSize, pageSize, cp, queryStr) {
	var totalPage = (totalCnt-1)/listSize+1; //총 페이지 수
	var startNum = cp - (cp-1) % pageSize;; //처음 페이지
	var endNum = startNum + (pageSize - 1); //마지막 페이지
	
	var html = new Array();
	
	if(endNum > totalPage) {
		endNum = totalPage;
	}
	
	if(startNum!=1) {
		html.push("<a href='");
		html.push(pageName);
		html.push("?cp=");
		var tmp = startNum-1;
		html.push(tmp);
		html.push("'>&lt;&lt;</a>");
		//str += "<a href='"+pageName+"="+(startNum-1)+"'>"+"<<이전"+"</a> ";
	}
	for(var i=startNum;i<=endNum;i++) {
		if(i==cp) {
			html.push("<b><a href='");
			html.push(pageName);
			if (queryStr != null) {
				html.push("&cp=");
			} else {
				html.push("?cp=");
			}
			html.push(i);
			html.push("'>&nbsp;"+i+"&nbsp;</a></b>");
			//str += "<b><a href='"+pageName+"="+i+"'>"+i+"</a></b> ";
		} else {
			html.push("<a href='");
			html.push(pageName);
			if (queryStr != null) {
				html.push("&cp=");
			} else {
				html.push("?cp=");
			}
			html.push(i);
			html.push("'>&nbsp;"+i+"&nbsp;</a>");
			//str += "<a href='"+pageName+"="+i+"'>"+i+"</a> ";
		}
	}
	if(endNum!=totalPage) {
		html.push("<a href='");
		html.push(pageName);
		if (queryStr != null) {
			html.push("&cp=");
		} else {
			html.push("?cp=");
		}
		var tmp = endNum+1;
		html.push(tmp);
		html.push("'>&gt;&gt;</a>");
		//str += "<a href='"+pageName+"="+(endNum+1)+"'>"+"다음>>"+"</a> ";
	}
	
	return html.join("");
}