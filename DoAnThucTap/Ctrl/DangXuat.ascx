<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DangXuat.ascx.cs" Inherits="Ctrl_DangXuat" %>
<div id="DangXuat" runat="server">
    <table style="width: 100%;">
        <tr>
            <td align="right">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" 
                    Text="Chào"></asp:Label>
                ,
                <asp:LinkButton ID="lnkbtHoTen" runat="server" onclick="lnkbtHoTen_Click" 
                    Font-Bold="True" Font-Size="14px"></asp:LinkButton>
&nbsp;<asp:LinkButton ID="lnkbtThoat" runat="server" onclick="lnkbtThoat_Click" 
                    Font-Bold="True" Font-Size="14px">Thoát</asp:LinkButton>
            </td>
        </tr>
        </table>
</div>

