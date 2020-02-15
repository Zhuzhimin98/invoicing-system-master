<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: linzhongxia
  Date: 2017/10/10
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="header.jsp"></jsp:include>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        通讯录
                        <%--<small>Subheading</small>--%>
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> <a href="${ctx}/dashboard.do">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-file"></i> 通讯录
                        </li>
                    </ol>
                </div>
            </div>
            <form id="familyForm" action="${ctx}/family/add.do" method="POST">
                <div class="row">
                    <div class="col-lg-8">
                        <input type="hidden" id="id" name="id" value="${family.id}">
                        昵称：
                        <input type="text" id="name" name="name" value="${familyVO.id}">
                    </div>
                    <div>
                        <input type="text" id="name" name="name" value="${familyVO.name}">
                    </div>
                    <div>
                        <input type="text" id="name" name="name" value="${familyVO.name}">
                    </div>
                    <div>
                        <input type="text" id="name" name="name" value="${familyVO.name}">
                    </div>
                    <div>
                        <input type="text" id="name" name="name" value="${familyVO.name}">
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-12">
                        <h2></h2>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>昵称</th>
                                    <th>微信号</th>
                                    <th>电话号码</th>
                                    <th>地址</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${familyList !='null'}">
                                    <c:forEach items="${familyList}" var="family">
                                        <tr>
                                            <td>${family.id}</td>
                                            <td>${family.name}</td>
                                            <td>${family.wx}</td>
                                            <td>${family.telephone}</td>
                                            <td>${family.address}</td>
                                            <td><a>编辑</a> <a>删除</a></td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
            <!-- /.row -->

        </div>
    </div>
</div>
</html>
