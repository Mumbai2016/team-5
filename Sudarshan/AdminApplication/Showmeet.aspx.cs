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

public partial class Showmeet : System.Web.UI.Page
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
                for (int i = 2016; i < 2030; i++)
                {
                    ddlyear.Items.Insert(count, i + "");
                }
                //search();
            }
        }
    }



    protected void search()
    {
        string tablename = "SELECT m.meet_date,m.meet_place,m.meet_time,CONCAT(mn.fname,' ',mn.sname) as mentor,concat(me.fname,' ',me.sname) as mentee "
+ " from mentee_notification_accept m INNER JOIN mentor mn "
+ " on m.mentor_id=mn.mentor_id "
+ " inner join mentee me "
+ " on m.mentee_id=me.mentee_id where m.accept=1";

        if (ddlmonth.SelectedIndex > 0)
        {
            tablename += "and MONTH(m.meet_date)=" + ddlmonth.SelectedIndex.ToString() + " ";
        }
        if (ddlyear.SelectedIndex > 0)
        {
            tablename += " and YEAR(m.meet_date)=" + ddlyear.SelectedIndex.ToString() + " ";
        }
        tablename += " order by m.meet_date desc";
        MySqlCommand _cmd = new MySqlCommand(tablename, _con);
        MySqlDataAdapter _adp = new MySqlDataAdapter(_cmd);
        DataTable _dt = new DataTable();
        _adp.Fill(_dt);
        gvcust.DataSource = _dt;
        gvcust.DataBind();
        
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        search();
    }

}