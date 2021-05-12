<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucDangnhap.ascx.cs" Inherits="Ctrl_ucDangnhap" %>
<div style="clip: rect(auto, auto, auto, auto)">
<div id="DangNhap" runat="server">
<table style="width:100%; clip: rect(-10px, auto, auto, auto);">
    <tr>
        <td align="center"  
            valign="top">
            <asp:TextBox ID="txtUser" runat="server" Width="150px" Font-Italic="True" value="Tên đăng nhập" onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="center"  
            valign="top">
            <asp:TextBox ID="txtPass" runat="server" Width="150px" TextMode="Password" value="Mật khẩu" onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="center"  
            
            style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #FFFFFF; " 
            valign="top">
            <asp:Button ID="btLogin" runat="server" Text="Đăng nhập" Height="25px" 
                onclick="btLogin_Click" />
        </td>
    </tr>
    <tr>
        <td align="center"  
            valign="top">
                <asp:Label ID="lbl_thongbao" runat="server"></asp:Label>
        </td>
    </tr>
</table>
</div>
</div>

