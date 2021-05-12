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
        Title = "Quản lý sản phẩm";  
    }
    protected void btXoa_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chkSanpham");
            if (chk != null && chk.Checked)
            {
                //bat dau xoa nd
                int idnsx = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                object[] obj1 = new object[1];
                obj1[0] = idnsx;
                SupportDb.ExecuteProcdure("XoaSanPham", obj1);
                //Response.Write(idnsx.ToString());
                Response.Redirect(Request.ApplicationPath + "/Admin/QLSP.aspx");
            }
        }
    }
}