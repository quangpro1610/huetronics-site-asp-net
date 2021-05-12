<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DonDatHang.aspx.cs" Inherits="Default2" %>

<%@ Register assembly="MSCaptcha" namespace="MSCaptcha" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="width:100%;">
        <tr>
            <td colspan="2" align="center" 
                
                style="font-weight: bold; font-size: large; color: #FF0000; font-family: 'times New Roman', Times, serif;" 
                class="style1">
                THÔNG TIN ĐƠN ĐẶT HÀNG </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="3" GridLines="Horizontal" Width="100%" BackColor="White" 
                    BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="IDSanPham" HeaderText="Mã sản phẩm" >
                        <ItemStyle HorizontalAlign="Center" Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenSanPham" HeaderText=" Tên Sản Phẩm" />
                        <asp:TemplateField HeaderText="Hình ảnh">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Anh") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="46px" 
                                    ImageUrl='<%# Eval("Anh","~/{0}") %>' Width="72px" />
                            </ItemTemplate>
                            <ItemStyle Height="46px" HorizontalAlign="Center" Width="72px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="DonGia" HeaderText="Đơn Giá" />
                        <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ThanhTien" HeaderText="Thành Tiền" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#0066FF" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
            </td>
        </tr>
        <table class="cangiua">
        <tr>
            <td style="font-weight: bold; width: 200px;">
                Tên khách hàng:</td>
            <td>
                <asp:Label ID="lblTenKH" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-weight: bold">
                Địa chỉ
                :</td>
            <td>
                <asp:Label ID="lblDiachi" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-weight: bold">
                Ngày đặt hàng:</td>
            <td>
                <asp:Label ID="lblNgaydathang" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-weight: bold">
                Email:</td>
            <td>
                <asp:Label ID="lblEmail" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-weight: bold">
                Phương thức nhận hàng:</td>
            <td>
                <asp:Label ID="lblVanchuyen" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-weight: bold">
                Phương thức thanh toán:</td>
            <td>
                <asp:Label ID="lblThanhtoan" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-weight: bold">
                Ghi chú thêm:</td>
            <td>
                <asp:TextBox ID="txtGhiChu" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
           <td align="left" style="font-weight: bold">
               Tổng tiền:</td>
           <td>
               <asp:Label ID="lblTongtien" runat="server" Font-Bold="True" ForeColor="#0033CC"></asp:Label>
            </td>
        </tr>
        <tr>
           <td align="left">
               &nbsp;</td>
           <td>
               <asp:Label ID="lblThongbao" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
             <td align="right">
                  <asp:ImageButton ID="ImageButton1" runat="server" 
                      ImageUrl="~/Images/quaylai.png" onclick="btBack_Click" />
             </td>
            <td align="left">
                <asp:ImageButton ID="ImageButton2" runat="server" 
                    ImageUrl="~/Images/hoantat.png" onclick="btOk_Click" />
            </td>
        </tr>
        </table>
    </table>
</asp:Content>

