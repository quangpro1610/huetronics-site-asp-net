<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="CapNhatHDChuaGiao.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td style="width: 150px">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="ID Hóa Đơn:"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblIDHoaDon" runat="server" Text='<%# Eval("IDHoaDon") %>'></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Tình Trạng:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drpTinhtrang" runat="server" Width="100px">
                    <asp:ListItem>Chưa giao</asp:ListItem>
                    <asp:ListItem>Đã giao</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btCapnhat" runat="server" Height="30px" 
                    onclick="btCapnhat_Click" Text="Cập nhật" />
            &nbsp;&nbsp;
                <asp:Button ID="btBack" runat="server" Height="30px" 
                    onclick="btBack_Click" Text="Quay lại" />
            </td>
        </tr>
    </table>
</asp:Content>

