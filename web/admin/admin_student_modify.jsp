<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>修改学生</title>
		<meta name="description" content="Blueprint: Tooltip Menu" />
		<meta name="keywords" content="Tooltip Menu, navigation, tooltip, menu, css, web development, template" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/component.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin.css">
		<script src="${pageContext.request.contextPath}/js/modernizr.custom.js"></script>
	</head>
	<body>
		<%@include file="admin_navigator.jsp"%>

		<div class="wrap">
			<form action="${pageContext.request.contextPath}/UpdatedStudentServlet">
				<div class="form-group controls">
					<input id="sno" name="sno" value="${student.sno}" type="text" class="form-control floatLabel">
					<label for="sno">学号</label>
				</div>

				<div class="form-group controls">
					<input id="sname" name="sname" value="${student.sname}" type="text" class="form-control floatLabel">
					<label for="sname">姓名</label>
				</div>
				<div class="form-group controls">
					<input id="ssex" name="ssex" value="${student.ssex}" type="text" class="form-control floatLabel">
					<label for="ssex">性别</label>
				</div>
				<div class="form-group controls">
					<input id="sage" name="sage" value="${student.sage}" type="text" class="form-control floatLabel">
					<label for="sage">年龄</label>
				</div>
				<div class="form-group controls">
					<input id="syear" name="syear" value="${student.syear}" type="text" class="form-control floatLabel">
					<label for="syear">年级</label>
				</div>
				<div class="form-group controls">
					<input id="smajor" name="smajor" value="${student.smajor}" type="text" class="form-control floatLabel">
					<label for="smajor">专业</label>
				</div>
				<div class="form-group controls">
					<input id="c_no" name="c_no" value="${student.c_no}" type="text" class="form-control floatLabel">
					<label for="c_no">班级号</label>
				</div>

				<div class="check">
					<input type="submit" class="btn" value="确定">
				</div>
			</form>
		</div>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/cbpTooltipMenu.min.js"></script>
		<script>
			var menu = new cbpTooltipMenu( document.getElementById( 'cbp-tm-menu' ) );
		</script>
		<script>
			$(document).ready(function(){
      	checkValue();
        floatLabel('.floatLabel');
      });

      //浮动标签效果
      function floatLabel(inputType) {
        $(inputType).each(function () {
          var $this = $(this);
          $this.focus(function () {
              $this.next().addClass('lb-active');
          });
          $this.blur(function () {
              if ($this.val() === '' || $this.val() === 'blank') {
                  $this.next().removeClass();
              }
          });
        });
      }

      //检查表单里的数据，当表单里的数据不为空时，为标签添加浮动样式
      function checkValue(){
      	$("input").each(function(){
          var $this=$(this);
          if($this.val()!=""){
            $this.next().addClass('lb-active');
          }
        });
      }
		</script>
	</body>
</html>
