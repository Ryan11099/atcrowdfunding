<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="GB18030">
  <head>
    <meta charset="GB18030">
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
	</style>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
           <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 许可维护</a></div>
        </div>
        <%@include file="/WEB-INF/views/admin/manager_header.jsp" %>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
			<%@include file="/WEB-INF/views/admin/manager_menu.jsp" %>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

			<div class="panel panel-default">
              <div class="panel-heading"><i class="glyphicon glyphicon-th-list"></i> 权限菜单列表 <div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
                  <ul id="treeDemo" class="ztree"></ul>
			  </div>
			</div>
        </div>
      </div>
    </div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">帮助</h4>
		  </div>
		  <div class="modal-body">
			<div class="bs-callout bs-callout-info">
				<h4>没有默认类</h4>
				<p>警告框没有默认类，只有基类和修饰类。默认的灰色警告框并没有多少意义。所以您要使用一种有意义的警告类。目前提供了成功、消息、警告或危险。</p>
			  </div>
			<div class="bs-callout bs-callout-info">
				<h4>没有默认类</h4>
				<p>警告框没有默认类，只有基类和修饰类。默认的灰色警告框并没有多少意义。所以您要使用一种有意义的警告类。目前提供了成功、消息、警告或危险。</p>
			  </div>
		  </div>
		  <!--
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary">Save changes</button>
		  </div>
		  -->
		</div>
	  </div>
	</div>
	
	
	<!-- 添加菜单节点的模态框 -->
	<div class="modal fade" id="saveMenuModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">添加菜单</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <input type="hidden" name="pid" class="form-control" id="recipient-name">
            <label for="recipient-name" class="control-label">菜单名称:</label>
            <input type="text" name="name" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">菜单图标:</label>
            <input type="text" name="icon" class="form-control" id="recipient-name">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="saveMenuBtn" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div>

<!-- 修改菜单节点的模态框 -->
	<div class="modal fade" id="updateMenuModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">修改菜单</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <input type="hidden" name="id" class="form-control" id="recipient-name">
            <label for="recipient-name" class="control-label">菜单名称:</label>
            <input type="text" name="name" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">菜单图标:</label>
            <input type="text" name="icon" class="form-control" id="recipient-name">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" id="updateMenuBtn" class="btn btn-primary">修改</button>
      </div>
    </div>
  </div>
</div>
	
    <%@include file="/WEB-INF/include/base_js.jsp" %>
	
        <script type="text/javascript">
        
        $(".tree a:contains('菜单维护')").css("color", "red");
		//页面中的子菜单的显示隐藏本质是通过 css样式：display控制的，只要让用户维护所在的ul显示
		$(".tree a:contains('菜单维护')").parents("ul").show();
		//为了避免点击父菜单 控制显示隐藏效果出错，自动展开 子菜单的同时需要移除 li的 treeclosed class属性值
		$(".tree a:contains('菜单维护')").parents("ul").parent("li").toggleClass(
				"tree-closed");
        
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
            //1引入ztree的 style 文件，js样式文件
            //在base_js文件当中已经准备好了
            //2在页面中准备ztree的容器
            //代码中已经提供了ztreeDemo
            //3在js代码中准备settings的配置文件
            
            //自定义ztree树节点的方法
            function addDiyDom(treeId,treeNode){
            	console.log(treeNode);
            	$("#"+treeNode.tId+"_a").attr("href" , "javascript:void(0)");
            	$("#"+treeNode.tId+"_ico").removeClass();
            	//$("#"+treeNode.tId+"_ico").addClass(treeNode.icon);//这种方法产生的图形在树节点处没有图形
            	//新建一个span标签来显示图样
            	$("#"+treeNode.tId+"_ico").before("<span class='"+treeNode.icon+"'></span>");
            };
            
            
          //鼠标在节点上悬停时的操作
    		function addHoverDom(treeId, treeNode) {
    			var aObj = $("#" + treeNode.tId + "_a"); // tId = permissionTree_1, ==> $("#permissionTree_1_a")
    			aObj.attr("href", "javascript:;");
    			if (treeNode.editNameFlag || $("#btnGroup"+treeNode.tId).length>0) return;
    			var s = '<span menuid="'+treeNode.id+'" id="btnGroup'+treeNode.tId+'">';
    			if ( treeNode.level == 0 ) {//根节点  只能添加子节点
    				s += '<a onclick="addMenu('+treeNode.id+')" class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" href="javascript:void(0);" >&nbsp;&nbsp;<i class="fa fa-fw fa-plus rbg "></i></a>';
    			} else if ( treeNode.level == 1 ) {//枝节点:枝节点如果有子节点可以修改和增加子节点 ， 如果枝节点没有子节点可以增删改 
    				s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;"  href="javascript:void(0);" title="修改权限信息">&nbsp;&nbsp;<i class="fa fa-fw fa-edit rbg "></i></a>';
    				if (treeNode.children.length == 0) {//如果支节点的长度为零，则可以删除
    					s += '<a class="btn btn-info dropdown-toggle btn-xs deleteMenuBtn" style="margin-left:10px;padding-top:0px;" href="javascript:void(0);" >&nbsp;&nbsp;<i class="fa fa-fw fa-times rbg "></i></a>';
    				}
    				s += '<a onclick="addMenu('+treeNode.id+')" class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" href="javascript:void(0);" >&nbsp;&nbsp;<i class="fa fa-fw fa-plus rbg "></i></a>';
    			} else if ( treeNode.level == 2 ) {//叶子节点。由于没有子节点所以都可以删除
    				s += '<a onclick="updateMenu('+treeNode.id+')" class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;"  href="javascript:void(0);" title="修改权限信息">&nbsp;&nbsp;<i class="fa fa-fw fa-edit rbg "></i></a>';
    				s += '<a class="btn btn-info dropdown-toggle btn-xs deleteMenuBtn" style="margin-left:10px;padding-top:0px;" href="javascript:void(0);">&nbsp;&nbsp;<i class="fa fa-fw fa-times rbg "></i></a>';
    			}

    			s += '</span>';
    			aObj.after(s);

    		};
    		
    		function updateMenu(id){
    			//1.根据id查询相对应的信息
    			$.post("${PATH}/menu/getMenu" , {"id" : id} , function(menu){
    				
    				//2.设置表单回显
    				$("#updateMenuModal input[name='name']").val(menu.name);
    				$("#updateMenuModal input[name='icon']").val(menu.icon);
    				$("#updateMenuModal input[name='id']").val(menu.id);
    				//3.弹出模态框
    				$("#updateMenuModal").modal("toggle");
    			})
    			//给修改按钮绑定单击事件
    			$("#updateMenuModal #updateMenuBtn").click(function(){
    				//获取模态框中的数据并提交给服务器
    				$.post("${PATH}/menu/updateMenu" , $("#updateMenuModal form").serialize() , function(result){
    					if("ok"==result){
    						$("#updateMenuModal").modal("toggle");
    						//刷新ztree数
    						initMenusTree();
    					}
    				});
    			});
    			
    			
    			
    			
    			
    		}
    		
    		//由于是异步请求。所以不能在同步操作中使用，所以绑定单击事件的做法不能使用。要进行动态委派
    		$("#treeDemo").delegate(".deleteMenuBtn" , "click" , function(){
    			//获取被点击节点的id
    			var menuid = $(this).parent().attr("menuid");
    			//提交给服务器
    			$.post("${PATH}/menu/deleteMenu"  , {id:menuid} , function(result){
    					if("ok"==result){
    						initMenusTree();
    					}
    			});
    			
    		});
    		
    		//添加节点弹出模态框的方法
		function addMenu(pid){
			//获取点击添加按钮所在行的菜单id，作为新增菜单的pid，然后设置到模态框
			$("#saveMenuModal input[name='pid']").val(pid);
			//弹出添加的收集菜单节点的模态框
			$("#saveMenuModal").modal("toggle");
		}
    		
    		
    		//添加模态框确定按钮提交的方法
		$("#saveMenuModal #saveMenuBtn").click(function(){
			//提交数据给服务器保存
			$.post("${PATH}/menu/saveMenu" , $("#saveMenuModal form").serialize() , function(result){
				if("ok"==result){
					/* 
						响应数据给浏览器时，如果是ajax请求，需要判断本次请求是否成功
							但是ajax响应的数据有可能是简单的字符串、还有可能是复杂的json、还有可能是xml文本
							服务器可以创建一个响应类
								AppResponse<T>:
										Integer code; 本次请求的响应状态码
										String message; 请求的响应信息
										T data; 本次请求希望响应给用户的数据
										当响应此对象给浏览器的ajax请求时，jackson会自动将其转为json字符串
											{code:xxx , message:xxxxx , data: xxx}
					*/
					//关闭模态框
					$("#saveMenuModal").modal("toggle");
					//刷新ztree树
					initMenusTree();
				}
			});
		});
		
    		
    		//鼠标离开时的操作
    		function removeHoverDom(treeId, treeNode) {
    			$("#btnGroup"+treeNode.tId).remove();//移除addHoverDom生成的按钮组
    		};
    		
            
            var setting = {
            		view : {
        				addDiyDom : addDiyDom,
        				addHoverDom : addHoverDom,
        				removeHoverDom : removeHoverDom
        				/* addHoverDom: addHoverDom,
        				removeHoverDom: removeHoverDom */
        			},
            		data:{
            			
            			/* key:{
            				url:"xx"
            			}, */
            			simpleData:{
            				enable:true,
            				pIdKey:"pid",
            			}
            		}
            };
            //4调用ztree的init方法
            //发送ajax请求给服务器,异步请求 由js页面自己解析报文
            
            //刷新页面的方法
           function initMenusTree(){
        	   $.ajax({
               	type:"GET",
               	url:"${PATH}/menu/listMenus",
               	dataType:"JSON",
               	success:function(menus){
               		 if(menus.code==403){
						$("#treeDemo").append("<li>"+menus.message+"</li>");
						alert(menus.code);
						return;
					} 
               		
               		menus.push({id:0 ,
               					name:"系统权限管理" , 
               					icon:"glyphicon glyphicon-flag"});
               		var $treeNode = $.fn.zTree.init($("#treeDemo"),setting, menus);
               		$treeNode.expandAll(true);
               	}
               });
            }
             
       
            
           initMenusTree();
        </script>
  </body>
</html>
