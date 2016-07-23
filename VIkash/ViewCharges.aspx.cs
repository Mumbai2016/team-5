using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

public partial class ViewCharges : System.Web.UI.Page
{
    static string connection = ConfigurationManager.ConnectionStrings["account"].ConnectionString;
    MySqlConnection _con = new MySqlConnection(connection);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["userid"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                search();
            }

        }
    }

    protected void search()
    {
        String query = "select * from tax_rate where pincode like '%" + txtsearch.Text + "%'";
        
        MySqlCommand _cmd = new MySqlCommand(query, _con);
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
        Response.Cookies["tax"].Value = "0";
        Response.Redirect("AddCharge.aspx");

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        int id = Convert.ToInt32(btn.CommandArgument);
        Response.Cookies["tax"].Value = "" + id;
        Response.Redirect("AddCharge.aspx");

    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvcust.PageIndex = e.NewPageIndex;
        search();

    }
}