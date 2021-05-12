<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ThongTinKH.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center" 
        style="color: #FF0000; font-weight: bold; font-size: large; font-family: 'Times New Roman', Times, serif;">
    
        HỒ SƠ CÁ NHÂN</div>
    <div>
        <table style="font-size: 20px; font-family: 'Times New Roman', Times, serif;" 
            class="cangiua">
            <tr>
                <td style="width: 150px">
                    Họ tên:</td>
                <td>
                    <asp:Label ID="lblHoTen" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Địa chỉ:</td>
                <td>
                    <asp:Label ID="lblDiaChi" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Số điện thoại:</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="+84-"></asp:Label>
                    <asp:Label ID="lblSDT" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Email:</td>
                <td>
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                </td>
            </tr>
             <tr>
                <td colspan="2" align="center">
                    <asp:LinkButton ID="lnkbtThayDoiThongTin" runat="server" 
                        PostBackUrl="~/DoiMatKhau.aspx" Font-Underline="True">Đổi mật khẩu</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Underline="True" 
                        PostBackUrl="~/SuaThongTinKH.aspx">Thay đổi thông tin cá nhân</asp:LinkButton>
                </td>
            </tr>
           
        </table>
    </div>
</asp:Content>

