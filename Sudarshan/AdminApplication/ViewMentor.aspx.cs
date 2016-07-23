using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

public partial class ViewMentor : System.Web.UI.Page
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
               search();
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        int id = Convert.ToInt32(btn.CommandArgument.ToString());
        Response.Cookies["mentor"].Value = "" + id;
        Response.Redirect("AddMentor.aspx");

    }

    protected void search()
    {
        string tablename = "select CONCAT(fname,' ',sname) as name,email,mob,mentor_id from mentor where fname like '%" + txtsearch.Text + "%'";
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

    protected void btnadd_Click(object sender, EventArgs e)
    {
        Response.Cookies["mentor"].Value = "0";
        Response.Redirect("AddMentor.aspx");

    }
}