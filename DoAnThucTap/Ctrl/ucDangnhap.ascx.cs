using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Huetronics;

public partial class Ctrl_ucDangnhap : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["TenDangNhap"] == null || Session["MatKhau"] == null)
        {
            DangNhap.Visible = true;
        }
        else
        {
            DangNhap.Visible = false;
           
        }
    }
    protected void btLogin_Click(object sender, EventArgs e)
    {
        object[] obj = new object[2];
        obj[0] = txtUser.Text;
        obj[1] = md5.maHoa(txtPass.Text);
        DataSet dsuser = new DataSet();
        dsuser = SupportDb.ReturnDataSet("KiemtraDangNhap", obj);
        if (dsuser.Tables[0].Rows.Count > 0)
        {
            DataRow dr = dsuser.Tables[0].Rows[0];
            //dang nhap thanh cong
            lbl_thongbao.Visible = false;
            Session["TenDangNhap"] = dr["TenDangNhap"].ToString();
            Session["MatKhau"] = dr["MatKhau"].ToString();
            Session["Quyen"] = dr["TenQuyen"].ToString();
            Session["HoTen"] = dr["HoTen"].ToString();
            Session["IDKhachHang"] = dr["IDKhachHang"].ToString();
            Session["DiaChi"] = dr["DiaChi"].ToString();
            Session["Email"] = dr["Email"].ToString();
            Session["SDT"] = dr["SDT"].ToString();
            DangNhap.Visible = false;
            //lbl_tennguoidung.Text = "Chào " + Session["TenNguoiDung"].ToString();
            Response.Redirect(Request.ApplicationPath + "/Default.aspx");
        }
        else
        {
            lbl_thongbao.Visible = true;
            lbl_thongbao.Text = "Vui lòng kiểm tra lại tên đăng nhập hoặc mật khẩu!";
        }
    }
    protected void lnkbtnThoat_Click(object sender, EventArgs e)
    {

    }
}