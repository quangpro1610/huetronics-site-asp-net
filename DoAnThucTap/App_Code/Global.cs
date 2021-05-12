using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Global
/// </summary>
/// 
public static  class Global
{
    static int _currentpage;

    public static int Currentpage
    {
        get { return Global._currentpage; }
        set { Global._currentpage = value; }
    }

}