using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Huetronics;
using System.Data;
public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Title = "Thêm loại sản phẩm";
        if (!Page.IsPostBack)
        {
            //goi thu tuc lay tat ca kenh du lieu
            object[] obj = new object[0];
            DataSet dsloai = new DataSet();
            dsloai = SupportDb.ReturnDataSet("HienThiDanhMuc", obj);
            if (dsloai.Tables[0].Rows.Count > 0)
            {
                //goi ham de nap du lieu vao dropdownlist
                SupportDb.BindFromDataSetToCombo(dsloai, drpDanhmuc, "IDDanhMuc", "TenDanhMuc");
            }
        }
    }
    protected void btThem_Click(object sender, EventArgs e)
    {
        object[] obj = new object[2];
        obj[0] = drpDanhmuc.SelectedValue;
        obj[1] = txtTenloai.Text;
        DataSet ds = new DataSet();
        ds = SupportDb.ReturnDataSet("KiemTraTrungLoai", obj);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Response.Write("<script>alert('Loại sản phẩm đã tồn tại.Vui lòng kiểm tra lại!');</script>"); 
        }
        else
        {
            object[] obj1 = new object[2];
            obj1[0] = drpDanhmuc.SelectedValue;
            obj1[1] = txtTenloai.Text;
            SupportDb.ExecuteProcdure("ThemLoai", obj);
            Response.Write("<script>alert('Thêm loại thành công!');</script>");
        }
    }
}