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

	<%@ include file="/WEB-INF/include/base_css.jsp" %> 
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
          <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 角色维护</a></div>
        </div>
        <%@ include file="/WEB-INF/views/admin/manager_header.jsp" %>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
        <%@ include file="/WEB-INF/views/admin/manager_menu.jsp" %>
			
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
			  </div>
			  <div class="panel-body">
<form class="form-inline" role="form" style="float:left;">
  <div class="form-group has-feedback">
    <div class="input-group">
      <div class="input-group-addon">查询条件</div>
      <input class="form-control has-success" name="condition" type="text" placeholder="请输入查询条件">
    </div>
  </div>
  <button type="button" id="queryRolesBtn" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
</form>
<button type="button" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
<button type="button" class="btn btn-primary" id="saveRoleModelBtn" style="float:right;" ><i class="glyphicon glyphicon-plus"></i> 新增</button>
<br>
 <hr style="clear:both;">
          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30">#</th>
				  <th width="30"><input type="checkbox"></th>
                  <th>名称</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody>
         
              
              </tbody>
			  <tfoot>
			     <tr >
				     <td colspan="6" align="center">
						<ul class="pagination">
								
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

<!-- 拷贝bootstrap的模态框： 可以弹出一个弹窗显示或收集数据，背景页面不会刷新 -->
<!-- 添加角色的模态框 -->
<div class="modal fade" id="saveRoleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">添加角色</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">角色名:</label>
            <input type="hidden" class="form-control" name="pages" id="recipient-name">
            <input type="text" class="form-control" name="name" id="recipient-name">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary">提交</button>
      </div>
    </div>
  </div>
</div>
<!-- 修改角色的模态框 -->
<div class="modal fade" id="updateRoleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">修改角色</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">角色名:</label>
            <input type="text" class="form-control" name="name" id="recipient-name">
            <input type="hidden" class="form-control" name="id" id="recipient-name">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" id="updateRoleBtn" class="btn btn-primary">修改</button>
      </div>
    </div>
  </div>
</div>

<!-- 添加角色的模态框 -->
<div class="modal fade" id="saveRoleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">分配角色</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">角色名:</label>
            <input type="hidden" class="form-control" name="pages" id="recipient-name">
            <input type="text" class="form-control" name="name" id="recipient-name">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary">提交</button>
      </div>
    </div>
  </div>
</div>
<!-- 给角色分配权限的模态框 -->
<div class="modal fade" id="assignPermissionsToRoleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">分配许可</h4>
      </div>
      <div class="modal-body">
      <input type="hidden"  name="roleId" />
   			<!--    自定义容器 permissionsTree-->
        <ul id="permissionsTree" class="ztree"></ul>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" id="assignPermissionBtn" class="btn btn-primary">修改</button>
      </div>
    </div>
  </div>
</div>

<!-- copy模态框用来显示数据，收集资料 -->



   <%@include file="/WEB-INF/include/base_js.jsp" %>
        <script type="text/javascript">
        
        //给分配权限的按钮绑定单击事件
        $("#assignPermissionsToRoleModal #assignPermissionBtn").click(function(){
        	
        //》1.从隐藏域当中取出数据,获取roleId.了解操作的是哪个用户
        var roleId = $("#assignPermissionsToRoleModal input[name='roleId']").val();
        //2.获取选中的所有集合
        var treeObj = $.fn.zTree.getZTreeObj("permissionsTree");//初始化ztree容器。调用其方法
        var checkedNodes = treeObj.getCheckedNodes(true);//被选中的集合
        //3、遍历被选中的节点，拼接节点id参数
		var pids = "";
		$.each(checkedNodes , function(){
			pids+=this.id+",";
		})
		pids = pids.substring(0 , pids.length-1);//去掉最后一个逗号
		
		//4、发送ajax请求给服务器  修改权限[先删除角色的所有权限 ， 再给角色添加修改后的权限列表  t_role_permission]
		$.ajax({
			type:"POST",
			url:"${PATH}/role/updatePermissions",
			data:{"id":roleId , "pids": pids},//ajax当中发送得请求就是按照roleId来进行权限修改的
			success: function(result){
				if("ok"==result){
					//关闭模态框
					$("#assignPermissionsToRoleModal").modal("toggle");
				}
			}
		});
	});
        // 给新增按钮绑定单击事件,用来弹出模态框
        $("#saveRoleModelBtn").click(function(){
        		$("#saveRoleModal").modal("toggle");
        	});
        //给模态框的提交按钮绑定单击事件
       $("#saveRoleModal .modal-footer button:contains('提交')").click(function(){
        	//发送异步请求ajax请求
        	$.ajax({
        		type:"POST",
        		url:"${PATH}/role/saveRole",
        		data:{"name":$("#saveRoleModal input[name='name']").val()},
        		success:function(result){
        			if("ok"==result){
        				
        				//获取表单初始化时存放在表单里的总页码
        				var pages = $("#saveRoleModal input[name='pages']").val();
        				
        				//异步请求最后一页的数据并展现到最后一页
        				initRolesTable(pages+1);
        				//添加成功之后隐藏模态框
        				$("#saveRoleModal").modal("hide");
        			}
        		}
        	});
        });
        
		     //点击每一行role的修改按钮时，弹出修改的模态框
		   $("table tbody").delegate(".updateRoleBtn" , "click" , function(){
        		//获取点击按钮所在行角色的id   this代表被点击的按钮
        		var roleId = $(this).attr("rid");//attr是自定义属性
        		
        		//请求服务器获取点击按钮所在行的角色信息回显到修改的模态框中
        		$.post("${PATH}/role/getRole" ,{id:roleId} , function(role){
        			//alert(JSON.stringify(role));//json对象转json字符串
        			$("#updateRoleModal input[name='name']").val(role.name);//设置表单回显
        			//修改时确定唯一记录的id也需要设置到表单中
        			$("#updateRoleModal input[name='id']").val(role.id);
	        		//弹出修改的模态框
	        		$("#updateRoleModal").modal("show");
        		});
        	})
        	//将表单中的数据提交给服务器,修改成功后将当前模态框隐藏
        	$("#updateRoleModal #updateRoleBtn").click(function(){
        		$.post("${PATH}/role/updateRole" , $("#updateRoleModal form").serialize() , function(result){
        			if("ok"==result){//如果修改成功,修改成功后将当前模态框隐藏
        				alert("修改成功");
        				$("#updateRoleModal").modal("hide");
        				//获取请求参数并且刷新当前页面。
        				var pageNum = $("table tfoot .active").prop("id");
        				var condition = $("input[name='condition']").val();
        				initRolesTable(pageNum , condition);//刷新页面需要页面页数和刷新条件
        			}
        		})	
        	});
		  
		     
			        
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
            //删除的按钮实现方法，删除需要发送相应的roleid，所以：data:{"id":roleId},
            function deleteRole(roleId){
            	//使用ajax来给服务器发送请求
            	
            	$.ajax({
            		type:"POST",
            		url:"${PATH}/role/deleteRole",
            		data:{"id":roleId},
            		success:function(result){
            			if("ok"==result){
            			$("#r_"+roleId).remove();
            			//如果当前页面当中一个值都没有了就刷新该页面
            			if($("table tbody .btn-success").length()==0){
            				
        				 //获取点击事件的页码
        		      	  var pageNum = $("tbody tfoot .active").prop("id");//prop固有属性
        		        	 
        		        	 //将模糊查询的条件带上
        		          var condition = $("input[name='condition']").val();
        		          initRolesTable(pageNum , condition);
            			}
            			}
            		}
            	});
            	
            }
            
            
            $("tbody .btn-success").click(function(){
                window.location.href = "assignPermission.html";
                //window
            });
            //解析roles的列表
            function initTableBody(roles){
            	//通过function函数获取返回值里面的roles,这里的roles是经过json解析过的字符串
            	//获取存放在role里面的表格的tbody
        		var $tbody = $("table tbody");
            	//console.log(roles);
            	$tbody.empty();
            	//将解析完的roles进行遍历
            	$.each(roles , function(index){
            		//this代表当前正在操作的json对象
            		//遍历json数据，将每一个json对象显示到tr中，将tr追加给tbody
            		$("<tr id='r_"+this.id+"'></tr>").append("<td>"+(index+1)+"</td>")
            						.append('<td><input type="checkbox"></td>')
            						.append('<td>'+this.name+'</td>')
            						.append('<td>\
            							      <button type="button" onclick="assignPermissionToRole('+this.id+')"  class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>\
            							      <button type="button" rid="'+this.id+'" class="btn btn-primary btn-xs updateRoleBtn"><i class=" glyphicon glyphicon-pencil"></i></button>\
            								  <button type="button" onclick="deleteRole('+this.id+')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>\
            							  </td>')
            							  .appendTo($tbody);
            		
            		})
            		//生成分页导航栏
            		
            }
            
            //给角色分配权限的单击事件
            function assignPermissionToRole(roleId){
            	//1.异步请求根据roleId查询自己的拥有权限id列表
            	$.post("${PATH}/role/getRolePermissionIds" , {"id":roleId} , function(permissionIds){
            		//2.查询所有的权限集合
            		//很明显permissions > permissionIds
            		alert(JSON.stringify(permissionIds));
            		$.get("${PATH}/permission/getPermissions" , function(permissions){
            			//给permissions给定一个属性。当这个id存在于ids的集合当中时，就将其属性设置为true
            			//遍历permissions
            			$.each(permissions , function(){
	            			 	if(permissionIds.indexOf(this.id)>-1){//如果当前的id在自己所拥有的id里面，就将其设为true。
	            				//在ids的集合中有这个id，所以将其设置为true
	            				this.checked=true;
	            			} 
            			});
            			
            			//console.log(permissions);
            			//将权限列表当中带有复选框的显示在列表当中
            			//引入ztree树的相关js css 文件
            			//页面中准备容器
            			
            			
            				function addDiyDom(treeId, treeNode) {
		            		//console.log(treeNode);
							$("#"+treeNode.tId+"_ico").removeClass();
							$("#"+treeNode.tId+"_span").before("<span class='"+treeNode.icon+"'></span>");
							//获取当前节点的选中状态，如果当前的节点id在角色拥有的默认ids中存在， 就给定选中状态
							/* if(permissionIds.indexOf(treeNode.id)>-1){
								//集合中包含元素，所以将其状态设置为选中状态
								//？？？？？？？？？？？
								$("#"+treeNode.tId+"_check").removeClass().addClass("button chk checkbox_true_full");
								
							} 
            			 */
            			};
            			
            			
            			var setting = {
            					view: {
    	            				addDiyDom: addDiyDom
    	            			},
    	            			check:{
    	            				enable:true
    	            			},
            					data:{
            						key:{
            							name:"title"
            						},
			            			simpleData: {
			            				enable: true,
			            				pIdKey: "pid"//认爹
			            			}
            					}
            			};
            			//设置setting，调用ztree的init方法将permission解析到模态框的容器中去
            			var $ztreeNode = $.fn.zTree.init($("#permissionsTree"), setting, permissions);
            			//将所拥有的权限全部展开
            			$ztreeNode.expandAll(true);
            			//展示模态框
            			$("#assignPermissionsToRoleModal").modal("toggle");
            			//将roleId设置到隐藏域中
            			$("#assignPermissionsToRoleModal input[name='roleId']").val(roleId);
            		
            		});
            	});
            	
            }
            
            //生成分页导航栏
            function initTableFoot(pageInfo){
            	var $ul = $("table tfoot .pagination");//显示分页导航栏的ul
				//判断是否有上一页
				$ul.empty();
				if(pageInfo.hasPreviousPage){
					//有上一页
					
					$('<li><a class="listRolesA" pageNum="'+(pageInfo.pageNum-1)+'" href="${PATH}/role/listRoles?pageNum='+(pageInfo.pageNum-1)+'">上一页</a></li>').appendTo($ul);
				}else{
					$('<li class="disabled"><a href="javascript:void(0);">上一页</a></li>').appendTo($ul);
				}
				//判断是否有下一页
				//遍历显示页码
				$.each(pageInfo.navigatepageNums , function(){
					if(this==pageInfo.pageNum){
	        			$('<li class="active"  id="'+this+'"><a href="javascript:void(0);">'+ this +' <span class="sr-only">(current)</span></a></li>').appendTo($ul);
	        		}else{
	        			$('<li><a class="listRolesA" pageNum="'+this+'"  href="${PATH}/role/listRoles?pageNum='+this+'">'+this+'</a></li>').appendTo($ul);
	        		}
				});
				
				
				if(pageInfo.hasNextPage){
					//有下一页，在这里点击下一页按钮是浏览器发出请求
					
					$('<li><a class="listRolesA" pageNum="'+(pageInfo.pageNum+1)+'" >下一页</a></li>').appendTo($ul);
				}else{
					$('<li class="disabled"><a href="javascript:void(0);">下一页</a></li>').appendTo($ul);
				}
        		
            }
            //将分页导航栏发送ajax请求与获取详情并且在列表上显示出来提取至该方法
            function initRolesTable(pageNum , condition){
            	
                $.get("${PATH}/role/listRoles" ,{"pageNum":pageNum , "condition":condition} , function(pageInfo){
                	//获取pageInfo里面的list属性
                	var roles = pageInfo.list
                	//将总页码设置到指定的标签内，当点击新增按钮时可以获取总页码数使用
                	$("#saveRoleModal input[name='pages']").val(pageInfo.pages);
                
                	//调用initTableBody的方法
                	initTableBody(pageInfo.list);
                	
                	//调用分页导航栏的方法
                	initTableFoot(pageInfo);
    					
                });
            }
          //当点击该事件之后，立即触发该事件，发送ajax请求给服务器获取该列表，通过json解析dom对象来将role列表显示在列表上
            initRolesTable(1);
          //给分页导航a标签绑定单击事件
          //???????????? 同步操作中不能给异步操作解析后的标签绑定事件,
        //。可以通过事件动态委派解决(祖先元素.delegate("需要动态绑定事件的标签选择器" , "事件类型" , function(){事件处理函数})   )
        $("table tfoot").delegate(".listRolesA" , "click" , function(){
        	
        	 //获取点击事件的页码
      	  var pageNum = $(this).attr("pageNum");
        	 
        	 //将模糊查询的条件带上
          var condition = $("input[name='condition']").val();
      	  initRolesTable(pageNum , condition);
      	  return false;
        });
          //给按照条件查询绑定单击事件
          $("#queryRolesBtn").click(function(){
        	  //获取请求条件
        	  var condition = $("input[name='condition']").val();
        	  
        	  //向服务器发送请求
        	  initRolesTable(1 , condition);
          });
          
          
            
            
        </script>
        <script type="text/javascript" src="${PATH }/static/include/role_js.js"></script>
  </body>
</html>


