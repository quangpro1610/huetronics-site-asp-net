<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ThanhCong.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                Kính chào quý khách
                <asp:Label ID="lblHoten" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                .</td>
        </tr>
        <tr>
            <td>
                <p>
                Xin chân thành cám ơn quý khách mua sắm tại website của Công ty. Hi vọng quý khách đã có khoảng thời gian mua sắm vui vẻ và thú vị tại đây! 
               
               </p>
                <p>
                    Đơn đặt hàng của quý khách đã được hệ thống gửi về mail của quý khách. Quý khách 
                    vui lòng kiểm tra trong hộp thư đến.</p>
                <p>
                    Bộ phận hỗ trợ khách hàng sẽ liên hệ với khách hàng để xác nhận chi tiết giao dịch. Khi đơn đặt hàng được xác nhận, chúng tôi sẽ bắt đầu chuyển hàng cho khách hàng.

Khách hàng vui lòng kiểm tra số lượng hàng chính xác khi nhận hàng.</p>
                <p>
                  Trân trọng,<br />
                    Đội ngũ Công ty Huetronics</p>
                </td>
        </tr>
        </table>
</asp:Content>

