<%@ Application Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    string s;
    int sltructuyen = 0;
    SqlDataSource ds = new SqlDataSource();
    public void Edit_DataList(DataList d, string s)
    {
        ds.ConnectionString = ConfigurationManager.AppSettings["constr"];
        ds.SelectCommand = s;
        d.DataSource = ds;
        d.DataBind();
    }

    public DataRow DR(string s)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["constr"]);
        SqlDataAdapter dad = new SqlDataAdapter(s, con);
        DataSet ds = new DataSet();
        dad.Fill(ds);
        return ds.Tables[0].Rows[0];
    }

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        Application.Lock();
        System.IO.StreamReader sr;
        sr = new System.IO.StreamReader(Server.MapPath("App_Data/sltc.txt"));
        s = sr.ReadLine();
        sr.Close();
        Application.UnLock();
        Application.Add("sltruycap", s);
        Application.Add("sltructuyen", sltructuyen);
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown
        Application.Contents["sltructuyen"] = 0;
    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started
        Application.Contents["sltruycap"] = int.Parse(Application.Contents["sltruycap"].ToString()) + 1;
        sltructuyen = int.Parse(Application.Contents["sltructuyen"].ToString()) + 1;
        System.IO.StreamWriter sw;
        sw = new System.IO.StreamWriter(Server.MapPath("App_Data/sltc.txt"));
        sw.Write(Application.Contents["sltruycap"].ToString());
        Application.Contents["sltructuyen"] = sltructuyen;
        sw.Close();
    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        sltructuyen = int.Parse(Application.Contents["sltructuyen"].ToString()) - 1;
        Application.Contents["sltructuyen"] = sltructuyen;
    }
       
</script>
