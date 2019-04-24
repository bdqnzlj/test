<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户信息管理系统</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
    <script>
        function deleteUser(id) {
            //用户提示安全
            if(confirm("您确认要删除吗?")){
                    location.href="${pageContext.request.contextPath}/delUserServlet?id="+id;
            }
        }
        window.onload = function () {
            document.getElementById("delSelected").onclick = function () {
                if(confirm("您确定要删除选择的条目吗?")){
                    var flag = false;
                    //判断是否有条目
                    var byName = document.getElementsByName("uid");
                    for (var i = 0; i < byName.length ; i++) {
                        if(byName[i].checked){
                            flag = true;
                            break;
                        }
                    }
                    if (flag){//代表有条目
                        document.getElementById("form").submit();
                    }
                }

            }

            document.getElementById("firstCb").onclick = function () {
                var elementsByName = document.getElementsByName("uid");
                for (var i = 0; i < elementsByName.length; i++) {
                    elementsByName[i].checked = this.checked;
                }
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h3 style="text-align: center">用户信息列表</h3>
    <div style="float: left">
        <form class="form-inline" action="${pageContext.request.contextPath}/findUserByPageServlet" method="post">
            <div class="form-group">
                <label for="exampleInputName2">姓名</label>
                <input type="text" name="name" value="${map.name[0]}" class="form-control" id="exampleInputName2" placeholder="如:李杰">
            </div>
            <div class="form-group">
                <label for="exampleInputAddress2">籍贯</label>
                <input type="text" name="address" value="${map.address[0]}" class="form-control" id="exampleInputAddress2" placeholder="如:长沙">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">邮箱</label>
                <input type="text" name="eamil" value="${map.eamil[0]}" class="form-control" id="exampleInputEmail2" placeholder="如:jane.doe@example.com">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>
    </div>
    <div style="float: right;margin: 5px">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/add.jsp">添加联系人</a>
        <a class="btn btn-primary" href="javaScript:void(0)" id="delSelected">删除选中</a>
    </div>
    <form action="${pageContext.request.contextPath}/delSelectedServlet" id="form" method="post">
        <table border="1" class="table table-bordered table-hover">
        <tr class="success">
            <th><input type="checkbox" id="firstCb"></th>
            <th>编号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>籍贯</th>
            <th>QQ</th>
            <th>邮箱</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pb.list}" var="user" varStatus="s">
            <tr>
                <td><input type="checkbox" name="uid" value="${user.id}"></td>
                <td>${s.count}</td>
                <td>${user.name}</td>
                <td>${user.sex}</td>
                <td>${user.age}</td>
                <td>${user.address}</td>
                <td>${user.QQ}</td>
                <td>${user.eamil}</td>
                <td><a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/updUserServlet?id=${user.id}">修改</a>&nbsp;<a class="btn btn-default btn-sm" href="javascript:deleteUser(${user.id});">删除</a></td>
            </tr>

        </c:forEach>
    </table>
    </form>
</div>
<div style="margin-left: 105px">
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <c:if test="${pb.currentPage == 1}">
            <li class="disabled">
                </c:if>

                <c:if test="${pb.currentPage != 1}">
            <li>
                </c:if>


                <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage - 1}&rows=5&name=${map.name[0]}&address=${map.address[0]}&email=${map.eamil[0]}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>


            <c:forEach begin="1" end="${pb.totalPage}" var="i" >


                <c:if test="${pb.currentPage == i}">
                    <li class="active"><a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=5&name=${map.name[0]}&address=${map.address[0]}&email=${map.eamil[0]}">${i}</a></li>
                </c:if>
                <c:if test="${pb.currentPage != i}">
                    <li><a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=5&name=${map.name[0]}&address=${map.address[0]}&eamil=${map.eamil[0]}">${i}</a></li>
                </c:if>

            </c:forEach>
                <c:if test="${pb.currentPage == pb.totalPage}">
                <li class="disabled">
                    </c:if>

                    <c:if test="${pb.currentPage != pb.totalPage}">
                <li>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage + 1}&rows=5&name=${map.name[0]}&address=${map.address[0]}&email=${map.eamil[0]}" aria-label="Previous">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            <span style="font-size: 25px;margin-left: 5px;">
                    共${pb.totaCount}条记录，共${pb.totalPage}页
            </span>

        </ul>
    </nav>
</div>
</body>
</html>
