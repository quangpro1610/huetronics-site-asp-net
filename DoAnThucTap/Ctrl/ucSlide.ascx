<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucSlide.ascx.cs" Inherits="Ctrl_ucSlide" %>

<script src="../Slide/jquery-1.2.6.min.js" type="text/javascript"></script>
<script src="../Slide/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#featured > ul").tabs({
            fx: {
                opacity: "toggle"
            }
        }).tabs("rotate", 6000, true);
    });
</script>

    <style type="text/css">
#featured{
/* width:400px;
padding-right:250px; */
position:relative;
border:1px solid #ccc;
height:252px;
background:#fff;
}
#featured ul.ui-tabs-nav{
position:absolute;
top:0; left:340px;
list-style:none;
padding:0; margin:0;
width:210px;
}
#featured ul.ui-tabs-nav li{
padding:1px 0; padding-left:13px;
font-size:12px;
color:#666;
}
#featured ul.ui-tabs-nav li img{
float:left; margin:2px 5px;
background:#fff;
padding:2px;
border:1px solid #eee;
}
#featured ul.ui-tabs-nav li span{
font-size:11px; font-family:Verdana;
line-height:12px;
color:#034E8F;
}
#featured li.ui-tabs-nav-item a{
display:block;
height:48px;
color:#333; background:#fff;
line-height:20px;
}
#featured li.ui-tabs-nav-item a:hover{
background:#f2f2f2;
}
#featured li.ui-tabs-selected{
background: left -5px no-repeat;
}
#featured ul.ui-tabs-nav li.ui-tabs-selected a{
background:#ccc;
}
#featured .ui-tabs-panel{
width:350px;
height:250px;
background:#999; position:relative;
}

#featured .ui-tabs-panel .info{
position:absolute;
top:196px; 
left:2px;
height:55px;
width:336px;
background:url('../Slide/hm-bg.png') repeat;
}
#featured .info h2{
font-size:12px; font-family:Georgia, serif;
color:#fff; padding:5px; margin:0;
overflow:hidden;
}
#featured .info p{
margin:0 5px;
font-family:Verdana; font-size:11px;
line-height:15px; color:#f0f0f0;
}
#featured .info a{
text-decoration:none;
color:#fff;
}
#featured .info a:hover{
text-decoration:underline;
}
#featured .ui-tabs-hide{
display:none;
}
#featured .ui-tabs-nav-item img{
height:37px;
width:55px;}
</style>
<div>
   <asp:Literal ID="ltlConTent" runat="server"></asp:Literal>
</div>