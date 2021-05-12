<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script src="Lightbox/lightbox.js" type="text/javascript"></script>
<table width="100%">
<tr><td>
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="2" GridLines="Both" 
            onitemcommand="DataList1_ItemCommand" CellPadding="0" 
            Font-Bold="False" Font-Italic="False" Font-Overline="False" 
            Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" 
            RepeatDirection="Horizontal" BorderColor="Silver" BorderWidth="1px" 
            Width="100%">
            <AlternatingItemStyle Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
            <EditItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                Font-Strikeout="False" Font-Underline="False" />
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                Font-Strikeout="False" Font-Underline="False" />
            <ItemTemplate>
                <table style="width:100%;">
                    <tr>
                        <td rowspan="5" style="width: 100px">
                            <a href="<%#Eval("Anh") %>" rel="lightbox[roadtrip]" title='<%# Eval("TenSanPham") %>'><asp:Image ID="imgHinhminhhoa" imageurl='<%#Eval("Anh","~/{0}") %>' runat="server"
                            Height="80px" Width="80px" /></a>
                        </td>
                        <td colspan="2" style="color: #000080">
                                <asp:Label ID="lbltensanpham" Text='<%# Eval("TenSanPham") %>' runat="server" 
                                    Font-Bold="True" Font-Size="Medium"></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblMota" Text='<%#Eval("TomTat") %>' runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Giá:</td>
                        <td style="color: #CC0000">
                                <asp:Label ID="lblDonGia" Text='<%#Eval("DonGia","{0:0,000}") %>' runat="server" Font-Bold="False" Font-Size="Small"></asp:Label>
                                &nbsp; VNĐ</td>
                    </tr>
                    <tr>
                        <td>
                            NSX:</td>
                        <td>
                                <asp:LinkButton ID="lnkbtnNSX" Text='<%#Eval("TenNSX")%>' CommandArgument='<%#Eval("TenNSX") %>' CommandName="lnkbtnNSX" runat="server"></asp:LinkButton>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:ImageButton ID="bt_Chitiet" runat="server" CommandArgument='<%#Eval("IDSanPham") %>' 
                                ImageUrl="~/Images/chitiet.png" onclick="bt_ChiTiet_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="bt_Themgio" runat="server" CommandArgument='<%#Eval("IDSanPham") %>'
                                ImageUrl="~/Images/themvaogio.png" onclick="bt_ThemGio_Click" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <SelectedItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                Font-Strikeout="False" Font-Underline="False" />
        </asp:DataList>
</td></tr>
</table>
<div class="phantrang">
    <asp:Label ID="lblThongbao" runat="server" ForeColor="#CC0000"></asp:Label>
    <cc1:CollectionPager ID="clpPhantrang" runat="server"  BackNextLocation="Split" 
             BackNextStyle="" BackText="-" FirstText="Trang đầu" 
             LabelText="" LastText="Trang cuối" NextText="-" PageSize="10" 
             ResultsFormat="Displaying results {0}-{1} (of {2})" ResultsLocation="None" 
             ShowFirstLast="True">
    </cc1:CollectionPager>
    </div>

    </asp:Content>