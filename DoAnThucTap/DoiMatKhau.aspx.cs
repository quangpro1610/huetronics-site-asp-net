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
        txtpasscu.Focus();
    }
    protected void bt_Doi_Click(object sender, EventArgs e)
    {
        if (md5.maHoa(txtpasscu.Text) == Session["MatKhau"].ToString())
        {
            if (txtPassmoi.Text == txtPassmoinhaplai.Text)
            {
                object[] obj = new object[2];
                obj[0] = Session["IDKhachHang"].ToString();
                obj[1] = md5.maHoa(txtPassmoi.Text);
                SupportDb.ExecuteProcdure("ThayDoiMatKhau", obj);
                Session["MatKhau"] = md5.maHoa(txtPassmoi.Text);
                Response.Write("<script>alert('Mật khẩu đã được đổi thành công!');</script>");
            }
            else Response.Write("<script>alert('Mật khẩu mới nhập lại chưa khớp!');</script>");
        }
        else Response.Write("<script>alert('Mật khẩu cũ không chính xác!');</script>");
    }
    protected void bt_huy_Click(object sender, EventArgs e)
    {
        
    }
    protected void btHuy_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}