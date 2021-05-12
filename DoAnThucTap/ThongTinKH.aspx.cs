using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Title = "Thông tin cá nhân";
        lblHoTen.Text = Session["HoTen"].ToString();
        lblDiaChi.Text = Session["DiaChi"].ToString();
        lblSDT.Text = Session["SDT"].ToString();
        lblEmail.Text = Session["Email"].ToString();
    }
}