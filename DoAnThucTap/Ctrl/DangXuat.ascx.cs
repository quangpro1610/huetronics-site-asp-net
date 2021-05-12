using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ctrl_DangXuat : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["TenDangNhap"] == null || Session["MatKhau"] == null)
        {
            DangXuat.Visible = false;
        }
        else
        {
            DangXuat.Visible = true;
            lnkbtHoTen.Text = Session["HoTen"].ToString();
        }
    }
    protected void lnkbtHoTen_Click(object sender, EventArgs e)
    {
        if (Session["Quyen"].ToString() == "Admin")
        {
            Response.Redirect(Request.ApplicationPath + "/Admin/QLSP.aspx");
        }
        else Response.Redirect("ThongTinKH.aspx");
    }
    protected void lnkbtThoat_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Default.aspx");
    }
}