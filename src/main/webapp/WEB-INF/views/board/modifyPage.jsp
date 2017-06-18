<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
      $(function(){
    	  var page = '${cri.page}';
          var perPageNum = '${cri.perPageNum}';
          var bno = '${vo.bno}';
         // 사용자가 페이지에 접근하면 폼태그 생성
          console.log("page=" + page);
          console.log("perPageNum="+perPageNum);
          console.log("bno="+bno);
    	  
    	  
          $("#canceil").on("click", function(){

                var result = confirm("취소 하시겟습니까?");
                if(result){
                	
                    $(location).attr("href", "/board/listPage?page="+page+"&perPageNum="+perPageNum);

                }

          });

      });
    </script>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>

        <form class="" action="/board/modifyPage" method="post">
          <input type="hidden" name="page" value="${cri.page}">
          <input type="hidden" name="perPageNum" value="${cri.perPageNum}">
          <input type="hidden" name="bno" value="${vo.bno}">
          <p>제목: <input type="text" name="title" value="${vo.title}"></p>
          <p>내용: <textarea name="content" rows="8" cols="80">${vo.content}</textarea></p>
          <div class="btnGroup">
              <input type="submit" name="" value="글수정">
              <button type="button" id="canceil">취소</button>
          </div>
        </form>


  </body>
</html>
