<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String ctx = request.getContextPath();
   request.setAttribute("ctx", ctx);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${ctx }/css/style.css" type="text/css" />
    <link rel="stylesheet" href="${ctx }/css/amazeui.min.css" />
    <script src="${ctx }/js/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx }/js/umedit/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx }/js/umedit/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${ctx }/js/umedit/lang/zh-cn/zh-cn.js"></script>
</head>

<body>


<div class="main_top">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">编辑文章
        </strong><small></small></div>
    </div>
    <hr>
    <form id="blog_form" action="${pageContext.request.contextPath}/article_add.action" method="post" enctype="multipart/form-data" >
        <div class="edit_content">
            <div class="item1">
                <div>
                    <span>文章标题：</span>
                    <input type="text" class="am-form-field" name="article_title" value="<s:property value="article_title" />" style="width: 300px">&nbsp;&nbsp;
                </div>
            </div>

            <input type="text" name="article_desc" id="article_desc" style="display: none;">


            <div class="item1">
                <span>所属分类：</span>
                <select id="category_select" name="category.parentid" style="width: 150px">&nbsp;&nbsp;
                    　
                </select>

                <select id="skill_select" name="category.cid" style="width: 150px">&nbsp;&nbsp;

                </select>
            </div>

            <div class="item1 update_pic" >
                <span>摘要图片：</span>
                <img src="${pageContext.request.contextPath}/upload/<s:property value="article_pic" />" id="imageview" class="item1_img" style="display: none;" >
                <label for="fileupload" id="label_file">上传文件</label>
                <input type="file" name="upload" id="fileupload"/>
            </div>

            <div id="editor" name="article_content" style="width:900px;height:400px;">
                <input type="hidden" id="rescontent" value="<s:property value="article_content" />">
                <input type="hidden" id="article_id" value="<s:property value="article_id" />">
                <input type="hidden" id="article_pic" value="<s:property value="article_pic" />">
            </div>
            <button class="am-btn am-btn-default" type="button" id="send" style="margin-top: 10px;">
                发布</button>
        </div>

    </form>

</div>
<script>
    $(function () {
        var  ue = UE.getEditor('editor');
        $.post("${pageContext.request.contextPath}/article_getCategory.action",{"parentid":0},function (data) {
            $(data).each(function (i,n) {
                $("#category_select ").append("<option value='"+n.cid+"'>"+n.cname+"</option>");

            });
            $("#category_select").val(<s:property value="category.parentid" />).trigger('change');

        },"json");
        $(".item1").on('change',function () {
            var  cid =  $("#category_select").val();
            alert(cid);
            $.post("${pageContext.request.contextPath}/article_getCategory.action",{"parentid":cid},function (data) {
                $(data).each(function (i,n) {
                    $("#skill_select ").append("<option value='"+n.cid+"'>"+n.cname+"</option>");

                });
                $("#category_select option[value=<s:property value="category.parentid"/>]").prop("selected",true);
                $("#skill_select option[value=<s:property value="category.cid"/>]").prop("selected",true);

            },"json");

        });
        ue.ready(function () {
            ue.execCommand('inserthtml',$("#rescontent").val())
        });

        /*点击提交*/
        $("#send").click(function () {
            var text = ue.getContentTxt();
            text = text.substring(0,150)+"...";
            $("#article_desc").val(text);
            $("#blog_form").submit();
        });

    });


</script>

</body>
</html>