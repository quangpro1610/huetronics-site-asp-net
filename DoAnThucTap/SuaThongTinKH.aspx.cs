using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Huetronics;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Title = "Cập nhật thông tin";
    }
    protected void btHuy_Click(object sender, EventArgs e)
    {
        Response.Redirect("ThongTinKH.aspx");
    }
    protected void btOK_Click(object sender, EventArgs e)
    {

        if (md5.maHoa(txtMatKhau.Text) == Session["MatKhau"].ToString())
        {
            object[] obj = new object[5];
            obj[0] = Session["IDKhachHang"].ToString();
            obj[1] = txtHoTen.Text;
            obj[2] = txtDiaChi.Text;
            obj[3] = txtSDT.Text;
            obj[4] = txtEmail.Text;
            SupportDb.ExecuteProcdure("ThayDoiThongTinCaNhan", obj);
            Session["HoTen"] = txtHoTen.Text;
            Session["DiaChi"] = txtDiaChi.Text;
            Session["SDT"] = txtSDT.Text;
            Session["Email"] = txtEmail.Text;
            Response.Redirect("ThongTinKH.aspx");
        }
        else
        {
            Response.Write("<script>alert('Mật khẩu không chính xác!');</script>");
            txtMatKhau.Text = "";
        }
    }
}