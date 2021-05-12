using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Ctrl_ucSlide : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ltlConTent.Text = LoadData();
    }
    private string LoadData()
    {
        string strHTML = "";
        int i = 1, j = 1;
        strHTML += "<div id=\"featured\">";
        DataTable dtb = QueryToDataTable("Select Top 5 TenSanPham, Anh, NoiDung, TomTat tbl_SanPham order by IDSanPham desc");
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
                         <a style='color: rgb(255, 255, 255);' href='#'>
                            <img  src='" + dr2["Anh"] + @"'/> 
                         </a>
                        <div class='info'> 
                            <h2><a href='#'>" + dr2["TenSanPham"] + @"</a></h2> 
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