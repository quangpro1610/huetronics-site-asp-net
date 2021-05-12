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
        Title = "Quản Lý Khách Hàng";
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
    protected void btXoa_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView2.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chkXoa");
            if (chk != null && chk.Checked)
            {
                //bat dau xoa nd
                int idnsx = Convert.ToInt32(GridView2.DataKeys[row.RowIndex].Value);
                object[] obj1 = new object[1];
                obj1[0] = idnsx;
                SupportDb.ExecuteProcdure("XoaKhachHang", obj1);
                //Response.Write(idnsx.ToString());
                Response.Redirect(Request.ApplicationPath + "/Admin/QLKH.aspx");
            }
        }
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        int dr = GridView2.SelectedIndex;
        txtKhachang.Text = GridView2.Rows[dr].Cells[0].Text;
    }
    protected void btCapnhat_Click(object sender, EventArgs e)
    {
        object[] objq = new object[2];
        objq[0] = txtKhachang.Text;
        objq[1] = drpQuyen.SelectedValue;
        SupportDb.ExecuteProcdure("CapNhatQuyenKH", objq);
        Response.Write("<script>alert('Cập nhật khách hàng thành công!');</script>");
    }
}