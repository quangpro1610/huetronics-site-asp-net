using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Huetronics;
public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Title = "Đổi thông tin cá nhân";
    }
    protected void btHuy_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.ApplicationPath + "/Admin/QLSP.aspx");
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
            Response.Redirect(Request.ApplicationPath + "/Admin/SuaThongTinAdmin.aspx");
        }
        else
        {
            Response.Write("<script>alert('Mật khẩu không chính xác!');</script>");
            txtMatKhau.Text = "";
        }
    }
}