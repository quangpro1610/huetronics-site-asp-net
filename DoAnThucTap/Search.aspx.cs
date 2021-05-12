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
    DataRow objDR;
    ASP.global_asax m = new ASP.global_asax();
    protected void Page_Load(object sender, EventArgs e)
    {
        Title = "Tìm kiếm";
        Session["TenNSX"] = "";
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["TenSP"] != null)
            {
                string tukhoa = Request.QueryString["TenSP"].ToString();
                object[] obj = new object[1];
                obj[0] = tukhoa;
                DataSet ds = new DataSet();
                ds = SupportDb.ReturnDataSet("TimTheoTenSP", obj);
                DataList1.DataSource = ds;
                DataList1.DataBind();
                string str = (string)Session["TenNSX"];
                if (str == "")
                    m.Edit_DataList(DataList1, "TimTheoTenSP N'" + tukhoa + "' ");
                else m.Edit_DataList(DataList1, "HienThiSanPhamTheoNSX" + str + "");
            }
        }
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.Equals("lnkbtnNSX"))
        {
            Session["TenNSX"] = e.CommandArgument.ToString();
            if ((string)Session["TenNSX"] == "")
                m.Edit_DataList(DataList1, "HienThiTatCaSanPham");
            else m.Edit_DataList(DataList1, "HienThiSanPhamTheoNSX " + (string)Session["TenNSX"] + "");
        }
    }
    void Themhangvaogio(DataRow x)
    {
        objDT = (DataTable)Session["Cart"];
        bool themmoi = true;
        for (int i = 0; i < objDT.Rows.Count; i++)
            if ((String)objDT.Rows[i]["TenSanPham"] == (String)x["TenSanPham"])
            {
                objDT.Rows[i]["SoLuong"] = (Int32)objDT.Rows[i]["SoLuong"] + 1;//
                objDT.Rows[i]["ThanhTien"] = (Int32)objDT.Rows[i]["SoLuong"] * (Double)objDT.Rows[i]["DonGia"];
                themmoi = false;
                Session["SoLuong"] = (Int32)objDT.Rows[i]["SoLuong"];
            }
        if (themmoi == true)
        {
            objDR = objDT.NewRow();
            //objDR["TenSanPham"] = (string)x["TenSanPham"];
            objDR["TenSanPham"] = (string)x["TenSanPham"];
            objDR["Anh"] = (string)x["Anh"];
            objDR["DonGia"] = (Double)x["DonGia"];
            objDR["SoLuong"] = 1;//
            objDR["ThanhTien"] = (Double)x["DonGia"];//
            //objDR["ThanhTien"] = (Double)x["ThanhTien"];
            objDT.Rows.Add(objDR);//

        }
    }
    protected void bt_ChiTiet_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton x = (ImageButton)sender;
        objDR = m.DR("select * from tbl_SanPham where IDSanPham=" + x.CommandArgument.ToString());
        Session["DR"] = objDR;  // biến DR lưu một bản ghi của bảng SanPham
        Response.Redirect("ChiTietSP.aspx");
    }
    protected void bt_ThemGio_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton x = (ImageButton)sender;
        DataSet ds = new DataSet();
        object[] obj = new object[1];
        obj[0] = x.CommandArgument;
        ds = SupportDb.ReturnDataSet("KiemTraSoLuong", obj);
        DataRow dr = ds.Tables[0].Rows[0];
        if ((Int32)dr[0] == 0)
        {
            lblThongbao.Text = "Đã hết hàng!";
        }
        else
        {
            objDR = m.DR("select * from tbl_SanPham where IDSanPham=" + x.CommandArgument.ToString());
            Session["IDSanPham"] = x.CommandArgument.ToString();
            Themhangvaogio(objDR);
            Response.Redirect("HienThiTheoNSX.aspx");
        }
    }
}