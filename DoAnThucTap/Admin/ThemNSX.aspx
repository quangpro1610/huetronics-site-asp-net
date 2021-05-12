<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ThemNSX.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="width: 100%;">
           
        <tr>
            <td style="width: 100px">
                <asp:Label ID="Label1" runat="server" CssClass="lb" Text="Tên nhà sản xuất:" 
                    Width="150px"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNSX" runat="server" CssClass="tb" Width="200px"></asp:TextBox>
            </td>
        </tr>
             <tr>
            <td colspan="2">
                <asp:Button ID="btThem" runat="server" onclick="btThem_Click" 
                    Text="Thêm NSX" Height="30px" />
            </td>
        </tr>
    </table>
</asp:Content>

