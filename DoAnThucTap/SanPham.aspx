<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SanPham.aspx.cs" Inherits="Default2" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script src="Lightbox/lightbox.js" type="text/javascript"></script>
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="2" GridLines="Both" 
        CellPadding="0" CellSpacing="3" 
        Font-Bold="False" Font-Italic="False" Font-Overline="False" 
        Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Justify" 
        RepeatDirection="Horizontal" onitemcommand="DataList1_ItemCommand" 
        Width="100%">
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
                            &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblTomTat" Text='<%#Eval("TomTat") %>' runat="server" Font-Bold="False" Font-Size="Small"></asp:Label>
                            &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 30px">
                            Giá:</td>
                    <td style="color: #FF0000">
                        <asp:Label ID="lblDonGia" Text='<%#Eval("DonGia","{0:0,000}") %>' runat="server" Font-Bold="False" Font-Size="Small"></asp:Label>
                        &nbsp; VNĐ</td>
                </tr>
                <tr>
                    <td>
                            NSX:</td>
                    <td>
                        <asp:LinkButton ID="lnkbtnNhaSX" Text='<%#Eval("TenNSX")%>' CommandArgument='<%#Eval("TenNSX") %>' CommandName="lnkbtnNhaSX" runat="server"></asp:LinkButton>
                            &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:ImageButton ID="btChitiet" runat="server" CommandArgument='<%#Eval("IDSanPham") %>' 
                            ImageUrl="~/Images/chitiet.png" onclick="bt_ChiTiet_Click" />
                        <asp:ImageButton ID="btThemgio" runat="server" CommandArgument='<%#Eval("IDSanPham") %>'  
                            ImageUrl="~/Images/themvaogio.png" onclick="bt_ThemGio_Click" />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <div class="phantrang">
    <asp:Label ID="lblThongbao" runat="server" ForeColor="#CC0000"></asp:Label>
    <cc1:collectionpager ID="clpPhantrang" runat="server"  BackNextLocation="Split" 
             BackNextStyle="" BackText="-" FirstText="Trang đầu" 
             LabelText="Trang:" LastText="Trang cuối" NextText="-" PageSize="4" 
             ResultsFormat="Displaying results {0}-{1} (of {2})" ResultsLocation="None" 
             ShowFirstLast="True">
    </cc1:collectionpager>
    </div>
</asp:Content>

