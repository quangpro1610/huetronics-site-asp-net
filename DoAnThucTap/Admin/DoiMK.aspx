<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="DoiMK.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="DoiMK" style="height: 150px">
<div style="text-align: center; font-size: large; color: #0000FF; font-weight: 700;">
        ĐỔI MẬT KHẨU</div>
    <div>
        <table style="width:100%;">
            <tr>
                <td align="right">
                    Mật khẩu cũ:</td>
                <td>
                    <asp:TextBox ID="txtpasscu" runat="server" TabIndex="1" TextMode="Password" 
                        Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Mật khẩu mới:</td>
                <td>
                    <asp:TextBox ID="txtPassmoi" runat="server" TabIndex="2" TextMode="Password" 
                        Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Nhập lại mật khẩu mới:</td>
                <td>
                    <asp:TextBox ID="txtPassmoinhaplai" runat="server" TabIndex="3" 
                        TextMode="Password" Width="250px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div style="text-align: center">
            <asp:Button ID="bt_Doi" runat="server" onclick="bt_Doi_Click" TabIndex="4" 
                Text="Đổi mật khẩu" Width="103px" Height="30px" />
            <asp:Button ID="btHuy" runat="server" onclick="btHuy_Click" TabIndex="5" 
                Text="Hủy" Height="30px" />
            <br />
        </div>
    </div>
    </div>
</asp:Content>

