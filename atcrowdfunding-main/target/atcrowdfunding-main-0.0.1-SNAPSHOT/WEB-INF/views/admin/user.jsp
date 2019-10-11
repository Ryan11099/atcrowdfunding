<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<%@include file="/WEB-INF/include/base_css.jsp" %>
	
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	table tbody tr:nth-child(odd){background:#F4F4F4;}
	table tbody td:nth-child(even){color:#C00;}
	</style>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 用户维护</a></div>
        </div> 
         	<%@include file="/WEB-INF/views/admin/manager_header.jsp" %>
      	</div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
			<div class="tree">
				<ul style="padding-left:0px;" class="list-group">
				
				
					<%@include file="/WEB-INF/views/admin/manager_menu.jsp" %>
					
				</ul>
			</div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
			  </div>
			  <div class="panel-body">
<form class="form-inline" role="form" method="post" action="${PATH }/admin/index.html" style="float:left;">
  <div class="form-group has-feedback">
    <div class="input-group">
      <div class="input-group-addon">查询条件</div>
      <input class="form-control has-success" name="condition"  type="text" value="${param.condition }"  placeholder="请输入查询条件">
    </div>
  </div>
  <button type="submit" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
</form>
<button type="button" id="deleteAdminsBtn" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
<button type="button" class="btn btn-primary" style="float:right;" onclick="window.location='${PATH}/admin/add.html'""><i class="glyphicon glyphicon-plus"></i> 新增</button>
<br>
 <hr style="clear:both;">

          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30">#</th>
				  <th width="30"><input type="checkbox"></th>
                  <th>账号</th>
                  <th>名称</th>
                  <th>邮箱地址</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody>
              
              <c:choose>
              	<c:when test="${empty pageInfo.list }">
              		<tr>
              			<td colspan="6">没有查询到管理员！！！</td>
              		</tr>
              	</c:when>
              	<c:otherwise>
              		<c:forEach items="${pageInfo.list }" var="admin" varStatus="vs">
              			<tr>
		                  <td>${vs.count }</td>
						  <td><input id="${admin.id }" type="checkbox"></td>
		                  <td>${admin.loginacct }</td>
		                  <td>${admin.username }</td>
		                  <td>${admin.email }</td>
		                  <td>
						      <button adminid="${admin.id }" type="button" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>
						      <button adminid="${admin.id }" type="button" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>
							  <button adminid="${admin.id }" type="button" class="btn btn-danger btn-xs deleteAdminBtn"><i class=" glyphicon glyphicon-remove"></i></button>
						  </td>
		                </tr>
              		</c:forEach>
              	</c:otherwise>
              </c:choose>
              
                
                
              </tbody>
			  <tfoot>
			     <tr >
				     <td colspan="6" align="center">
						<ul class="pagination">
						<c:choose>
							<c:when test="${pageInfo.hasPreviousPage }">
								<!-- 说明有上一页 -->
								<li ><a href="${PATH }/admin/index.html?pageNum=${pageInfo.pageNum-1 }&condition=${param.condition}">上一页</a></li>
							
							</c:when>
							<c:otherwise>
							<!-- 没有上一页 -->
								<li class="disabled"><a href="javascript:void(0)">上一页</a></li>
							</c:otherwise>
							
							
						
						</c:choose>
								
								<c:forEach items="${pageInfo.navigatepageNums }" var="index">
								
										<c:choose>
											<c:when test="${index==pageInfo.pageNum }">
												<li class="active"><a href="javascript:void(0)">${index } <span class="sr-only">(current)</span></a></li>
											</c:when>
											<c:otherwise>
												<li><a href="${PATH }/admin/index.html?pageNum=${index }"> ${index }</a></li>
											</c:otherwise>
											
										</c:choose>
									
								</c:forEach>
								
								<!-- <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li> -->
								
						<c:choose>
							<c:when test="${pageInfo.hasNextPage }">
								<!-- 说明有下一页 -->
								<li ><a href="${PATH }/admin/index.html?pageNum=${pageInfo.pageNum+1 }&condition=${param.condition}">下一页</a></li>
							
							</c:when>
							<c:otherwise>
							<!-- 没有下一页 -->
								<li class="disabled"><a href="javascript:void(0)">下一页</a></li>
							</c:otherwise>
							
						</c:choose>
								
							 </ul>
					 </td>
				 </tr>

			  </tfoot>
            </table>
          </div>
			  </div>
			</div>
        </div>
      </div>
    </div>

    <%@include file="/WEB-INF/include/base_js.jsp" %>
        <script type="text/javascript">
            $(function () {
			    $(".list-group-item").click(function(){
				    if ( $(this).find("ul") ) {
						$(this).toggleClass("tree-closed");
						if ( $(this).hasClass("tree-closed") ) {
							$("ul", this).hide("fast");
						} else {
							$("ul", this).show("fast");
						}
					}
				});
            });
            $("tbody .btn-success").click(function(){
            	var adminid = $(this).attr("adminid");
            	
                window.location.href = "${PATH}/admin/assignRole.html?id="+adminid;
            });
            //绑定编辑的单击事件
            
            $("tbody .btn-primary").click(function(){
            	//获取adminID，由于adminID是自定义属性，所以使用attr,,,如果此处是自带属性就使用prop来获取
            	var adminid = $(this).attr("adminid");
                window.location.href = "${PATH}/admin/edit.html?id="+adminid;
            });
            //给删除按钮绑定单击事件
            $(".deleteAdminBtn").click(function(){
            	var adminid = $(this).attr("adminid")
            	//attr只可以获取自定义的属性值，prop获取自带属性值
            	//console.log(adminid);
            	layer.confirm("你确定删除 " + $(this).parents("tr").children("td:eq(3)").text()+" 吗?" , 
    					{title:"删除提示" , icon:3} , function(a){
			            	layer.close(a);
    						//点击确定按钮的操作
			            	//提交请求给服务器 并上传id 完成删除操作
			            	window.location = "${PATH}/admin/deleteAdmin?id="+adminid;
    					} );
            	//alert(adminid);
            });
            
            //全选全不选事件
            //1.只需设置复选框的状态一致或者不一致即可
            $("table thead :checkbox").click(function(){
            	var flag = this.checked;
            	//设置复选框的状态与其他的一致
            	$("table tbody :checkbox").prop("checked"  , flag);
            });
            //2.判断是否所有的复选框已经全部选中
             $("table tbody :checkbox").click(function(){
            	var TotalCount =   $("table tbody :checkbox").length;
            	var checkedTotalCount =	$("table tbody :checkbox:checked").length;
            	
            	 $("table thead :checkbox").prop("checked"  , checkedTotalCount==TotalCount);
             }); 
            //给批量删除按钮绑定单击事件
            $("#deleteAdminsBtn").click(function(){
            	//获取选中的复选框的id集合
            	var $checkedInp = $("table tbody :checkbox:checked");
            	//获取其中的每个单选框的内容
            	//创建一个集合来管理相对应的集合
            	var ids = new Array();
            	$.each($checkedInp , function(){//自动遍历第一个元素，用第一个元素来遍历下一个元素
            		ids.push(this.id);
            	
            	});
            	
            	//将id封装进ids的集合内
            	var idsStr = ids.join(",");//以逗号对id进行拼接，再将拼接好的字符串传递给服务器
            	//将ids集合传入服务器进行解析
            	
            	
            
            	
            	layer.confirm("你确定删除"+$(this).text()+"吗?" , 
    					{title:"删除提示" , icon:3} , function(a){
			            	layer.close(a);
    						//点击确定按钮的操作
			            	window.location = "${PATH}/admin/deleteAdmins?ids="+idsStr;
    					} );
            	
            });
            
            
        </script>
        <script type="text/javascript" src="${PATH }/static/include/admin_js.js"></script>
  </body>
</html>
