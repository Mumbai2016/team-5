using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

public partial class ViewAdmin : System.Web.UI.Page
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
        Response.Cookies["admin"].Value = "" + id;
        Response.Redirect("AddAdmin.aspx");

    }

    protected void search()
    {
        string tablename = "select * from admin where name like '%" + txtsearch.Text + "%'";
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
        Response.Cookies["admin"].Value = "0";
        Response.Redirect("AddAdmin.aspx");

    }
}