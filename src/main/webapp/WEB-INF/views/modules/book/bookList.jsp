<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>图书管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/book/book/">图书列表</a></li>
		<shiro:hasPermission name="book:book:edit"><li><a href="${ctx}/book/book/form">图书添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="book" action="${ctx}/book/book/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>价格：</label>
				<form:input path="beginPrice" htmlEscape="false" class="input-medium"/>
				~
				<form:input path="endPrice" htmlEscape="false" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>名称</th>
				<th>价格</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="book:book:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="book">
			<tr>
				<td><a href="${ctx}/book/book/form?id=${book.id}">
					${book.name}
				</a></td>
				<td>
						${book.price}
				</td>
				<td>
					<fmt:formatDate value="${book.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${book.remarks}
				</td>
				<shiro:hasPermission name="book:book:edit"><td>
    				<a href="${ctx}/book/book/form?id=${book.id}">修改</a>
					<a href="${ctx}/book/book/delete?id=${book.id}" onclick="return confirmx('确认要删除该图书吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>