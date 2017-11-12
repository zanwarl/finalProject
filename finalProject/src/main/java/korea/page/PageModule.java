package korea.page;

public class PageModule {

	public static String makePage(String pageName, int totalCnt, int listSize, int pageSize, int cp) {

		StringBuffer sb = new StringBuffer();

		int pageCnt = totalCnt / listSize + 1;

		if (totalCnt % listSize == 0) {
			pageCnt--;
		}

		int userGroup = cp / pageSize;

		if (cp % pageSize == 0) {
			userGroup--;

		}

		if (userGroup != 0) {
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");

			int temp = (userGroup - 1) * pageSize + pageSize;

			sb.append(temp);
			sb.append("'>&lt;&lt;</a>");

		}

		for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {

			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");

			if (i == pageCnt) {
				break;
			}
		}

		if (userGroup != (pageCnt / pageSize - (pageCnt % pageSize == 0 ? 1 : 0))) {

			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");

			int temp = (userGroup + 1) * pageSize + 1;

			sb.append(temp);
			sb.append("'>&gt;&gt;</a>");

		}

		return sb.toString();
	}

	//검색기능 추가 (controller에서 호출 시 맨 뒤에 queryStr 추가)
	public static String makePage(String pageName, int totalCnt, int listSize, int pageSize, int cp, String queryStr) {
		StringBuffer sb = new StringBuffer();

		int pageCnt = totalCnt / listSize + 1;

		if (totalCnt % listSize == 0) {
			pageCnt--;
		}

		int userGroup = cp / pageSize;
		System.out.println(userGroup);
		if (cp % pageSize == 0) {
			userGroup--;

		}
		if (userGroup != 0) {
			sb.append("<a href='");
			sb.append(pageName);
			if (queryStr != null) {
				sb.append("&cp=");
			} else {
				sb.append("?cp=");
			}

			int temp = (userGroup - 1) * pageSize + pageSize;

			sb.append(temp);
			sb.append("'>&lt;&lt;</a>");

		}

		System.out.println((userGroup * pageSize + 1) + " " + (userGroup * pageSize + pageSize));
		for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pageName);
			if (queryStr != null) {
				sb.append("&cp=");
			} else {
				sb.append("?cp=");
			}
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");

			if (i == pageCnt) {
				break;
			}
		}

		if (userGroup != (pageCnt / pageSize - (pageCnt % pageSize == 0 ? 1 : 0))) {

			sb.append("<a href='");
			sb.append(pageName);
			if (queryStr != null) {
				sb.append("&cp=");
			} else {
				sb.append("?cp=");
			}
			int temp = (userGroup + 1) * pageSize + 1;

			sb.append(temp);
			sb.append("'>&gt;&gt;</a>");

		}
		System.out.println(sb);
		return sb.toString();
	}
	
	public static String page(String pageName, int totalCnt, int listSize, int pageSize, int cp) {
		StringBuffer sb = new StringBuffer();
		int totalPage = (totalCnt-1)/listSize+1; //총 페이지 수
		int startNum = cp - (cp-1) % pageSize;; //처음 페이지
		int endNum = startNum + (pageSize - 1); //마지막 페이지
		
		System.out.println("0");
		
		if(endNum > totalPage) {
			endNum = totalPage;
		}
		
		if(startNum!=1) {
			System.out.println("1");
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int tmp = startNum-1;
			sb.append(tmp);
			sb.append("'>&lt;&lt;</a>");
			//str += "<a href='"+pageName+"="+(startNum-1)+"'>"+"<<이전"+"</a> ";
		}
		for(int i=startNum;i<=endNum;i++) {
			System.out.println("2222");
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>&nbsp;"+i+"&nbsp;</a>");
			//str += "<a href='"+pageName+"="+i+"'>"+i+"</a> ";
		}
		if(endNum!=totalPage) {
			System.out.println("3");
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int tmp = endNum+1;
			sb.append(tmp);
			sb.append("'>&gt;&gt;</a>");
			//str += "<a href='"+pageName+"="+(endNum+1)+"'>"+"다음>>"+"</a> ";
		}
		
		return sb.toString();
	}
	
	public static String page(String pageName, int totalCnt, int listSize, int pageSize, int cp, String queryStr) {
		StringBuffer sb = new StringBuffer();
		int totalPage = (totalCnt-1)/listSize+1; //총 페이지 수
		int startNum = cp - (cp-1) % pageSize;; //처음 페이지
		int endNum = startNum + (pageSize - 1); //마지막 페이지
		
		if(endNum > totalPage) {
			endNum = totalPage;
		}
		
		if(startNum!=1) {
			System.out.println("1");
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int tmp = startNum-1;
			sb.append(tmp);
			sb.append("'>&lt;&lt;</a>");
			//str += "<a href='"+pageName+"="+(startNum-1)+"'>"+"<<이전"+"</a> ";
		}
		for(int i=startNum;i<=endNum;i++) {
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>&nbsp;"+i+"&nbsp;</a>");
		}
		if(endNum!=totalPage) {
			System.out.println("3");
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int tmp = endNum+1;
			sb.append(tmp);
			sb.append("'>&gt;&gt;</a>");
			//str += "<a href='"+pageName+"="+(endNum+1)+"'>"+"다음>>"+"</a> ";
		}
		
		return sb.toString();
	}
}
