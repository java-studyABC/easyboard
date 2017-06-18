<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
#pagingLink{
	text-decoration : none;

}


</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$(function() {
		var page = '${cri.page}';
		var perPageNum = '${cri.perPageNum}';
		var msg = '${msg}';
		console.log(page);
		console.log(perPageNum);
		console.log("msg: " + msg);
		checkMsg(msg);
		
		$("#registerBtn").on("click", function() {

			$(location).attr("href", "/board/register");
		});

		/*  $("tbody").on(
				"click",
				"#readPageLink",
				function() {
					linkObj = $(this);
					var bno = linkObj.attr("data-bno");
					console.log("bno: " + bno);
					var url = "/board/readPage?bno=" + bno + "&page=" + page
							+ "&perPageNum=" + perPageNum;
					console.log("url값: " + url);
					$(location).attr("href", url);

		});  */

		function checkMsg(msg) {
			if (msg == 'rmSUCCESS') {
				alert("삭제 성공");
			} else if (msg == 'modSUCCESS') {
				alert("수정 성공");
			}

		}
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button id="registerBtn">글쓰기</button>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${vo.bno}</td>
					<td><a id="readPageLink" data-bno='${vo.bno}' href="/board/readPage?bno=${vo.bno}&page=${cri.page}&perPageNum=${cri.perPageNum}">${vo.title}</a></td>
					<td>${vo.content}</td>
					<td>${vo.writer}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd(E)" value="${vo.regdate}" /></td>
					<td>${vo.viewcnt}</td>
				</tr>
			</c:forEach>
		</tbody>


	</table>

	<div id="paging">
		<c:if test="${pageMaker.prev}">
			<a
				href="/board/listPage?page=${pageMaker.startPage - 1}&perPageNum=${cri.perPageNum}">&lt;</a>
		</c:if>

		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
			varStatus="i">

			<c:choose>
				<c:when test="${cri.page == i.current}">
						${i.current}
					</c:when>
				<c:otherwise>
					<a id="pagingLink"
						href="/board/listPage?page=${i.current}&perPageNum=${cri.perPageNum}">
						&nbsp;${i.current} 
						
					</a>
				</c:otherwise>
			</c:choose>

		</c:forEach>

		<c:if test="${pageMaker.next}">
			<a
				href="/board/listPage?page=${pageMaker.endPage + 1}&perPageNum=${cri.perPageNum}">
				&gt; 
			</a>

		</c:if>


	</div>

</body>
</html>