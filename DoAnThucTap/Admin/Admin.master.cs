using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lnkbtnAdmin.Text = Session["HoTen"].ToString();
    }
    protected void lnkbtnThoat_Click(object sender, EventArgs e)
    {
        Session.Remove("TenDangNhap");
        Session.Remove("MatKhau");
        Session.Remove("Quyen");
        Session.Remove("HoTen");
        Response.Redirect(Request.ApplicationPath + "/Default.aspx");
    }
    protected void lnkbtnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.ApplicationPath + "/Default.aspx");
    }
    protected void lnkbtnAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("ThongTinAdmin.aspx");
    }
}
