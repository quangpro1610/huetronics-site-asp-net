using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class MasterPage : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        lblTongsosp.Text = SoLuong().ToString();
        lblTongtien.Text = TongTien().ToString("0,0") + " VNĐ";
        ltlSlide.Text = LoadData();
        if (Session["HoTen"] != null)
        {
            btbar.Visible = false;
        }
        else
        {
            btbar.Visible = true;
        }
    }
    protected void btnSamsung_Click(object sender, ImageClickEventArgs e)
    {
        Session["TenNSX"] = "Samsung";
        Response.Redirect("HienThiTheoNSX.aspx?TenNSX="+Session["TenNSX"]+"");
    }
    protected void btLg_Click(object sender, ImageClickEventArgs e)
    {
        Session["TenNSX"] = "LG";
        Response.Redirect("HienThiTheoNSX.aspx?TenNSX=" + Session["TenNSX"] + "");
    }
    protected void btnHuetronic_Click(object sender, ImageClickEventArgs e)
    {
        Session["TenNSX"] = "Huetronics";
        Response.Redirect("HienThiTheoNSX.aspx?TenNSX=" + Session["TenNSX"] + "");
    }
    protected void btFind_Click(object sender, ImageClickEventArgs e)
    {
        if (txtFind.Text == null)
        {
            Response.Write("<script>alert('Nhập từ khóa cần tìm!');</script>");
        }
        else
        {
            Response.Redirect("Search.aspx?TenSP=" + txtFind.Text);
        }
    }
    protected void btnCart_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("GioHang.aspx");
    }
    Double SoLuong()
    {
        Double sl = 0;
        DataTable objDT = (DataTable)Session["Cart"];
        for (int i = 0; i < objDT.Rows.Count; i++)
            sl += (Int32)objDT.Rows[i]["SoLuong"];
        return sl;

    }
    Double TongTien()
    {
        Double s = 0;
        DataTable objDT = (DataTable)Session["Cart"];
        for (int i = 0; i < objDT.Rows.Count; i++)
            s += (Double)objDT.Rows[i]["ThanhTien"];
        return s;
    }
    private string LoadData()
    {
        string strHTML = "";
        int i = 1, j = 1;
        strHTML += "<div id=\"featured\">";
        DataTable dtb = QueryToDataTable("Select Top 5 TenSanPham, Anh, ChiTiet, DonGia From tbl_SanPham order by IDSanPham asc");
        if (dtb.Rows.Count > 0)
        {
            strHTML += "<ul class='ui-tabs-nav'>";
            //Phần liệt kê ảnh bên phải
            foreach (DataRow dr in dtb.Rows)
            {
                strHTML += @"
                <li class='ui-tabs-nav-item' id='nav-fragment-" + j.ToString() + @"'> 
                     <a href='#fragment-" + j.ToString() + @"'> 
                         <img src='" + dr["Anh"] + @"'/> 
                         <span>" + dr["TenSanPham"] + @"</span> 
                     </a>
                </li>";
                j++;
            }
            strHTML += @"
                </ul>";
            //Phần hiển thị ảnh lớn bên trái
            foreach (DataRow dr2 in dtb.Rows)
            {
                strHTML += @"
                    <div id='fragment-" + i.ToString() + @"' class='ui-tabs-panel ui-tabs-hide'> 
                         <a style='color: rgb(255, 255, 255);' href='link bai viet 1'>
                            <img src='" +dr2["Anh"] + @"'/> 
                         </a>
                        <div class='info'> 
                            <h2><a href='Default.aspx?IDSanPham='>" + dr2["ChiTiet"] + "<br>Giá: " + dr2["DonGia"] + " VNĐ" + @"</a></h2> 
                             <p></p>
                        </div>
                    </div>";
                i++;
            }
        }
        strHTML += "</div>";
        return strHTML;
    }

    //Viet ham truy van du lieu tra ve DataTable
    private DataTable QueryToDataTable(string strSQL)
    {
        DataTable dtbTmp = new DataTable();
        string connString = @"Server =QUANG-PC;Initial Catalog=Huetronics;User ID=sa;Password=123";
        SqlConnection conn = new SqlConnection(connString);
        try
        {
            conn.Open(); // Mở kết nối
            SqlDataAdapter da = new SqlDataAdapter(strSQL, conn); // Tạo một Adapter
            DataSet ds = new DataSet();// Tạo DataSet
            da.Fill(ds, "GetData");// Đổ dữ liệu DataSet
            dtbTmp = ds.Tables[0];// Tạo DataTable từ dataSet
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);// Bắt lỗi
        }
        finally
        {
            conn.Close();// Đóng kết nối
        }
        return dtbTmp;
    }
}

