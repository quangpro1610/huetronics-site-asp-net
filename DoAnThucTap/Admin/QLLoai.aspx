<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="QLLoai.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%">
<tr><td >
    <div id="GridCatalog" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="IDLoai" DataSourceID="SqlDataSource1" 
        Width="100%">
        <Columns>
            <asp:BoundField DataField="IDLoai" HeaderText="Mã loại" InsertVisible="False" 
                ReadOnly="True" SortExpression="IDLoai" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="TenLoai" HeaderText="Tên loại" 
                SortExpression="TenLoai" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Chọn">
                <ItemTemplate>
                    <asp:CheckBox ID="chkXoa" runat="server" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:CommandField ButtonType="Image" EditImageUrl="~/Admin/Images/cog_edit.png" 
                EditText="Sửa" HeaderText="Tùy chọn" ShowEditButton="True" 
                UpdateImageUrl="~/Admin/Images/update.png" UpdateText="Cập nhật" 
                ShowCancelButton="False">
            <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" UpdateCommand="UPDATE [tbl_Loai] SET [TenLoai] = @TenLoai WHERE [IDLoai] = @IDLoai" 
        ConnectionString="<%$ ConnectionStrings:HuetronicsConnectionString %>" 
        SelectCommand="HienThiLoai" SelectCommandType="StoredProcedure">
        <UpdateParameters>
                <asp:Parameter Type="String" 
                  Name="TenLoai"></asp:Parameter>
                <asp:Parameter Type="Int32" Name="IDLoai"></asp:Parameter>
            </UpdateParameters>
    </asp:SqlDataSource>
       </div></td></tr>
<tr><td>
    <asp:Button ID="btXoa" runat="server" Height="30px" Text="Xóa loại" 
        onclick="btXoa_Click" />
&nbsp;&nbsp;&nbsp;
    </td></tr>
    </table>
</asp:Content>

