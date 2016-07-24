using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Date_Convert
/// </summary>
public class Date_Convert
{
	public Date_Convert()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string datecon(string olddate)
    {
        string newdate = "";
        string[] dt = olddate.Split('-');
        newdate = dt[2] + "-" + dt[1] + "-" + dt[0];
        return newdate;

    }
}