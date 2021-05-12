﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="SuaThongTinAdmin.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div>
        <table style="width:100%;">
            <tr>
                <td align="right">
                    Họ tên:</td>
                <td>
                    <asp:TextBox ID="txtHoTen" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Địa chỉ:</td>
                <td>
                    <asp:TextBox ID="txtDiaChi" runat="server" Width="250px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Số điện thoại:</td>
                <td>
                    <asp:TextBox ID="txtSDT" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Email:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Vui lòng xác nhận mật khẩu:</td>
                <td>
                    <asp:TextBox ID="txtMatKhau" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <div align="center">
    
        <asp:Button ID="btOK" runat="server" onclick="btOK_Click" Text="Cập nhật" Height="30px" />
        <asp:Button ID="btHuy" runat="server" onclick="btHuy_Click" Text="Hủy" Height="30px" />
    
    </div>
</asp:Content>

