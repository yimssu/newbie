<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form id='a' method='post'>

<input id='b' type='hidden' name='ddd'>
<button>dddd</button>
</form>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script>
var test = new Array();
test.push("sdf");
test.push("ssss");
test.push("saaaa");

console.log(test);

$("#b").val(test);

console.log($("#b").val());

</script>

</body>
</html>