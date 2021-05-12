<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DangKy.aspx.cs" Inherits="Default2" %>

<%@ Register assembly="MSCaptcha" namespace="MSCaptcha" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="DK" runat="server">
    <div style="text-align: center; color: #FF0000; font-size: large; font-weight: bold; font-family: 'times New Roman', Times, serif;">
        ĐĂNG KÝ TÀI KHOẢN</div>
    <table style="width: 100%;">
        <tr>
            <td align="right">
                &nbsp;</td>
            <td>
               <asp:Label ID="lbl_thongbao" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                Tên đăng nhập:</td>
            <td>
                <asp:TextBox ID="txt_TenDangNhap" runat="server" TabIndex="1" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Mật khẩu:</td>
            <td>
                <asp:TextBox ID="txt_MatKhau" runat="server" TabIndex="2" TextMode="Password" 
                    Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                &nbsp;</td>
            <td>
                Mật khẩu phải &gt;=6 ký tự^^</td>
        </tr>
        <tr>
            <td align="right">
                Nhập lại mật khẩu:</td>
            <td>
                <asp:TextBox ID="txt_MatKhau_Nhaplai" runat="server" TabIndex="3" 
                    TextMode="Password" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Họ tên</td>
            <td>
                <asp:TextBox ID="txt_HoTen" runat="server" TabIndex="4" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Địa chỉ:</td>
            <td>
                <asp:TextBox ID="txt_DiaChi" runat="server" TabIndex="5" TextMode="MultiLine" 
                    Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Số điện thoại:</td>
            <td>
                +84
                <asp:TextBox ID="txt_SDT" runat="server" TabIndex="6" Width="225px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Email:</td>
            <td>
                <asp:TextBox ID="txt_Email" runat="server" TabIndex="7" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Mã bảo vệ:</td>
            <td>
                <asp:TextBox ID="txt_MaBaoVe" runat="server" TabIndex="8" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                &nbsp;</td>
            <td>
                <cc1:CaptchaControl ID="capcha_dangky" runat="server" Arithmetic="False" 
                    CaptchaLength="6" Width="180px" />
            </td>
        </tr>
    </table>
    <div style="text-align: center">
        <asp:Button ID="bt_DangKy" runat="server" onclick="bt_DangKy_Click" 
            TabIndex="9" Text="Đăng ký" Height="30px" />
        <asp:Button ID="bt_huy" runat="server" onclick="bt_huy_Click" TabIndex="10" 
            Text="Hủy" Height="30px" />
        <br />
        
    </div>
</div>
    </asp:Content>

