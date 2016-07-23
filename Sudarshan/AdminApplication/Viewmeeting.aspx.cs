using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
using System.Data.OleDb;
using System.IO;
using System.Text;
using ClosedXML.Excel;

public partial class Viewmeeting : System.Web.UI.Page
{
    MySqlConnection _con = new MySqlConnection(ConfigurationManager.ConnectionStrings["katalyst"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["userid"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                ddlyear.Items.Insert(0, "Selct Year");
                int count = 1;
                for (int i = 2016; i < 2030; i++) {
                    ddlyear.Items.Insert(count,i + "");
                }
                    search();
            }
        }
    }

    

    protected void search()
    {
        string tablename = "SELECT m.meet_date,m.meet_place,m.meet_time,CONCAT(mn.fname,' ',mn.sname) as mentor,concat(me.fname,' ',me.sname) as mentee "
+" from mentee_notification_accept m INNER JOIN mentor mn "
+" on m.mentor_id=mn.mentor_id "
+" inner join mentee me "
+ " on m.mentee_id=me.mentee_id where m.accept=1 ";
        
        if (ddlmonth.SelectedIndex > 0) {
            tablename += "and MONTH(m.meet_date)="+ddlmonth.SelectedIndex.ToString()+" ";
        }
        if (ddlyear.SelectedIndex > 0)
        {
            tablename += " and YEAR(m.meet_date)="+ddlyear.SelectedIndex.ToString()+" ";
        }
        tablename += " order by m.meet_date desc";
        MySqlCommand _cmd = new MySqlCommand(tablename, _con);
        MySqlDataAdapter _adp = new MySqlDataAdapter(_cmd);
        DataTable _dt = new DataTable();
        _adp.Fill(_dt);
        gvcust.DataSource = _dt;
        gvcust.DataBind();
        sendExcel(_dt, "Meetings");
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        search();
    }

    protected void sendExcel(DataTable dt, String filename)
    {


        dt.TableName = "GridView_Data";
        if (dt.Rows.Count == 0)
        {
            return;
        }

        XLWorkbook wb = new XLWorkbook();
        wb.Worksheets.Add(dt);
        wb.SaveAs(Server.MapPath(("Files/" + filename + ".xlsx")));
        string fName = Server.MapPath("Files/" + filename + ".xlsx");
        FileInfo fi = new FileInfo(fName);
        long sz = fi.Length;

        Response.ClearContent();
        Response.ContentType = MimeType(Path.GetExtension(fName));
        Response.AddHeader("Content-Disposition", string.Format("attachment; filename = {0}", System.IO.Path.GetFileName(fName)));
        Response.AddHeader("Content-Length", sz.ToString("F0"));
        Response.TransmitFile(fName);
        Response.End();

    }

    public static string MimeType(string Extension)
    {
        string mime = "application/octetstream";
        if (string.IsNullOrEmpty(Extension))
            return mime;
        string ext = Extension.ToLower();
        Microsoft.Win32.RegistryKey rk = Microsoft.Win32.Registry.ClassesRoot.OpenSubKey(ext);
        if (rk != null && rk.GetValue("Content Type") != null)
            mime = rk.GetValue("Content Type").ToString();
        return mime;
    } 
}