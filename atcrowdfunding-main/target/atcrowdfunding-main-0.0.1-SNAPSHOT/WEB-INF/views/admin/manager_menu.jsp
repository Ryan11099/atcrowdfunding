<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="tree">
			
				<ul style="padding-left:0px;" class="list-group">
				
				 <c:forEach items="${parents }" var="parent">
				 <!-- 判断是否具有子菜单 -->
				 	<c:choose>
				 		<c:when test="${empty parent.children }">
				 			<li class="list-group-item tree-closed" >
								<a href="${PATH }/${parent.url }"><i class="${parent.icon }"></i> ${parent.name }</a> 
							</li>
				 		</c:when>
				 	<c:otherwise>
					   <li class="list-group-item tree-closed">
							<span><i class="${parent.icon }"></i> ${parent.name } <span class="badge" style="float:right">${parent.children.size() }</span></span> 
							<ul style="margin-top:10px;display:none;">
								
								<c:forEach items="${parent.children }" var="child">
									<li style="height:30px;">
										<a href="${PATH }/${child.url}"><i class="${child.icon}"></i> ${child.name}</a> 
									</li>
								</c:forEach>
						
							</ul>
						</li>
				 	</c:otherwise>
				 
				 </c:choose>
			 </c:forEach>
				




					
					<!-- 以下可全部注掉 -->
					
					<!-- <li class="list-group-item tree-closed">
						<span><i class="glyphicon glyphicon-ok"></i> 业务审核 <span class="badge" style="float:right">3</span></span> 
						<ul style="margin-top:10px;display:none;">
							<li style="height:30px;">
								<a href="auth_cert.html"><i class="glyphicon glyphicon-check"></i> 实名认证审核</a> 
							</li>
							<li style="height:30px;">
								<a href="auth_adv.html"><i class="glyphicon glyphicon-check"></i> 广告审核</a> 
							</li>
							<li style="height:30px;">
								<a href="auth_project.html"><i class="glyphicon glyphicon-check"></i> 项目审核</a> 
							</li>
						</ul>
					</li> -->
					<!-- <li class="list-group-item tree-closed">
						<span><i class="glyphicon glyphicon-th-large"></i> 业务管理 <span class="badge" style="float:right">7</span></span> 
						<ul style="margin-top:10px;display:none;">
							<li style="height:30px;">
								<a href="cert.html"><i class="glyphicon glyphicon-picture"></i> 资质维护</a> 
							</li>
							<li style="height:30px;">
								<a href="type.html"><i class="glyphicon glyphicon-equalizer"></i> 分类管理</a> 
							</li>
							<li style="height:30px;">
								<a href="process.html"><i class="glyphicon glyphicon-random"></i> 流程管理</a> 
							</li>
							<li style="height:30px;">
								<a href="advertisement.html"><i class="glyphicon glyphicon-hdd"></i> 广告管理</a> 
							</li>
							<li style="height:30px;">
								<a href="message.html"><i class="glyphicon glyphicon-comment"></i> 消息模板</a> 
							</li>
							<li style="height:30px;">
								<a href="project_type.html"><i class="glyphicon glyphicon-list"></i> 项目分类</a> 
							</li>
							<li style="height:30px;">
								<a href="tag.html"><i class="glyphicon glyphicon-tags"></i> 项目标签</a> 
							</li>
						</ul>
					</li> -->
					<!-- <li class="list-group-item tree-closed" >
						<a href="param.html"><i class="glyphicon glyphicon-list-alt"></i> 参数管理</a> 
					</li> -->
					
					
				</ul>
			</div>
			
			
			<%-- <%@include file="/WEB-INF/views/admin/manager_menu.jsp" %> --%>
			
			
			
			
			
			
			
			
			
			