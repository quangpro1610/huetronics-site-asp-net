<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Admin_LeftControl.ascx.cs" Inherits="ad_Admin_LeftControl" %>
<link href="css/leftmenu.css" rel="stylesheet" type="text/css" />
<table border='0' cellpadding='0' cellspacing='0' width='100%' height='100%'><tr><td valign='top'>
    <table border='0' cellspacing='0' cellpadding='0' width='100%' height='100%' 
        frame="void" ><tr><td valign='top'>
    <div id='masterdiv'>
    
        <div class='menu' onclick="SwitchMenu('sub1')" 
            style="cursor:hand; font-weight: bold;">
        <img class="imgParent" src="images/imgmenu.gif" alt="Quản lý">Quản lý sản phẩm
        </div>
            <span class='options' id='sub1'>
                <div class='option'>
                    <a href='QLSP.aspx'>
                    <img class="img" src="images/txtfolder.gif" alt="Danh sách"/>Danh sách sản phẩm</a>
                </div>
                <div class='option'>
                <a href='ThemSP.aspx'>
                <img src='images/txtfolder.gif'  class="img" alt="Thêm mới"/>Thêm mới sản phẩm</a>
                </div>
            </span>     
        </div>
         <%--Loại--%>
         <div class='menu' onclick="SwitchMenu('sub6')" 
                style="cursor:hand; font-weight: bold;">
            <img class="imgParent" src="images/imgmenu.gif" alt="Quản lý">Quản lý loại</div>
        <span class='options' id='sub6'>
            <div class='option'>
                <a href='QLLoai.aspx'>
                <img class="img" src="images/txtfolder.gif" alt="Danh sách"/>Danh sách loại</a>
            </div>
            <div class='option'>
            <a href='ThemLoaiSP.aspx'>
            <img src='images/txtfolder.gif'  class="img" alt="Thêm mới"/>Thêm mới loại</a>
            </div>
        </span>    
           <%--NSX--%>
         <div class='menu' onclick="SwitchMenu('sub6')" 
                style="cursor:hand; font-weight: bold;">
            <img class="imgParent" src="images/imgmenu.gif" alt="Quản lý">Quản lý NSX</div>
        <span class='options' id='Span1'>
            <div class='option'>
                <a href='QLNSX.aspx'>
                <img class="img" src="images/txtfolder.gif" alt="Danh sách"/>Danh sách NSX</a>
            </div>
            <div class='option'>
            <a href='ThemNSX.aspx'>
            <img src='images/txtfolder.gif'  class="img" alt="Thêm mới"/>Thêm mới NSX</a>
            </div>
        </span>    
        
        <%--Người dùng--%>
         <div class='menu' onclick="SwitchMenu('sub4')" 
                style="cursor:hand; font-weight: bold;">
            <img class="imgParent" src="images/imgmenu.gif" alt="Quản lý">Quản lý khách hàng</div>
        <span class='options' id='sub4'>
            <div class='option'>
                <a href='QLKH.aspx'>
                <img class="img" src="images/txtfolder.gif" alt="Danh sách"/>Danh sách khách 
                hàng </a>
            </div>
            <div class='option'>
            <a href='ThemKH.aspx'>
            <img src='images/txtfolder.gif'  class="img" alt="Thêm mới"/>Thêm mới khách hàng</a>&nbsp;
            </div>
        </span>    
        
        
        <%--Hóa đơn--%>
         <div class='menu' onclick="SwitchMenu('sub5')" 
                style="cursor:hand; font-weight: bold;">
            <img class="imgParent" src="images/imgmenu.gif" alt="Quản lý">Quản lý hóa đơn
        </div>
        <span class='options' id='sub5'>
            <div class='option'>
                <a href='HoaDonChuaGiao.aspx'>
                <img class="img" src="images/txtfolder.gif" alt="Danh sách"/>Hóa đơn chưa thanh toán</a>
            </div>
            <div class='option' >
            <a href='HoaDonDaGiao.aspx'>
            <img src='images/txtfolder.gif'  class="img" alt="Thêm mới"/>Hóa đơn đã thanh toán</a>
            </div>
        </span>     
    
    </td></tr>
    </table>
</td></tr></table>

