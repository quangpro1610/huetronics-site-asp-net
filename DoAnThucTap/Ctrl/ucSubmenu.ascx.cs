using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Huetronics;
public partial class Ctrl_ucSubmenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateCountry();
    }
    private void PopulateCountry()
    {
        DataTable dtb = GetCategory(@"Select IDDanhMuc, TenDanhMuc From tbl_DanhMuc");
        DataTable dtb2;
        DataRow drRow;
        for (int i = 0; i < dtb.Rows.Count; i++)
        {
            AjaxControlToolkit.AccordionPane accp = new AjaxControlToolkit.AccordionPane();
            drRow = dtb.Rows[i];
            Label lblHeader = new Label();
            lblHeader.ID = "lblHead" + i.ToString();
            lblHeader.Text = "<a href='#'>" + drRow["TenDanhMuc"].ToString() + "</a>";
            dtb2 = GetCategory(@"Select IDLoai, TenLoai From tbl_Loai  
                Where IDDanhMuc=" + drRow["IDDanhMuc"].ToString());
            Label lblContent = new Label();
            lblContent.ID = "lblContent" + i.ToString();
            lblContent.Text = "";
            accp.ID = "accp" + i.ToString();
            foreach (DataRow dr in dtb2.Rows)
            {
                lblContent.Text += "<a href='SanPham.aspx?TenLoai=" + dr["TenLoai"] + "'>" + dr["TenLoai"].ToString() + "</a><br>";
            }
            accp.HeaderContainer.Controls.Add(lblHeader);
            accp.ContentContainer.Controls.Add(lblContent);
            Accordion1.Panes.Add(accp);
        }
    }

    private DataTable GetCategory(string sqlQuery)
    {
        DataTable dtbTmp = new DataTable();
        string connString = @"Server =QUANG-PC;Initial Catalog=Huetronics;
            User ID=sa;Password=123";
        SqlConnection conn = new SqlConnection(connString);
        try
        {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(sqlQuery, conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "Category");
            dtbTmp = ds.Tables[0];
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
        }
        finally
        {
            conn.Close();
        }
        return dtbTmp;
    }
}