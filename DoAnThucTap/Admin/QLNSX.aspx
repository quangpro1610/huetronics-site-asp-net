<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="QLNSX.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%">
<tr><td >
    <div id="GridCatalog" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="IDNhaSX" 
        DataSourceID="SqlDataSource1" Width="100%">
        <Columns>
            <asp:BoundField DataField="IDNhaSX" HeaderText="Mã nhà sản xuất" 
                InsertVisible="False" ReadOnly="True" SortExpression="IDNhaSX">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="TenNSX" HeaderText="Tên nhà sản xuất" 
                SortExpression="TenNSX">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Chọn">
                <ItemTemplate>
                    <asp:CheckBox ID="chkXoa" runat="server" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:CommandField ButtonType="Image" EditImageUrl="~/Admin/Images/cog_edit.png" 
                HeaderText="Tùy chọn" ShowCancelButton="False" 
                UpdateImageUrl="~/Admin/Images/update.png" ShowEditButton="True">
            <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
        </Columns>
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" UpdateCommand="UPDATE [tbl_NhaSanXuat] SET [TenNSX] = @TenNSX WHERE [IDNhaSX] = @IDNhaSX"  
            ConnectionString="<%$ ConnectionStrings:HuetronicsConnectionString %>" 
            SelectCommand="HienThiNSX" SelectCommandType="StoredProcedure">
                 <UpdateParameters>
                <asp:Parameter Type="String" 
                  Name="TenNSX"></asp:Parameter>
                <asp:Parameter Type="Int32" Name="IDNhaSX"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
       </div></td></tr>
<tr><td>
    <asp:Button ID="btXoa" runat="server" Height="30px" Text="Xóa NSX" 
        onclick="btXoa_Click" />
&nbsp;&nbsp;&nbsp;
    </td></tr>
    </table>
</asp:Content>

