/**
 * 
 */
			$(".tree a:contains('用户维护')").css("color" , "red");
            
            $(".tree a:contains('用户维护')").parents("ul").show();
            
            $(".tree a:contains('用户维护')").parents("ul").parent("li").toggleClass("tree-closed");
            
            
         /*   <script type="text/javascript" src="${PATH }/static/include/admin_js.js"></script>*/