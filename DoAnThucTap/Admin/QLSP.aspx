<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="QLSP.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" DataKeyNames="IDSanPham" 
    DataSourceID="SqlDataSource1" Width="100%">
        <Columns>
            <asp:BoundField DataField="IDSanPham" HeaderText="Mã sản phẩm" 
                InsertVisible="False" ReadOnly="True" SortExpression="IDSanPham" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="IDLoai" HeaderText="Mã Loại" 
                SortExpression="IDLoai" ReadOnly="True" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="IDNhaSX" HeaderText="Mã nhà sản xuất" 
                SortExpression="IDNhaSX" ReadOnly="True" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="TenSanPham" HeaderText="Tên sản phẩm" 
                SortExpression="TenSanPham" ReadOnly="True" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Anh" HeaderText="Ảnh" SortExpression="Anh" 
                ReadOnly="True" />
            <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" 
                SortExpression="DonGia" ReadOnly="True" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" 
                SortExpression="SoLuong" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Chọn">
                <ItemTemplate>
                    <asp:CheckBox ID="chkSanpham" runat="server" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:CommandField ButtonType="Image" EditImageUrl="~/Admin/Images/cog_edit.png" 
                EditText="Sửa" HeaderText="Tùy chọn" ShowCancelButton="False" 
                ShowEditButton="True" UpdateImageUrl="~/Admin/Images/update.png" 
                UpdateText="Cập nhật">
            <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
        </Columns>
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" UpdateCommand="UPDATE [tbl_SanPham] SET [SoLuong] = @SoLuong WHERE [IDSanPham] = @IDSanPham" 
        ConnectionString="<%$ ConnectionStrings:HuetronicsConnectionString %>" 
        SelectCommand="LayTatCaSanPham" SelectCommandType="StoredProcedure">
             <UpdateParameters>
                <asp:Parameter Type="Int16" 
                  Name="SoLuong"></asp:Parameter>
                <asp:Parameter Type="Int32" Name="IDSanPham"></asp:Parameter>
            </UpdateParameters>
    </asp:SqlDataSource>
<table style="width: 100%;">
 <tr>
        <td style="height: 32px" align="center">
            <asp:Button ID="btXoa" runat="server" Text="Xóa sản phẩm" 
                onclick="btXoa_Click" Height="30px" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

