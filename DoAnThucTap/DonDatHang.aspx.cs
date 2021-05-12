using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Huetronics;
using System.Net.Mail;
public partial class Default2 : System.Web.UI.Page
{
    DataTable objDT;
    public int i = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ThongTinKH();
            HienThi();
        }
    }
    void HienThi()
    {
        objDT = (DataTable)Session["Cart"];
        GridView1.DataSource = objDT;
        GridView1.DataBind();
        lblTongtien.Text = TongTien().ToString("0,0") + "VNĐ";

    }
    Double SoLuong()
    {
        Double sl = 0;
        DataTable objDT = (DataTable)Session["Cart"];
        for (int i = 0; i < objDT.Rows.Count; i++)
            sl += (Int32)objDT.Rows[i]["SoLuong"];
        return sl;

    }
    public Double TongTien()
    {
        Double s = 0;
        DataTable objDT = (DataTable)Session["Cart"];
        for (i = 0; i < objDT.Rows.Count; i++)
            s += (Double)objDT.Rows[i]["ThanhTien"];
        return s;
    }
    public void ThongTinKH()
    {
        lblTenKH.Text = Session["HoTen"].ToString();
        lblEmail.Text = Session["Email"].ToString();
        lblDiachi.Text = Session["DiaChi"].ToString();
        lblVanchuyen.Text = Session["VanChuyen"].ToString();
        lblThanhtoan.Text = Session["ThanhToan"].ToString();
        lblNgaydathang.Text = System.DateTime.Now.ToShortDateString();
        
    }
    void Chitietsanpham()
    {
        DataSet ds = new DataSet();
        object[] objht = new object[0];
        ds = SupportDb.ReturnDataSet("LayMaHoaDonLonNhat", objht);
        DataRow dr = ds.Tables[0].Rows[0];
        objDT = (DataTable)Session["Cart"];
        for (int i = 0; i < objDT.Rows.Count; i++)
        {
            object[] obj1 = new object[3];
            obj1[0] = Convert.ToInt32(dr["IDHoaDon"].ToString());
            obj1[1] = (Int32)objDT.Rows[i]["IDSanPham"];
            obj1[2] = (Int32)objDT.Rows[i]["SoLuong"];
            SupportDb.ExecuteProcdure("ThemChiTietHoaDon", obj1);
        }
    }
    protected void btOk_Click(object sender, ImageClickEventArgs e)
    {
            object[] obj = new object[5];
            obj[0] =  System.DateTime.Now.ToShortDateString();
            obj[1] = txtGhiChu.Text;
            obj[2] = Session["IDKhachHang"];
            obj[3] = Session["IDVanChuyen"];
            obj[4] = Session["IDThanhToan"];
            SupportDb.ExecuteProcdure("ThemHoaDon", obj);
            Chitietsanpham();
            SendMail();
            Response.Redirect("ThanhCong.aspx");  
        
    }
    protected void btBack_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("GioHang.aspx");
    }
    void SendMail()
    {
        MailMessage mail = new MailMessage();
        mail.To.Add(lblEmail.Text);
        mail.From = new MailAddress("quangpro1610@gmail.com");
        mail.Subject = "IzoneHuetronics - Xác nhận đơn hàng";
        mail.Body = MailBody();
        mail.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
        smtp.Credentials = new System.Net.NetworkCredential
             ("quangpro1610@gmail.com", "hoangvanquang");
        //Or your Smtp Email ID and Password
        smtp.EnableSsl = true;
        smtp.Send(mail);

    }
    private string MailBody()
    {
        string strHTML = "";
        strHTML += "Quý khách đã thực hiện mua hàng trên website của công ty Huetronics." + "<br>";
        strHTML += "Ngày đặt hàng: " + lblNgaydathang.Text + "<br>";
        strHTML += "Tên khách hàng: " + lblTenKH.Text  + "<br>";
        strHTML += "Địa chỉ : " + lblDiachi.Text + "<br>";
        strHTML += "Phương thức nhận hàng: " + lblVanchuyen.Text + "<br>";
        strHTML += "Phương thức thanh toán: " + lblThanhtoan.Text + "<br>";
        strHTML += "Xin chân thành cám ơn quý khách đã mua sắm tại izone Huetronics. Hi vọng quý khách đã có khoảng thời gian mua sắm vui vẻ và thú vị tại đây! " + "<br>";
        strHTML += "Bộ phận hỗ trợ khách hàng sẽ liên hệ với khách hàng để xác nhận chi tiết giao dịch. Khi đơn đặt hàng được xác nhận, chúng tôi sẽ bắt đầu chuyển hàng cho khách hàng.Khách hàng vui lòng kiểm tra số lượng hàng chính xác khi nhận hàng.";
        return strHTML;
    }
}