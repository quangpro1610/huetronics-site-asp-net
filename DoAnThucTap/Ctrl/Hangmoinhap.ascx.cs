using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Huetronics;
using System.Data.SqlClient;
public partial class Ctrl_Hangmoinhap : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        object[] obj = new object[0];
        ds = SupportDb.ReturnDataSet("SanPhamMoi", obj);
        DataList1.DataSource = ds;
        DataList1.DataBind();
    }
    
}