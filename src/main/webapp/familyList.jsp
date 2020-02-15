<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
    b {
        margin-left: 20px
    }
</style>
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
            <form id="familyForm" action="${ctx}/family/list.do" method="POST">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="list-group">
                            <a class="list-group-item">
                                <input type="hidden" id="familyForm_page" name="page" value="${familyVO.page}">
                                <input type="hidden" id="familyForm_pageSize" name="pageSize"
                                       value="${familyVO.pageSize}">
                                <b>昵称：</b>
                                <input type="text" id="name" name="name" value="${familyVO.name}">
                                <button type="button" onclick="pageUtil.submit(this.form.id)" class="btn btn-info"
                                        style="margin-left: 20px">查询
                                </button>
                                <button type="button" class="btn btn-info" onclick="showAddfamilyDiv()">添加</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="row" id="addFamilyDiv" hidden>
                    <div class="col-lg-12">
                        <div class="list-group">
                            <a class="list-group-item">
                                <h4>添加联系人</h4><br>
                                <b>姓名：</b><input type="text" id="add_name" name="add_name">
                                <b>WECHAT：</b><input type="text" id="add_wx" name="add_wx">
                                <b>电话：</b><input type="text" id="add_telephone" name="add_telephone">
                                <b>地址：</b><input type="text" id="add_address" name="add_address">
                                <button type="button" class="btn btn-info" onclick="addFamily()">确认添加</button>
                            </a>
                        </div>
                    </div>
                </div>


                <div class="row" id="editeFamilyDiv" hidden>
                    <div class="col-lg-12">
                        <div class="list-group">
                            <a class="list-group-item">
                                <h4>编辑联系人信息</h4>
                                <b>联系人编号：</b><input type="text" id="edite_id" name="edite_id" readonly>(只读)
                                <br>
                                <b>姓名：</b><input type="text" id="edite_name" name="edite_name">
                                <b>WECHAT：</b><input type="text" id="edite_wx" name="edite_wx">
                                <b>电话：</b><input type="text" id="edite_telephone" name="edite_telephone">
                                <b>地址：</b><input type="text" id="edite_address" name="edite_address">
                                <br>
                                <button type="button" class="btn btn-default" style="margin-left: 20px" onclick="hiddenEditeFamilyDiv()">取消</button>
                                <button type="button" class="btn btn-info" style="margin-left: 20px" onclick="submitEdite()">保存修改</button>
                            </a>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-10">
                        <h2></h2>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th style="width: 80px">序号</th>
                                    <th>编号</th>
                                    <th>姓名</th>
                                    <th>微信号</th>
                                    <th>电话号码</th>
                                    <th>地址</th>
                                    <th style="width: 80px">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${FamilyList !='null'}">
                                    <c:set var="index" value="${(FamilyVO.page-1)*FamilyVO.pageSize+1}"></c:set>
                                    <c:forEach items="${familyList}" var="family">
                                        <tr>
                                            <td>${index}</td>
                                            <td>${family.familyId}</td>
                                            <td>${family.name}</td>
                                            <td>${family.wx}</td>
                                            <td>${family.telephone}</td>
                                            <td>${family.address}</td>
                                            <td>
                                                <button type="button" class="btn btn-default"
                                                        onclick="editeFamily(${family.familyId},'${family.name}','${family.wx}','${family.telephone}','${family.address}')">
                                                    编译
                                                </button>
                                            </td>
                                        </tr>
                                        <c:set var="index" value="${index+1}"></c:set>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>

                        <div style="text-align: right;width:100% ">
                            共${page.totalIndex}页，共计${page.totalNum}条记录，每页显示
                            <select value="${page.size}" onchange="pageUtil.setPageSize(this,this.form.id)">
                                <option value="20">20</option>
                                <option value="50">50</option>
                            </select>条
                            <c:if test="${page.index == '1'}">
                                <input type="button" disabled value="上一页">
                            </c:if>
                            <c:if test="${page.index != '1'}">
                                <input type="button" value="上一页"
                                       onclick="pageUtil.setPage(${page.index}-1,this.form.id)">
                            </c:if>
                            ${page.index}
                            <c:if test="${page.index == page.totalIndex}">
                                <input type="button" disabled value="下一页">
                            </c:if>
                            <c:if test="${page.index != page.totalIndex}">
                                <input type="button" value="下一页"
                                       onclick="pageUtil.setPage(${page.index}+1,this.form.id)">
                            </c:if>
                        </div>
                    </div>
                </div>
            </form>
            <!-- /.row -->

        </div>
    </div>
</div>


<script>

    function showAddfamilyDiv() {
        if ($("#addFamilyDiv").is(':hidden')) {
            $("#addFamilyDiv").show();
        } else {
            $("#addFamilyDiv").hide();
        }
    }


    function addFamily() {
        $.ajax({
            type: 'POST',
            url: "${ctx}/family/add.do",
            data:"name=" + $("#add_name").val()  + "&wx=" + $("#add_wx").val()
            + "&telephone=" + $("#add_telephone").val()+ "&address=" + $("#add_address").val(),
            cache: false,
            dataType: "JSON",
            success: function (data) {
                alert("添加联系人成功");
                pageUtil.submit("familyForm");
            }, error: function (data) {
                alert("出错了");
            }
        });
    }

    function editeFamily(familyId, familyName, wx, telephone,address) {
        $("#editeFamilyDiv").show();
        $("#edite_id").attr("value", familyId);
        $("#edite_name").attr("value",familyName);
        $("#edite_wx").attr("value", wx);
        $("#edite_telephone").attr("value", telephone);
        $("#edite_address").attr("value", address);
    }

    function hiddenEditeFamilyDiv() {
        $("#editeFamilyDiv").hide();
    }

    function submitEdite() {
        $.ajax({
            type: 'POST',
            url: "${ctx}/family/edite.do",
            data: "familyId=" + $("#edite_id").val()+"&name="+$("#edite_name").val() +"&wx="+$("#edite_wx").val()+
                "&telephone="+$("#edite_telephone").val()+"&address="+$("#edite_address").val(),
            cache: false,
            dataType: "JSON",
            success: function (data) {
                alert("修改商家信息成功");
                pageUtil.submit("familyForm");
            }, error: function (data) {
                alert("出错了");
            }
        });
    }

</script>
</html>
