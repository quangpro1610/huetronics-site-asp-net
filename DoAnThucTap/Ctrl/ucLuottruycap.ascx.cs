using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Control_ucLuottruycap : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblLuotxem.Text = Application.Contents["sltruycap"].ToString();
        lblOnline.Text = Application.Contents["sltructuyen"].ToString();
    }
}