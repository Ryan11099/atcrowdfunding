/**
 * 
 */$(".tree a:contains('角色维护')").css("color" , "red");
            
            $(".tree a:contains('角色维护')").parents("ul").show();
            
            $(".tree a:contains('角色维护')").parents("ul").parent("li").toggleClass("tree-closed");
            
            
         /*   <script type="text/javascript" src="${PATH }/static/include/role_js.js"></script>*/