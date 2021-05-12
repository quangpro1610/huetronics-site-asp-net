using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Huetronics;
public partial class Admin_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Title = "Thêm sản phẩm";
        if (!Page.IsPostBack)
        {
            //goi thu tuc lay tat ca kenh du lieu
            object[] obj = new object[0];
            DataSet dsloai = new DataSet();
            dsloai = SupportDb.ReturnDataSet("HienThiLoai", obj);
            if (dsloai.Tables[0].Rows.Count > 0)
            {
                //goi ham de nap du lieu vao dropdownlist
                SupportDb.BindFromDataSetToCombo(dsloai, drpLoai, "IDLoai", "TenLoai");
            }

            //goi thu tuc lay tat ca kenh du lieu
            object[] obj1 = new object[0];
            DataSet dsnsx = new DataSet();
            dsnsx  = SupportDb.ReturnDataSet("HienThiNSX", obj);
            if (dsnsx .Tables[0].Rows.Count > 0)
            {
                //goi ham de nap du lieu vao dropdownlist
                SupportDb.BindFromDataSetToCombo(dsnsx , drpNSX, "IDNhaSX", "TenNSX");
            }
        }
    }
    protected void btThem_Click(object sender, EventArgs e)
    {
        string str = "Images/Products/";
        fuAnh.SaveAs(Server.MapPath("../Images/Products/") + fuAnh.FileName);
        object[] obj = new object[8];
        obj[0] = drpLoai.SelectedValue;
        obj[1] = drpNSX.SelectedValue;
        obj[2] = txtTensp.Text;
        obj[3] = str + fuAnh.FileName;
        obj[4] = txtTomtat.Text;
        obj[5] = txtChitiet.Text;
        obj[6] = txtDongia.Text;
        obj[7] = txtSoluong.Text;
        SupportDb.ExecuteProcdure("ThemSanPham", obj);
        Response.Write("<script>alert('Đã thêm mới sản phẩm!');</script>");
    }
}