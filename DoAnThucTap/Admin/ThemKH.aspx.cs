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
        Title = "Thêm Khách Hàng";
        txtTendangnhap.Focus();
        if (!Page.IsPostBack)
        {
            //goi thu tuc lay tat ca kenh du lieu
            object[] obj = new object[0];
            DataSet dsquyen = new DataSet();
            dsquyen = SupportDb.ReturnDataSet("HienThiQuyen", obj);
            if (dsquyen.Tables[0].Rows.Count > 0)
            {
                //goi ham de nap du lieu vao dropdownlist
                SupportDb.BindFromDataSetToCombo(dsquyen, drpQuyen, "IDQuyen", "TenQuyen");
            }
        }
    }
    protected void btThem_Click(object sender, EventArgs e)
    {
        if (txtPass.Text.Length >= 6)//Password >6 kí tự mới được phép đăng ký
        {
            try
            {
                object[] obj2 = new object[2];
                obj2[0] = txtTendangnhap.Text;
                obj2[1] = txtDiachi.Text;
                DataSet ds = new DataSet();
                ds = SupportDb.ReturnDataSet("Kiemtra_User_Email", obj2);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Response.Write("<script>alert('Tài khoản của bạn đã có người đăng ký. Vui lòng chọn tài khoản khác!');</script>");
                }
                else
                {
                    if (ds.Tables[1].Rows.Count != 0)
                    {
                        Response.Write("<script>alert('Bạn chưa nhâp Email hoặc Email đã tồi tại, bạn vui lòng nhập Email khác');</script>");
                    }
                    else
                    {
                        object[] obj = new object[7];
                        obj[0] = txtTendangnhap.Text;
                        obj[1] = md5.maHoa(txtPass.Text);
                        obj[2] = txtTennguoidung.Text;
                        obj[3] = txtDiachi.Text;
                        obj[4] = txtSDT.Text;
                        obj[5] = txtEmail.Text;
                        obj[6] = drpQuyen.SelectedValue;
                        SupportDb.ExecuteProcdure("DangKyThanhVien_Admin", obj);
                        Response.Write("<script>alert('Tài khoản của bạn đã được tạo thành công!');</script>");
                    }
                }
            }
            catch
            {
                Response.Write("<script>alert('Có lỗi xảy ra trong quá trình đăng ký!.Vui lòng kiểm tra lại!');</script>");

            }
        }
        else
        {
            Response.Write("<script>alert('Mật khẩu quá ngắn!');</script>");
        }

    }
}