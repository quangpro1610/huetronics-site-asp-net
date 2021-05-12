<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ThemSP.aspx.cs" Inherits="Admin_Default2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td style="width: 100px">
                <asp:Label ID="Label1" runat="server" Text="Loại sản phẩm" CssClass="lb"></asp:Label>
                :</td>
            <td>
                <asp:DropDownList ID="drpLoai" runat="server" Width="200px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="height: 18px">
                <asp:Label ID="Label2" runat="server" Text="Nhà sản xuất" CssClass="lb"></asp:Label>
                :</td>
            <td style="height: 18px">
                <asp:DropDownList ID="drpNSX" runat="server" Width="200px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Tên sản phẩm:" CssClass="lb"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTensp" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Số lượng:" CssClass="lb"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSoluong" runat="server" Width="200px">1</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Đơn giá:" CssClass="lb"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDongia" runat="server" Width="200px"></asp:TextBox>
            &nbsp;<asp:Label ID="Label8" runat="server" CssClass="lb" Text="VNĐ"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="height: 9px">
                <asp:Label ID="Label6" runat="server" Text="Ảnh" CssClass="lb"></asp:Label>
            </td>
            <td style="height: 9px">
                <asp:FileUpload ID="fuAnh" runat="server" Width="200px" />
            </td>
        </tr>
        <tr>
            <td style="height: 9px">
                <asp:Label ID="Label7" runat="server" Text="Tóm tắt:" CssClass="lb"></asp:Label>
            </td>
            <td style="height: 9px">
                <asp:TextBox ID="txtTomtat" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 9px">
                <asp:Label ID="Label9" runat="server" Text="Chi tiết:" CssClass="lb"></asp:Label>
            </td>
            <td style="height: 9px">
                <asp:TextBox ID="txtChitiet" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 9px">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Button ID="btThem" runat="server" Text="Thêm sản phẩm" Height="30px" 
                    onclick="btThem_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

