<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>产品管理管理</title>
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
		<li class="active"><a href="${ctx}/book/product/">产品列表</a></li>
		<shiro:hasPermission name="book:product:edit"><li><a href="${ctx}/book/product/form">产品添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="product" action="${ctx}/book/product/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>所属分类：</label>
				<sys:treeselect id="sort" name="sort.id" value="${product.sort.id}" labelName="sort.name" labelValue="${product.sort.name}"
								title="类别" url="/book/sort/listAllJson" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
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
				<th>产品名称</th>
				<th>产品类别</th>
				<th>产品价格</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="book:product:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="product">
			<tr>
				<td><a href="${ctx}/book/product/form?id=${product.id}">
					${product.name}
				</a></td>
				<td>
						${product.sort.name}
				</td>
				<td>
						${product.price}
				</td>
				<td>
					<fmt:formatDate value="${product.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${product.remarks}
				</td>
				<shiro:hasPermission name="book:product:edit"><td>
    				<a href="${ctx}/book/product/form?id=${product.id}">修改</a>
					<a href="${ctx}/book/product/delete?id=${product.id}" onclick="return confirmx('确认要删除该产品管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>