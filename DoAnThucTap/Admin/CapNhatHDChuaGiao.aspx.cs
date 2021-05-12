using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Huetronics;
public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       Title = "Cập nhật hóa đơn"; 
       string id = Request.QueryString["idhd"].ToString();
       lblIDHoaDon.Text = id;
       
    }
    protected void btCapnhat_Click(object sender, EventArgs e)
    {
        object[] obj = new object[2];
        obj[0] = lblIDHoaDon.Text;
        obj[1] = drpTinhtrang.SelectedValue.ToString();
        SupportDb.ExecuteProcdure("CapNhatHoaDonChuaGiao", obj);
        Response.Redirect(Request.ApplicationPath + "/Admin/HoaDonChuaGiao.aspx");
    }
    protected void btBack_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.ApplicationPath + "/Admin/HoaDonChuaGiao.aspx");
    }
}