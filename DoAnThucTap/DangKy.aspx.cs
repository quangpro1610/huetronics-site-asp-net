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
        Title = "Đăng ký tài khoản";
        txt_TenDangNhap.Focus();
        if (Session["HoTen"] != null)
        {
            lbl_thongbao.Text = "Bạn đã đăng nhập.Không thể tiến hành đăng ký.";
            bt_DangKy.Visible = false;
            bt_huy.Visible = false;
            DK.Visible = false;
        }
    }

    protected void bt_DangKy_Click(object sender, EventArgs e)
    {
        capcha_dangky.ValidateCaptcha(txt_MaBaoVe.Text);
        if (!capcha_dangky.UserValidated)
        {
            lbl_thongbao.Text = "Mã bảo vệ chưa chính xác";
            return;
        }
        else
        {
            lbl_thongbao.Text = "Thành công";
        }
        if (txt_MatKhau.Text.Length >= 6)//Password >6 kí tự mới được phép đăng ký
        {
            try
            {
                if (txt_MatKhau.Text == txt_MatKhau_Nhaplai.Text)
                {
                    object[] obj2 = new object[2];
                    obj2[0] = txt_TenDangNhap.Text;
                    obj2[1] = txt_Email.Text;
                    DataSet ds = new DataSet();
                    ds = SupportDb.ReturnDataSet("Kiemtra_User_Email", obj2);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        lbl_thongbao.Text = "Tài khoản của bạn đã có người đăng ký. Vui lòng chọn tài khoản khác!";
                    }
                    else
                    {
                        if (ds.Tables[1].Rows.Count != 0)
                        {
                            lbl_thongbao.Text = "Bạn chưa nhâp Email hoặc Email đã tồi tại, bạn vui lòng nhập Email Khác";
                        }
                        else
                        {
                            object[] obj = new object[6];
                            obj[0] = txt_TenDangNhap.Text;
                            obj[1] = md5.maHoa(txt_MatKhau.Text);
                            obj[2] = txt_HoTen.Text;
                            obj[3] = txt_DiaChi.Text;
                            obj[4] = txt_SDT.Text;
                            obj[5] = txt_Email.Text;
                            SupportDb.ExecuteProcdure("DangKyThanhVien", obj);
                            lbl_thongbao.Text = "Tài khoản của bạn đã được tạo thành công!";
                        }
                    }
                }
                else lbl_thongbao.Text = "Mật khẩu chưa khớp. Vui lòng kiểm tra lại!";
            }
            catch
            {
                lbl_thongbao.Text = "Có lỗi xảy ra trong quá trình đăng ký!. Vui lòng kiểm tra lại!";

            }
        }
        else
        {
            lbl_thongbao.Text = "Mật khẩu quá ngắn!";
        }
    }
    protected void bt_huy_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}