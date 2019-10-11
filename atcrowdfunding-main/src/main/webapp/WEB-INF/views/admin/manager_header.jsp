<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 引入scriptsecurity的标签库 -->
   <%@taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li style="padding-top:8px;">
				<div class="btn-group">
				  <button type="button" class="btn btn-default btn-success dropdown-toggle" data-toggle="dropdown">
					<i class="glyphicon glyphicon-user"></i> <security:authentication property="name"/> <span class="caret"></span>
				  </button>
					  <ul class="dropdown-menu" role="menu">
						<li><a href="#"><i class="glyphicon glyphicon-cog"></i> 个人设置</a></li>
						<li><a href="#"><i class="glyphicon glyphicon-comment"></i> 消息</a></li>
						<li class="divider"></li>
						<!-- 注销 -->
						<li><a onclick="document.getElementById('logoutForm').submit();" href="javascript:void(0)"><i class="glyphicon glyphicon-off"></i> 退出系统</a>
						<form id="logoutForm" action="${PATH }/logout" method="POST"></form>
						</li>
					  </ul>
			    </div>
			</li>
			<!-- onclick="document.getElementById('logoutForm').submit();" --> 
			
			
            <li style="margin-left:10px;padding-top:8px;">
				<button type="button" class="btn btn-default btn-danger">
				  <span class="glyphicon glyphicon-question-sign"></span> 帮助
				</button>
				<!-- 利用标签来控制细粒度，从而来控制相应的权限 -->
				<security:authorize access="hasAnyRole('木虚肉盖饭11')">
					<button type="button" class="btn btn-default btn-danger">
					  <span class="glyphicon glyphicon-question-sign"></span> 你好
					</button>
				</security:authorize>
				
			</li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="查询">
          </form>
        </div>
        
      <%--    <%@include file="/WEB-INF/views/admin/manager_header.jsp" %> --%>
        
        
        
        
        
        