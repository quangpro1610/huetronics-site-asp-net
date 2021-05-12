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
        Title = "Thêm NSX";
    }
    protected void btThem_Click(object sender, EventArgs e)
    {
        
            object[] obj1 = new object[1];
            obj1[0] = txtNSX.Text;
            SupportDb.ExecuteProcdure("ThemNSX", obj1);
            Response.Write("<script>alert('Thêm NSX thành công!');</script>");
            Response.Redirect(Request.ApplicationPath + "/Admin/QLNSX.aspx");    
        
    }
}