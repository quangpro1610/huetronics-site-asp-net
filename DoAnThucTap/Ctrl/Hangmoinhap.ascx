<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Hangmoinhap.ascx.cs" Inherits="Ctrl_Hangmoinhap" %>
<link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
<marquee id="marqueelup2" onmouseover="marqueelup2.stop()" onmouseout="marqueelup2.start()" scrollamount="2" scrolldelay="70" direction="up" width="100%" height="150">
     <asp:DataList ID="DataList1" runat="server" DataKeyField="IDSanPham" Width="197px" >
	        <ItemTemplate>
                <div class="top5">
                    <table border="0">
                       
                        <tr>
                            <td valign="middle"><a href="ChiTietSP2.aspx?IDSP=<%#Eval("IDSanPham")%>"><asp:Image ID="Image1" ImageUrl='<%# Eval("Anh","~/{0}") %>' runat="server" Height="66px" Width="78px" /></a></td>
                         </tr>
                          <tr>
                            <td colspan="2" > <a href="ChiTietSP2.aspx?IDSP=<%#Eval("IDSanPham")%>"><h3> <%#Eval("TenSanPham")%></h3> </a></td>
                        </tr>
                         <%--<tr>
                         <td><a href="Chitiet2.aspx?mh=<%#Eval("SanPhamID")%>"><h3>Giá: <%#Eval("DonGia") %>  VND</h3></a></td>
                         </tr>--%>
                    </table>
                </div>
            </ItemTemplate>
       </asp:DataList>
</marque>