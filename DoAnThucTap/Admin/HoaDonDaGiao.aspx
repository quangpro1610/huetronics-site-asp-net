<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="HoaDonDaGiao.aspx.cs" Inherits="Admin_Default" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="font-family: 'Times New Roman', Times, serif; font-size: 16px; background-color: #C0C0C0">
        <table style="width:100%;">
            <tr>
                <td style="width: 300px" valign="top">
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="IDHoaDon" 
                        DataSourceID="SqlDataSource1" Width="100%">
                        <ItemTemplate>
                            <table style="width:100%;">
                                <tr>
                                    <td style="width: 100px">
                                        <asp:HyperLink ID="hplIDHoaDon" runat="server"
                                         NavigateUrl='<%# "HoaDonDaGiao.aspx?idhd="+Eval("IDHoaDon") %>' 
                                         Text='<%# Eval("IDHoaDon") %>'></asp:HyperLink>
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="hplTinhTrang" runat="server"
                                        Text='<%# Eval("TinhTrang") %>'></asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HuetronicsConnectionString %>" 
                        SelectCommand="HoaDon_DaGiao" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
                </td>
                <td style="width: 500px">
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
                        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
                        <LocalReport ReportPath="Admin\InHoaDon.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="InHoaDon" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="HuetronicsDataSetTableAdapters.LayChiTietHoaDonTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="IDHoaDon" QueryStringField="idhd" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

