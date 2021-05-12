<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GioHang.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <asp:DataGrid ID="dgcart" runat="server" AutoGenerateColumns="False" 
            ondeletecommand="dgcart_DeleteCommand" oneditcommand="dgcart_EditCommand" 
            onupdatecommand="dgcart_UpdateCommand" Width="100%" CellPadding="3" 
            GridLines="Horizontal" BackColor="White" BorderColor="#E7E7FF" 
            BorderStyle="None" BorderWidth="1px">
            <AlternatingItemStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:ButtonColumn CommandName="Delete" Text="Xóa"></asp:ButtonColumn>
                <asp:TemplateColumn HeaderText="TT">
                    <ItemTemplate><%=i++ %>
                    </ItemTemplate>
                    <HeaderStyle Width="30px" />
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="IDSanPham" HeaderText="Mã SP" ReadOnly="True">
                </asp:BoundColumn>
                <asp:BoundColumn DataField="TenSanPham" HeaderText="Tên sản phẩm" 
                    ReadOnly="True">
                    <HeaderStyle Width="100px" />
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="Hình ảnh">
                    <ItemTemplate>
                        <asp:Image ID="Image2" runat="server" Height="60px" Width="69px"  ImageUrl='<%# Eval("Anh","~/{0}") %>' />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="DonGia" HeaderText="Đơn giá" ReadOnly="True">
                    <HeaderStyle Width="75px" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="SoLuong" HeaderText="Số lượng"></asp:BoundColumn>
                <asp:BoundColumn DataField="ThanhTien" HeaderText="Thành tiền" ReadOnly="True">
                    <HeaderStyle Width="75px" />
                </asp:BoundColumn>
                <asp:EditCommandColumn EditText="Sửa" UpdateText="Cập Nhật">
                    <HeaderStyle Width="50px" />
                </asp:EditCommandColumn>
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" 
                BackColor="#0066FF" ForeColor="#F7F7F7" Font-Italic="False" 
                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
            <ItemStyle HorizontalAlign="Center" BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" 
                Mode="NumericPages" />
            <SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C" />
        </asp:DataGrid>
    </div>
    <br />
    <table style="width:100%;">
        <tr>
            <td colspan="2">
                <asp:Label ID="lblTongtien" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Chọn phương thức vận chuyển:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DrpVanChuyen" runat="server" Width="250px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Chọn phương thức thanh toán:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DrpThanhToan" runat="server" Width="250px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/Images/muatiep.png" onclick="btMuatiep_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton2" runat="server" 
                    ImageUrl="~/Images/dathang.png" onclick="btThanhtoan_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

