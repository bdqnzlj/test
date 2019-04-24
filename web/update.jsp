<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
    <head>
        <!-- 指定字符集 -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>修改用户</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery-2.1.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        
    </head>
    <body>
        <div class="container" style="width: 400px;">
        <h3 style="text-align: center;">修改联系人</h3>
        <form action="${pageContext.request.contextPath}/updateUserServlet" method="post">
            <%--隐藏域,用来获取id--%>
                <input type="hidden" name="id" value="${user.id}">
          <div class="form-group">
            <label for="name">姓名：</label>
            <input type="text" class="form-control" id="name" value="${user.name}"  name="name"  readonly="readonly" placeholder="请输入姓名" />
          </div>

          <div class="form-group">
            <label>性别：</label>
              <c:if test="${user.sex=='男'}">
              <input type="radio" name="sex" value="男"  checked/>男
                <input type="radio" name="sex" value="女"  />女
              </c:if>
              <c:if test="${user.sex=='女'}">
                  <input type="radio" name="sex" value="男"  />男
                  <input type="radio" name="sex" value="女"  checked/>女
              </c:if>
          </div>

          <div class="form-group">
            <label for="age">年龄：</label>
            <input type="text" class="form-control" id="age" value="${user.age}"   name="age" placeholder="请输入年龄" />
          </div>

          <div class="form-group">
            <%--@declare id="address"--%><label for="address">籍贯：</label>
             <select name="address" class="form-control" >
                 <c:if test="${user.address=='广东'}">
                     <option value="广东" selected>广东</option>
                     <option value="东北省">东北省</option>
                     <option value="浙江省">浙江省</option>
                     <option value="黑龙江">黑龙江</option>
                     <option value="平江县">平江县</option>
                     <option value="长沙市">长沙市</option>
                     <option value="郴州">郴州</option>
                     <option value="张家界">张家界</option>
                     <option value="衡阳省">衡阳省</option>
                     <option value="广西">广西</option>
                     <option value="湖南">湖南省</option>
                     <option value="山西">山西省</option>
                     <option value="北京">北京市</option>
                     <option value="河北">河北</option>
                     <option value="湖北">湖北省</option>
                     <option value="深圳">深圳</option>
                     <option value="上海">上海市</option>
                 </c:if>
                 <c:if test="${user.address=='东北省'}">
                     <option value="广东" >广东</option>
                     <option value="东北省" selected>东北省</option>
                     <option value="浙江省">浙江省</option>
                     <option value="黑龙江">黑龙江</option>
                     <option value="平江县">平江县</option>
                     <option value="长沙市">长沙市</option>
                     <option value="郴州">郴州</option>
                     <option value="张家界">张家界</option>
                     <option value="衡阳省">衡阳省</option>
                     <option value="广西">广西</option>
                     <option value="湖南">湖南省</option>
                     <option value="山西">山西省</option>
                     <option value="北京">北京市</option>
                     <option value="河北">河北</option>
                     <option value="湖北">湖北省</option>
                     <option value="深圳">深圳</option>
                     <option value="上海">上海市</option>
                 </c:if>
                 <c:if test="${user.address=='浙江省'}">
                     <option value="广东" >广东</option>
                     <option value="东北省" >东北省</option>
                     <option value="浙江省" selected>浙江省</option>
                     <option value="黑龙江">黑龙江</option>
                     <option value="平江县">平江县</option>
                     <option value="长沙市">长沙市</option>
                     <option value="郴州">郴州</option>
                     <option value="张家界">张家界</option>
                     <option value="衡阳省">衡阳省</option>
                     <option value="广西">广西</option>
                     <option value="湖南">湖南省</option>
                     <option value="山西">山西省</option>
                     <option value="北京">北京市</option>
                     <option value="河北">河北</option>
                     <option value="湖北">湖北省</option>
                     <option value="深圳">深圳</option>
                     <option value="上海">上海市</option>
                 </c:if>
                 <c:if test="${user.address=='黑龙江'}">
                 <option value="广东" >广东</option>
                 <option value="东北省" >东北省</option>
                 <option value="浙江省" >浙江省</option>
                 <option value="黑龙江" selected>黑龙江</option>
                 <option value="平江县">平江县</option>
                 <option value="长沙市">长沙市</option>
                 <option value="郴州">郴州</option>
                 <option value="张家界">张家界</option>
                 <option value="衡阳省">衡阳省</option>
                 <option value="广西">广西</option>
                 <option value="湖南">湖南省</option>
                 <option value="山西">山西省</option>
                 <option value="北京">北京市</option>
                 <option value="河北">河北</option>
                 <option value="湖北">湖北省</option>
                 <option value="深圳">深圳</option>
                 <option value="上海">上海市</option>
             </c:if>
                 <c:if test="${user.address=='平江县'}">
                     <option value="广东" >广东</option>
                     <option value="东北省" >东北省</option>
                     <option value="浙江省" >浙江省</option>
                     <option value="黑龙江" >黑龙江</option>
                     <option value="平江县" selected>平江县</option>
                     <option value="长沙市">长沙市</option>
                     <option value="郴州">郴州</option>
                     <option value="张家界">张家界</option>
                     <option value="衡阳省">衡阳省</option>
                     <option value="广西">广西</option>
                     <option value="湖南">湖南省</option>
                     <option value="山西">山西省</option>
                     <option value="北京">北京市</option>
                     <option value="河北">河北</option>
                     <option value="湖北">湖北省</option>
                     <option value="深圳">深圳</option>
                     <option value="上海">上海市</option>
                 </c:if>
                 <c:if test="${user.address=='长沙市'}">
                     <option value="广东" >广东</option>
                     <option value="东北省" >东北省</option>
                     <option value="浙江省" >浙江省</option>
                     <option value="黑龙江" >黑龙江</option>
                     <option value="平江县" >平江县</option>
                     <option value="长沙市" selected>长沙市</option>
                     <option value="郴州">郴州</option>
                     <option value="张家界">张家界</option>
                     <option value="衡阳省">衡阳省</option>
                     <option value="广西">广西</option>
                     <option value="湖南">湖南省</option>
                     <option value="山西">山西省</option>
                     <option value="北京">北京市</option>
                     <option value="河北">河北</option>
                     <option value="湖北">湖北省</option>
                     <option value="深圳">深圳</option>
                     <option value="上海">上海市</option>
                 </c:if>
                 <c:if test="${user.address=='郴州'}">
                     <option value="广东" >广东</option>
                     <option value="东北省" >东北省</option>
                     <option value="浙江省" >浙江省</option>
                     <option value="黑龙江" >黑龙江</option>
                     <option value="平江县" >平江县</option>
                     <option value="长沙市" >长沙市</option>
                     <option value="郴州" selected>郴州</option>
                     <option value="张家界">张家界</option>
                     <option value="衡阳省">衡阳省</option>
                     <option value="广西">广西</option>
                     <option value="湖南">湖南省</option>
                     <option value="山西">山西省</option>
                     <option value="北京">北京市</option>
                     <option value="河北">河北</option>
                     <option value="湖北">湖北省</option>
                     <option value="深圳">深圳</option>
                     <option value="上海">上海市</option>
                 </c:if>
                 <c:if test="${user.address=='张家界'}">
                     <option value="广东" >广东</option>
                     <option value="东北省" >东北省</option>
                     <option value="浙江省" >浙江省</option>
                     <option value="黑龙江" >黑龙江</option>
                     <option value="平江县" >平江县</option>
                     <option value="长沙市" >长沙市</option>
                     <option value="郴州" >郴州</option>
                     <option value="张家界" selected>张家界</option>
                     <option value="衡阳省">衡阳省</option>
                     <option value="广西">广西</option>
                     <option value="湖南">湖南省</option>
                     <option value="山西">山西省</option>
                     <option value="北京">北京市</option>
                     <option value="河北">河北</option>
                     <option value="湖北">湖北省</option>
                     <option value="深圳">深圳</option>
                     <option value="上海">上海市</option>
                 </c:if>
                 <c:if test="${user.address=='衡阳省'}">
                     <option value="广东" >广东</option>
                     <option value="东北省" >东北省</option>
                     <option value="浙江省" >浙江省</option>
                     <option value="黑龙江" >黑龙江</option>
                     <option value="平江县" >平江县</option>
                     <option value="长沙市" >长沙市</option>
                     <option value="郴州" >郴州</option>
                     <option value="张家界" >张家界</option>
                     <option value="衡阳省"selected>衡阳省</option>
                     <option value="广西">广西</option>
                     <option value="湖南">湖南省</option>
                     <option value="山西">山西省</option>
                     <option value="北京">北京市</option>
                     <option value="河北">河北</option>
                     <option value="湖北">湖北省</option>
                     <option value="深圳">深圳</option>
                     <option value="上海">上海市</option>
                 </c:if>
                 <c:if test="${user.address=='广西'}">
                     <option value="广东" >广东</option>
                     <option value="东北省" >东北省</option>
                     <option value="浙江省" >浙江省</option>
                     <option value="黑龙江" >黑龙江</option>
                     <option value="平江县" >平江县</option>
                     <option value="长沙市" >长沙市</option>
                     <option value="郴州" >郴州</option>
                     <option value="张家界" >张家界</option>
                     <option value="衡阳省">衡阳省</option>
                     <option value="广西" selected>广西</option>
                     <option value="湖南">湖南省</option>
                     <option value="山西">山西省</option>
                     <option value="北京">北京市</option>
                     <option value="河北">河北</option>
                     <option value="湖北">湖北省</option>
                     <option value="深圳">深圳</option>
                     <option value="上海">上海市</option>
                 </c:if>
                 <c:if test="${user.address=='湖南省'}">
                     <option value="广东" >广东</option>
                     <option value="东北省" >东北省</option>
                     <option value="浙江省" >浙江省</option>
                     <option value="黑龙江" >黑龙江</option>
                     <option value="平江县" >平江县</option>
                     <option value="长沙市" >长沙市</option>
                     <option value="郴州" >郴州</option>
                     <option value="张家界" >张家界</option>
                     <option value="衡阳省">衡阳省</option>
                     <option value="广西" >广西</option>
                     <option value="湖南" selected>湖南省</option>
                     <option value="山西">山西省</option>
                     <option value="北京">北京市</option>
                     <option value="河北">河北</option>
                     <option value="湖北">湖北省</option>
                     <option value="深圳">深圳</option>
                     <option value="上海">上海市</option>
                 </c:if>
                 <c:if test="${user.address=='山西省'}">
                     <option value="广东" >广东</option>
                     <option value="东北省" >东北省</option>
                     <option value="浙江省" >浙江省</option>
                     <option value="黑龙江" >黑龙江</option>
                     <option value="平江县" >平江县</option>
                     <option value="长沙市" >长沙市</option>
                     <option value="郴州" >郴州</option>
                     <option value="张家界" >张家界</option>
                     <option value="衡阳省">衡阳省</option>
                     <option value="广西" >广西</option>
                     <option value="湖南" >湖南省</option>
                     <option value="山西" selected>山西省</option>
                     <option value="北京">北京市</option>
                     <option value="河北">河北</option>
                     <option value="湖北">湖北省</option>
                     <option value="深圳">深圳</option>
                     <option value="上海">上海市</option>
                 </c:if>
                 <c:if test="${user.address=='北京市'}">
                     <option value="广东" >广东</option>
                     <option value="东北省" >东北省</option>
                     <option value="浙江省" >浙江省</option>
                     <option value="黑龙江" >黑龙江</option>
                     <option value="平江县" >平江县</option>
                     <option value="长沙市" >长沙市</option>
                     <option value="郴州" >郴州</option>
                     <option value="张家界" >张家界</option>
                     <option value="衡阳省">衡阳省</option>
                     <option value="广西" >广西</option>
                     <option value="湖南" >湖南省</option>
                     <option value="山西" >山西省</option>
                     <option value="北京" selected>北京市</option>
                     <option value="河北">河北</option>
                     <option value="湖北">湖北省</option>
                     <option value="深圳">深圳</option>
                     <option value="上海">上海市</option>
                 </c:if>
                 <c:if test="${user.address=='河北'}">
                     <option value="广东" >广东</option>
                     <option value="东北省" >东北省</option>
                     <option value="浙江省" >浙江省</option>
                     <option value="黑龙江" >黑龙江</option>
                     <option value="平江县" >平江县</option>
                     <option value="长沙市" >长沙市</option>
                     <option value="郴州" >郴州</option>
                     <option value="张家界" >张家界</option>
                     <option value="衡阳省">衡阳省</option>
                     <option value="广西" >广西</option>
                     <option value="湖南" >湖南省</option>
                     <option value="山西" >山西省</option>
                     <option value="北京" >北京市</option>
                     <option value="河北" selected>河北</option>
                     <option value="湖北">湖北省</option>
                     <option value="深圳">深圳</option>
                     <option value="上海">上海市</option>
                 </c:if>
                 <c:if test="${user.address=='湖北省'}">
                     <option value="广东" >广东</option>
                     <option value="东北省" >东北省</option>
                     <option value="浙江省" >浙江省</option>
                     <option value="黑龙江" >黑龙江</option>
                     <option value="平江县" >平江县</option>
                     <option value="长沙市" >长沙市</option>
                     <option value="郴州" >郴州</option>
                     <option value="张家界" >张家界</option>
                     <option value="衡阳省">衡阳省</option>
                     <option value="广西" >广西</option>
                     <option value="湖南" >湖南省</option>
                     <option value="山西" >山西省</option>
                     <option value="北京" >北京市</option>
                     <option value="河北" >河北</option>
                     <option value="湖北" selected>湖北省</option>
                     <option value="深圳">深圳</option>
                     <option value="上海">上海市</option>
                 </c:if>
                 <c:if test="${user.address=='深圳'}">
                 <option value="广东" >广东</option>
                 <option value="东北省" >东北省</option>
                 <option value="浙江省" >浙江省</option>
                 <option value="黑龙江" >黑龙江</option>
                 <option value="平江县" >平江县</option>
                 <option value="长沙市" >长沙市</option>
                 <option value="郴州" >郴州</option>
                 <option value="张家界" >张家界</option>
                 <option value="衡阳省">衡阳省</option>
                 <option value="广西" >广西</option>
                 <option value="湖南" >湖南省</option>
                 <option value="山西" >山西省</option>
                 <option value="北京" >北京市</option>
                 <option value="河北" >河北</option>
                 <option value="湖北" >湖北省</option>
                 <option value="深圳" selected>深圳</option>
                 <option value="上海">上海市</option>
             </c:if>
                 <c:if test="${user.address=='上海市'}">
                     <option value="广东" >广东</option>
                     <option value="东北省" >东北省</option>
                     <option value="浙江省" >浙江省</option>
                     <option value="黑龙江" >黑龙江</option>
                     <option value="平江县" >平江县</option>
                     <option value="长沙市" >长沙市</option>
                     <option value="郴州" >郴州</option>
                     <option value="张家界" >张家界</option>
                     <option value="衡阳省">衡阳省</option>
                     <option value="广西" >广西</option>
                     <option value="湖南" >湖南省</option>
                     <option value="山西" >山西省</option>
                     <option value="北京" >北京市</option>
                     <option value="河北" >河北</option>
                     <option value="湖北" >湖北省</option>
                     <option value="深圳" >深圳</option>
                     <option value="上海" selected>上海市</option>
                 </c:if>
            </select>

          </div>

          <div class="form-group">
            <%--@declare id="qq"--%><label for="QQ">QQ：</label>
            <input type="text" class="form-control" name="QQ" id="QQ" value="${user.QQ}" placeholder="请输入QQ号码"/>
          </div>

          <div class="form-group">
            <%--@declare id="eamil"--%><label for="eamil">Email：</label>
            <input type="text" class="form-control" value="${user.eamil}"  name="eamil" id="eamil" placeholder="请输入邮箱地址"/>
          </div>

          <div class="form-group">
                <%--@declare id="username"--%><label for="username">账号：</label>
                <input type="text" class="form-control" value="${user.username}"  name="username" id="username" placeholder="请输入账号"/>
          </div>

          <div class="form-group">
                <%--@declare id="password"--%><label for="password">密码：</label>
                <input type="text" class="form-control" id="password" name="password" value="${user.password}" placeholder="请输入密码"/>
          </div>

             <div class="form-group" style="text-align: center">
                <input class="btn btn-primary" type="submit" value="提交" />
                <input class="btn btn-default" type="reset" value="重置" />
                <input class="btn btn-default" type="button" value="返回"/>
             </div>
        </form>
        </div>
    </body>
</html>