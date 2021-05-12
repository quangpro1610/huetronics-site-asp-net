using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Huetronics;
using System.Text;
public partial class Default2 : System.Web.UI.Page
{
    DataTable objDT;
    DataRow objDR;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            HienThi();
    }
    void HienThi()
    {
        objDR = (DataRow)Session["DR"];
        Image1.ImageUrl =  "~/" + (String)objDR["Anh"];
        lblTensanpham.Text = (String)objDR["TenSanPham"];
        lblChitiet.Text = (String)objDR["ChiTiet"];
        lblSoluong.Text = ((Int32)objDR["SoLuong"]).ToString() + " Bộ";
        lblDongia.Text = ((Double)objDR["DonGia"]).ToString("0,0") + " VNĐ";
        txtSoluongmua.Focus();
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
            if (Int32.Parse(txtSoluongmua.Text.ToString()) > lblSoluong.Text.Length)
            {
                StringBuilder strsl1 = new StringBuilder();
                strsl1.Append("<script type=Text/Javascript>");
                strsl1.AppendFormat("alert('Số lượng không đủ!')");
                strsl1.Append("</script>");
                lblThongbao.Text = strsl1.ToString();

            }
            else
            {
                objDR = objDT.NewRow();
                objDR["TenSanPham"] = (string)x["TenSanPham"];
                objDR["Anh"] = (string)x["Anh"];
                objDR["DonGia"] = (Double)x["DonGia"];
                objDR["SoLuong"] = Int32.Parse(txtSoluongmua.Text);
                objDR["ThanhTien"] = Int32.Parse(txtSoluongmua.Text) + (Double)x["DonGia"];
                objDT.Rows.Add(objDR);

            }
            Session["Cart"] = objDT;

        }
    }
    protected void btAdd_Click(object sender, ImageClickEventArgs e)
    {
        if (lblSoluong.Text == "0")
        {
            StringBuilder strhethang = new StringBuilder();
            strhethang.Append("<script type=Text/Javascript>");
            strhethang.AppendFormat("alert('Tạm hết hàng!')");
            strhethang.Append("</script>");
            lblThongbao.Text = strhethang.ToString();
        }
        else
        {
            if (Int32.Parse(txtSoluongmua.Text.ToString()) > lblSoluong.Text.Length)
            {
                StringBuilder strsl = new StringBuilder();
                strsl.Append("<script type=Text/Javascript>");
                strsl.AppendFormat("alert('Số lượng không đủ!')");
                strsl.Append("</script>");
                lblThongbao.Text = strsl.ToString();
            }
            else
            {
                objDR = (DataRow)Session["DR"];
                Themhangvaogio(objDR);
                Response.Redirect("ChiTietSP.aspx");
            }
        }
    }
    protected void btBack_Click(object sender, ImageClickEventArgs e)
    {
        string url = "Default.aspx";
        Response.Redirect(url);
    }
}