<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ThongTinAdmin.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div align="center" style="color: #0000FF; font-weight: 700; font-size: large;">
    
        HỒ SƠ CÁ NHÂN</div>
    <div>
        <table style="width:100%;">
            <tr>
                <td style="width: 50px">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Họ tên:" 
                        Width="50px"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblHoTen" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 50px">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Địa chỉ:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblDiaChi" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Số điện thoại:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblSDT" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 50px">
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Email:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:LinkButton ID="lnkbtThayDoiThongTin" runat="server" 
                        PostBackUrl="~/Admin/DoiMK.aspx" Font-Underline="True">Đổi mật khẩu</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 18px">
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Underline="True" 
                        PostBackUrl="~/Admin/SuaThongTinAdmin.aspx">Thay đổi thông tin cá nhân</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

