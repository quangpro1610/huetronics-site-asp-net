<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ThemKH.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%">
    <tr>
            <td style="width: 100px">
                <asp:Label ID="Label1" runat="server" CssClass="lb" Text="Tên đăng nhập:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTendangnhap" runat="server" CssClass="tb" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" CssClass="lb" Text="Mật khẩu:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPass" runat="server" CssClass="tb" TextMode="Password" 
                    Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" CssClass="lb" Text="Nhập lại mật khẩu:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNhaplai" runat="server" CssClass="tb" TextMode="Password" 
                    Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" CssClass="lb" Text="Họ tên:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTennguoidung" runat="server" CssClass="tb" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" CssClass="lb" Text="Địa chỉ:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDiachi" runat="server" CssClass="tb" TextMode="MultiLine" 
                    Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" CssClass="lb" Text="Số điện thoại:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSDT" runat="server" CssClass="tb" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" CssClass="lb" Text="Email:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="tb" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" CssClass="lb" Text="Quyền:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drpQuyen" runat="server" Width="200px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="left" colspan="2">
                <asp:Button ID="btThem" runat="server" onclick="btThem_Click" 
                    Text="Thêm người dùng" Height="30px" />
            </td>
        </tr>
</table>
</asp:Content>

