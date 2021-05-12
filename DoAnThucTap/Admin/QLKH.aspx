<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="QLKH.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;">
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="IDKhachHang" 
                    DataSourceID="SqlDataSource1" Width="100%" 
                    onselectedindexchanged="GridView2_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="IDKhachHang" HeaderText="Mã khách hàng" 
                            InsertVisible="False" ReadOnly="True" SortExpression="IDKhachHang">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenDangNhap" HeaderText="Tên đăng nhập" 
                            SortExpression="TenDangNhap" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="MatKhau" HeaderText="Mật khẩu" 
                            SortExpression="MatKhau" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="HoTen" HeaderText="Tên khách hàng" 
                            SortExpression="HoTen" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi" 
                            ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" SortExpression="SDT" 
                            ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" 
                            ReadOnly="True" />
                        <asp:BoundField DataField="TenQuyen" HeaderText="Quyền" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Chọn">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkXoa" runat="server" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/tick.png" 
                            ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HuetronicsConnectionString %>" 
                    SelectCommand="HienThiTatCaKhachHang" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btXoa" runat="server" Height="30px" onclick="btXoa_Click" 
                    Text="Xóa người dùng" />
            </td>
        </tr>
        <tr>
            <td style="width: 80px">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Khách hàng:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtKhachang" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 18px">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Quyền:"></asp:Label>
            </td>
            <td style="height: 18px">
                <asp:DropDownList ID="drpQuyen" runat="server" Width="200px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btCapnhat" runat="server" Height="30px" 
                    onclick="btCapnhat_Click" Text="Cập nhật" />
            </td>
        </tr>
    </table>
</asp:Content>

