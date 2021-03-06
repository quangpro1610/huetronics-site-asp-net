using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;
using System.Security;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Web.Security;
using System.ComponentModel;
namespace Huetronics
{
	/// <summary>
	/// Summary description for SupportDb1.
    /// IT Department Hue Industrial College
	/// </summary>
	public class SupportDb
	{
		
		public SupportDb()
		{			
		}		
		public static void ExecuteProcdure(string p_sproc,params object[] p_obj)				
		{
            string connection = ConfigurationManager.AppSettings["constr"].ToString(); 
			SqlConnection sqlConnection=new SqlConnection();

			SqlCommand sqlCommand = new SqlCommand();
			sqlCommand.CommandText= getSql(p_sproc,p_obj);
			sqlCommand.CommandType=CommandType.Text;
			sqlConnection.ConnectionString=connection;
			sqlCommand.Connection=sqlConnection;			
			sqlConnection.Open();
			sqlCommand.ExecuteNonQuery();
			sqlConnection.Close();
		}				
		//trả về DataSet
		public static DataSet ReturnDataSet(string sp_sql,params object[] ds_thamso)
		{
            string connection = ConfigurationManager.AppSettings["constr"].ToString();
			SqlConnection sqlConnection=new SqlConnection();
			sqlConnection.ConnectionString=connection;
			sqlConnection.Open();

			SqlDataAdapter sqlDadap = new SqlDataAdapter(getSql(sp_sql, ds_thamso),sqlConnection); 			
			DataSet ds = new DataSet();
			sqlDadap.Fill(ds);
			sqlConnection.Close();			
			return ds;
		}	
		//Hiển thị số thự tự lên datagrid
		public static DataSet GetToSTT(DataSet ds, int bangthu)
		{
			int j;
			DataSet dset;
			dset=ds;
			for(j=1;j<=dset.Tables[bangthu].Rows.Count;j++)
			{
				if (j<10)
				{
					dset.Tables[bangthu].Rows[j-1][0]="0" + j.ToString();
				}
				else 
				{
					dset.Tables[bangthu].Rows[j-1][0]=j.ToString();
				}
			}			
			return dset;
		}	
		public static DataSet GetToSTT(DataSet ds, int bangthu,string tencot)
		{
			int j;
			DataSet dset;
			dset=ds;
			for(j=1;j<=dset.Tables[bangthu].Rows.Count;j++)
			{
				if (j<10)
				{
					dset.Tables[bangthu].Rows[j-1][tencot]="0" + j.ToString();
				}
				else 
				{
					dset.Tables[bangthu].Rows[j-1][tencot]=j.ToString();
				}
			}			
			return dset;
		}	
		public static string ReturnDate()
		{
			string strDate;
			object[] thu  = new object[7];
			thu[0]="Chủ nhật";
			thu[1]="Thứ hai";
			thu[2]="Thứ ba";
			thu[3]="Thứ tư";
			thu[4]="Thứ năm";
			thu[5]="Thứ sáu";
			thu[6]="Thứ bảy";
			
		
			strDate = thu[Convert.ToInt16(DateTime.Today.DayOfWeek)] .ToString() + " - " +
				(DateTime.Now.Day<10? "0"+Convert.ToString(DateTime.Now.Day):Convert.ToString(DateTime.Now.Day))+ "/" + 
				(DateTime.Now.Month<10? "0"+Convert.ToString(DateTime.Now.Month):Convert.ToString(DateTime.Now.Month))+  
				"/" + Convert.ToString(DateTime.Now.Year)  + ", " + DateTime.Now.ToShortTimeString();
			return strDate;
			
		}
		public string DateUpdate(string ChuoiNgay)
		{
			DateTime date;
			try
			{
				date= Convert.ToDateTime(ChuoiNgay);
				string ngay,thang,nam; 
				ngay=(date.Day<10?"0"+date.Day.ToString():date.Day.ToString());
				thang=(date.Month<10?"0"+date.Month.ToString():date.Month.ToString());
				nam=(date.Year<1000?"0"+(date.Year + 1000).ToString():date.Year.ToString());
				return ngay +"."+thang + "." + nam;
			}
			catch
			{
				return "";
			}
		}	
		public static void PositionItems(DropDownList drp,string valueItem)
		{
			int i,vitri=0;			
			for(i=0;i<drp.Items.Count;i++)
				if(drp.Items[i].Value.Trim()== valueItem.Trim())
				{
					vitri=i;
					i+=drp.Items.Count;
				}
			drp.SelectedIndex=vitri;			
		}
		public string LayThamSo(string Url,int Vitri)
		{
			string XuLyThamSo = Url;

			if(XuLyThamSo.StartsWith("/"))
				XuLyThamSo=XuLyThamSo.Remove(0,1);
			if(XuLyThamSo.EndsWith("/"))
				XuLyThamSo=XuLyThamSo.Remove(XuLyThamSo.Length-1,1);

			string[] CatChuoi = XuLyThamSo.Split('/');
			if(CatChuoi.Length > Vitri)
				return CatChuoi[Vitri].ToString();
			else
				return null;
		}
		public string TenThamSo(string sp_sql,string chuoixuly,string tentruong)
		{
			
			object[] thamso= new object[1];
			thamso[0]= chuoixuly;
			DataSet dset=ReturnDataSet(sp_sql,thamso);
			if(dset.Tables[0].Rows.Count<=0)
				return null;
			else
			{
				return dset.Tables[0].Rows[0][tentruong].ToString().Trim();
			}		

		}
		public static DataSet ReturnDataSet(string sp_sql,int page,int pagesize,params object[] ds_thamso)
		{
			string connection = ConfigurationManager.AppSettings["constr"].ToString();
			SqlConnection sqlConnection=new SqlConnection();
			sqlConnection.ConnectionString=connection;
			sqlConnection.Open();

			SqlDataAdapter sqlDadap = new SqlDataAdapter(getSql(sp_sql, ds_thamso),sqlConnection); 			
			DataSet ds = new DataSet();
			sqlDadap.Fill(ds,page,pagesize,"tblReturn");
			sqlConnection.Close();			
			return ds;
		}	
		public static SqlDataReader ExcuteProDataReader(string p_sproc,params object[] p_obj)
		{		
			string connection = ConfigurationManager.AppSettings["constr"].ToString();
			SqlConnection sqlConnection=new SqlConnection();
			sqlConnection.ConnectionString=connection;			

			SqlCommand sqlCmd = new SqlCommand();
			sqlCmd.Connection = sqlConnection;
			sqlConnection.Open();
			sqlCmd.CommandText=getSql(p_sproc,p_obj);

			SqlDataReader sqldread;
			try
			{
				sqldread= sqlCmd.ExecuteReader();
			}
			catch{
				sqldread=null;
			}
			sqlConnection.Close();
			return sqldread;
			
		}	
		public string ChuoiCanLay(string sql,object[] thamso,string tentruong)
		{
			DataSet dset = ReturnDataSet(sql,thamso);
			if(dset.Tables[0].Rows.Count>0)
				return dset.Tables[0].Rows[0][tentruong].ToString().Trim();
			else
				return null;
		}
		public static void BindFromDataSetToCombo(DataSet ds,DropDownList _drl,string _value, string _text)
		{
			foreach (DataRow dr in ds.Tables[0].Rows)
			{

				_drl.Items.Add(new ListItem(dr[_text].ToString(),dr[_value].ToString()));
			}
   
		}
		public bool IsNumber(string st)        
		{
			if (st.Equals("")) return false;
			for (int i=0; i<st.Length; i++)
				if (!Char.IsNumber(st,i))
					return false;
			return true;
			//			OleDbDataAdapter ap = new OleDbDataAdapter(
			//			ap.Fill(dset,
		}

		public string CatBoDuoiAspx(string ChuoiCanCat)
		{
			string ChuoiTam=null;
			ChuoiTam= ChuoiCanCat;
			if(ChuoiTam.EndsWith("/"))
				ChuoiTam = ChuoiTam.Substring(0,ChuoiTam.LastIndexOf('/'));
			if(ChuoiTam.EndsWith(".aspx"))
			{
				ChuoiTam = ChuoiTam.Substring(0,ChuoiTam.LastIndexOf('/')+1);
			}
			return ChuoiTam;
		}		
		// format sha1, md5-------
		public string EncodePassword(string strPassword,string strFormat)
		{
			if(strFormat==""){strFormat="MD5";}			
			return FormsAuthentication.HashPasswordForStoringInConfigFile(strPassword, strFormat);
		}
		//-----------------------------
        //public void ReturnStr(Telerik.WebControls.RadEditor rad,TextBox txt)
        //{
        //    string str= rad.Html;
        //    if(rad.Html!=null || rad.Html!="")
        //    {
        //        str=str.Replace("href","src");
        //        str=str.Remove(0,str.IndexOf("src="));
        //        str=str.Replace("src=","");
        //        if(str.IndexOf(" ")>0)
        //            str=str.Substring(0,str.IndexOf(" "));
        //        if(str.IndexOf(">")>0)
        //            str=str.Substring(0,str.IndexOf(">"));
        //        str=str.Replace("\"","");
        //        txt.Text=str;				
        //        rad.Editable=false;
        //    }			
        //}
		public static string getSql(string p_sproc, params object[] p_obj)
		{
			string sSql = "";
			for (int i = 0;i<p_obj.Length;i++)
			{
				switch(p_obj[i].GetType().ToString())
				{
					case "System.String": 
						sSql = sSql + ",N'" + p_obj[i] + "'";
						break;
					case "System.DateTime": 
						sSql =sSql + ",'" + p_obj[i] + "'";
						break;
					case "System.Boolean":
						if ((bool)p_obj[i]) 
							sSql=sSql + ",1";	
						else
							sSql=sSql + ",0";	
						break;
					case "System.Int16":
						sSql=sSql + "," + p_obj[i].ToString();
						break;
					case "System.Int32":
						sSql =sSql + "," + p_obj[i].ToString();
						break;
					case "System.Int64":
						sSql=sSql + "," + p_obj[i].ToString();
						break;
					case "System.Double":
						sSql=sSql + "," + p_obj[i].ToString();
						break;
					case "System.Byte": 
						sSql=sSql + "," + p_obj[i].ToString();
						break;
				}
			}
			
			if (sSql.Equals("")) 
				sSql =p_sproc ;
			else
				sSql =p_sproc + " " + sSql.Substring(1);
			
			return sSql;
		}
		public string ChuanHoaChuoiUrl(string strUrl)
		{
			string Url = strUrl.Trim().ToLower();
			
			Url=Url.Replace(" ","_");			
			Url=Url.Replace(" ","");			
			Url=Url.Replace(",","");
			Url=Url.Replace("/","");
			Url=Url.Replace("đ","d");
			//--- các chữ a,a'....
			Url=Url.Replace("á","a");
			Url=Url.Replace("à","a");
			Url=Url.Replace("ạ","a");
			Url=Url.Replace("ả","a");
			Url=Url.Replace("ã","a");
			//------- ắ
			Url=Url.Replace("ă","a");
			Url=Url.Replace("ắ","a");
			Url=Url.Replace("ằ","a");
			Url=Url.Replace("ặ","a");
			Url=Url.Replace("ẳ","a");
			Url=Url.Replace("ẵ","a");
			//------------ â -----------
			Url=Url.Replace("â","a");
			Url=Url.Replace("ấ","a");
			Url=Url.Replace("ầ","a");
			Url=Url.Replace("ậ","a");
			Url=Url.Replace("ẩ","a");
			Url=Url.Replace("ẫ","a");			
			//------------ ê -----------
			Url=Url.Replace("ê","e");
			Url=Url.Replace("ế","e");
			Url=Url.Replace("ề","e");
			Url=Url.Replace("ể","e");
			Url=Url.Replace("ễ","e");
			Url=Url.Replace("ệ","e");			
			//------------ ê -----------
			Url=Url.Replace("e","e");
			Url=Url.Replace("é","e");
			Url=Url.Replace("è","e");
			Url=Url.Replace("ẹ","e");
			Url=Url.Replace("ẻ","e");
			Url=Url.Replace("ẽ","e");				
			//------------ i -----------
			Url=Url.Replace("i","i");
			Url=Url.Replace("í","i");
			Url=Url.Replace("ì","i");
			Url=Url.Replace("ị","i");
			Url=Url.Replace("ỉ","i");
			Url=Url.Replace("ĩ","i");
			//------------ o -----------
			Url=Url.Replace("o","o");
			Url=Url.Replace("ó","o");
			Url=Url.Replace("ò","o");
			Url=Url.Replace("ọ","o");
			Url=Url.Replace("ỏ","o");
			Url=Url.Replace("õ","o");
			//------------ ô -----------
			Url=Url.Replace("ô","o");
			Url=Url.Replace("ố","o");
			Url=Url.Replace("ồ","o");
			Url=Url.Replace("ộ","o");
			Url=Url.Replace("ổ","o");
			Url=Url.Replace("ỗ","o");
			//------------ ô -----------
			Url=Url.Replace("ơ","o");
			Url=Url.Replace("ớ","o");
			Url=Url.Replace("ờ","o");
			Url=Url.Replace("ợ","o");
			Url=Url.Replace("ở","o");
			Url=Url.Replace("ỡ","o");
			//------------ o -----------
			Url=Url.Replace("u","u");
			Url=Url.Replace("ú","u");
			Url=Url.Replace("ù","u");
			Url=Url.Replace("ụ","u");
			Url=Url.Replace("ủ","u");
			Url=Url.Replace("ũ","u");
			//------------ ô -----------
			Url=Url.Replace("ư","u");
			Url=Url.Replace("ứ","u");
			Url=Url.Replace("ừ","u");
			Url=Url.Replace("ự","u");
			Url=Url.Replace("ử","u");
			Url=Url.Replace("ữ","u");
			//------------ ô -----------
			Url=Url.Replace("y","y");
			Url=Url.Replace("ý","y");
			Url=Url.Replace("ỳ","y");
			Url=Url.Replace("ỵ","y");
			Url=Url.Replace("ỷ","y");
			Url=Url.Replace("ỹ","y");			
			return Url;
		}
	}
}
