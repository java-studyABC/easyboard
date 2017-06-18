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
      var msg = '${msg}';
     // 사용자가 페이지에 접근하면 폼태그 생성
      createForm();
      console.log("page=" + page);
      console.log("perPageNum="+perPageNum);
      console.log("bno="+bno);
	  console.log("msg="+msg);
      
	  if(msg == 'modSUCCESS'){
		  alert("수정 성공");
	  }
      
      
      $("#modBtn").on("click", function(){

    	  var url = '/board/modifyPage?bno='+bno+'&page='+page+'&perPageNum='+perPageNum;
    	  console.log("url: "+url);
    	  attrForm(url, 'get');
  	 	
      });

      $("#rmBtn").on("click", function(){
			var url = '/board/remove?bno='+bno+'&page='+page+'&perPageNum='+perPageNum;
    		attrForm(url, 'post');
      });

      $("#listBtn").on("click", function(){
        var url = "/board/listPage?page="+page+"&perPageNum="+perPageNum;
          $(location).attr("href", url);
      });

      function createForm(){
    	  
    	  var form = $('<form></form>');
    	  form.attr('action', "");
    	  form.attr("method", "");
    	  form.appendTo("body");
    	  
    	  // page값과 perPageNum값을 셋팅
    	  var pageTxt = $("<input type='hidden' name='page' value='"+page+"' >");
    	  var perPageNumTxt = $("<input type='hidden' name='perPageNum' value='"+perPageNum+"' >");
    	  var bnoTxt = $("<input type='hidden' name='bno' value='"+bno+"'>");
    	  form.append(pageTxt);
    	  form.append(perPageNumTxt);
    	  form.append(bnoTxt);
      }
      
      function attrForm(url, method){

    	  $("form").attr("action", url);
    	  $("form").attr("method", method);
    	  $("form").submit();
      }
      
  });



</script>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <p>번호:${vo.bno}</p>
    <p>제목:${vo.title}</p>
    <p>작성자:${vo.writer}</p>
    <p>날짜:${vo.regdate}</p>
    <p>조회수:${vo.viewcnt}</p>
    <p>내용:${vo.content}</p>

    <div class="btnGroup">
        <button type="button" id="modBtn"  name="button">수정</button>
        <button type="button" id="rmBtn" name="button">삭제</button>
        <button type="button" id="listBtn" name="button">목록</button>
    </div>

  </body>
</html>
