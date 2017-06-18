<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
      $(function(){

          $("#canceil").on("click", function(){

                var result = confirm("취소 하시겟습니까?");
                if(result){
                  var url = "/board/listPage";
                  $(location).attr("href", url);
                }
          });

      });
    </script>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>

        <form class="" action="/board/register" method="post">
          <p>제목: <input type="text" name="title" value=""></p>
          <p>작성자 : <input type="text" name="writer" value=""></p>
          <p>내용: <textarea name="content" rows="8" cols="80"></textarea></p>
          <div class="btnGroup">
              <input type="submit" name="" value="글작성">
              <button type="button" id="canceil">취소</button>
          </div>
        </form>

  </body>
</html>
