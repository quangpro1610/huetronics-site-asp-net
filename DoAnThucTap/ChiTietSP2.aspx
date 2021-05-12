<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChiTietSP2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="width:100%;">
        <tr>
            <td align="center" colspan="2">
                <b style="font-size: large; font-family: 'Times New Roman', Times, serif; color: #000080;">THÔNG TIN SẢN PHẨM</b></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Image ID="Image1" runat="server" Height="200px" Width="300px" />
            </td><br />
        </tr>
        <tr>
               <td align="left" style="width: 330px">
                   <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="#0066FF" 
                       Text="Chia sẻ sản phẩm này lên mạng xã hội:"></asp:Label>
               </td>
            <td align="center" valign="middle">
                <div id="socialshare">
                <div style="width:60px; height:20px; float:left; margin-top: 3px;">
                    <a name="fb_share"></a> 
                    <script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script>
                </div>
                <div onClick="window.open('https://plus.google.com/share?url='+document.URL, '_blank')" 
                        style="width:50px; height:20px; margin-top:2px;background-image:url(https://ssl.gstatic.com/s2/oz/images/stars/po/Publisher/sprite4-a67f741843ffc4220554c34bd01bb0bb.png);float:left;margin-left:3px;cursor:pointer; background-repeat: no-repeat;"></div>
                </div>
                </td>
        </tr>
        <table style="border-collapse: collapse;">
        <tr>
            <td style="font-weight: bold; font-style: normal; width: 120px; height: 23px;">
                <asp:Label ID="Label1" runat="server" Text="Tên sản phẩm:"></asp:Label>
            </td>
            <td style="height: 23px">
                <asp:Label ID="lblTensanpham" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-weight: bold; font-style: normal;">
                <asp:Label ID="Label2" runat="server" Text="Chi tiết:"></asp:Label>
            </td>
            <td style="height: 23px">
                <asp:Label ID="lblChitiet" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-weight: bold; font-style: normal">
                <asp:Label ID="Label3" runat="server" Text="Số lượng: "></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblSoluong" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-weight: bold; font-style: normal">
                <asp:Label ID="Label4" runat="server" Text="Số lượng mua:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSoluongmua" runat="server" Width="100px">1</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="font-weight: bold; font-style: normal">
                <asp:Label ID="Label5" runat="server" Text="Đơn giá:"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblDongia" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="btBack" runat="server" ImageUrl="~/Images/quaylai.png" 
                    ToolTip="Trở về trang sản phẩm" onclick="btBack_Click" />
&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="btAdd" CommandArgument='<%#Eval("IDSanPham") %>' 
                    runat="server" ImageUrl="~/Images/themvaogio.png" 
                    ToolTip="Thêm hàng này" onclick="btAdd_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Label ID="lblThongbao" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        </table>
        
    </table>
</asp:Content>

