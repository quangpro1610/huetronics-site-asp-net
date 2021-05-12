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
    DataTable objDT;
    public int i = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HienThi();
            HienthiVanChuyen();
            HienthiThanhToan();
        }
        Session["VanChuyen"] = "";
        Session["IDVanChuyen"] = "";
        Session["ThanhToan"] = "";
        Session["IDThanhToan"] = "";
    }
    void HienThi()
    {
        objDT = (DataTable)Session["Cart"];
        dgcart.DataSource = objDT;
        dgcart.DataBind();
        lblTongtien.Text = "Tổng tiền:  " + Tongtien().ToString("0,0") + " VNĐ";
    }
    void HienthiVanChuyen()
    {
        object[] obj = new object[0];
        DataSet ds = new DataSet();
        ds = SupportDb.ReturnDataSet("HienThiVanChuyen", obj);
        if (ds.Tables[0].Rows.Count > 0)
        {
            //goi ham de nap du lieu vao dropdownlist
            SupportDb.BindFromDataSetToCombo(ds, DrpVanChuyen, "IDVanChuyen", "TenVanChuyen");

        }
    }
    void HienthiThanhToan()
    {
        object[] obj = new object[0];
        DataSet ds1 = new DataSet();
        ds1 = SupportDb.ReturnDataSet("HienThiThanhToan", obj);
        if (ds1.Tables[0].Rows.Count > 0)
        {
            //goi ham de nap du lieu vao dropdownlist
            SupportDb.BindFromDataSetToCombo(ds1, DrpThanhToan, "IDThanhToan", "TenThanhToan");

        }
    }
    Double Tongtien()
    {
        Double s = 0;
        DataTable objDT = (DataTable)Session["Cart"];
        for (int i = 0; i < objDT.Rows.Count; i++)
            s += (Double)objDT.Rows[i]["ThanhTien"];
        return s;
    }
    protected void dgcart_DeleteCommand(object source, DataGridCommandEventArgs e)
    {
        DataTable objDT = (DataTable)Session["Cart"];
        objDT.Rows[e.Item.ItemIndex].Delete();
        Session["Cart"] = objDT;
        HienThi();
        Response.Redirect("GioHang.aspx");
    }
    protected void dgcart_EditCommand(object source, DataGridCommandEventArgs e)
    {
        dgcart.EditItemIndex = e.Item.ItemIndex;
        HienThi();
    }

    protected void dgcart_UpdateCommand(object source, DataGridCommandEventArgs e)
    {
        try
        {
            TextBox x = (TextBox)e.Item.Cells[6].Controls[0];
             DataSet ds = new DataSet();
            objDT = (DataTable)Session["Cart"];
            object[] obj = new object[1];
            for(int i=0;i<objDT.Rows.Count;i++)
            {
                obj[0] = objDT.Rows[i]["IDSanPham"];
            }
            ds = SupportDb.ReturnDataSet("KiemTraSoLuong", obj);
            DataRow dr = ds.Tables[0].Rows[0];
            if (Int32.Parse(x.Text) > (Int32)dr[0])
            {
                Response.Write("<script>alert('Số lượng hàng không đủ!')</script>");
            }
            else
            {
                Int32 sl = Int32.Parse(x.Text);
                int maso = (int)e.Item.ItemIndex;
                objDT = (DataTable)Session["Cart"];
                objDT.Rows[maso]["SoLuong"] = sl;
                objDT.Rows[maso]["ThanhTien"] = sl * (Double)objDT.Rows[maso]["DonGia"];
                dgcart.EditItemIndex = -1;
                Session["Cart"] = objDT;
                HienThi();
                Response.Redirect("GioHang.aspx");
            }
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Có lỗi, vui lòng thủ lại!')</script>");
        }
    }
    protected void btMuatiep_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void btThanhtoan_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["TenDangNhap"] != null)
        {
            Session["VanChuyen"] = DrpVanChuyen.SelectedItem;
            Session["IDVanChuyen"] = DrpVanChuyen.SelectedValue;
            Session["ThanhToan"] = DrpThanhToan.SelectedItem;
            Session["IDThanhToan"] = DrpThanhToan.SelectedValue;
            Response.Redirect("DonDatHang.aspx");
        }
        else Response.Write("<script>alert('Vui lòng đăng nhập trước khi thực hiện việc đặt hàng!');</script>");
    }
}