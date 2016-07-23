using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

public partial class Addpair : System.Web.UI.Page
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
                getmentor();
                search();
                searchpair();
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        int id = Convert.ToInt32(btn.CommandArgument.ToString());
        try
        {
            MySqlCommand _cmd = new MySqlCommand("insert into assign_mentor_mentee(mentor_id,mentee_id,created_by,edited_by,created_date,edited_Date) values(" + Request.Cookies["mentorpair"].Value + "," + id + "," + Request.Cookies["userid"].Value + "," + Request.Cookies["userid"].Value + ",now(),now())", _con);
            _con.Open();
            _cmd.ExecuteNonQuery();
            _con.Close();
            Response.Redirect("Addpair.aspx");
        }
        catch(Exception ex)
        {
            Response.Write(ex.ToString());
        }
        

    }
    protected void getmentor() {
        String tablename = "";
        try
        {
            tablename = "select * from mentor where mentor_id =" + Request.Cookies["mentorpair"].Value + "";

            MySqlCommand _cmd = new MySqlCommand(tablename, _con);
            MySqlDataAdapter _adp = new MySqlDataAdapter(_cmd);
            DataTable _dt = new DataTable();
            _adp.Fill(_dt);
            mentorname.InnerText = "Assign Mentee To " + _dt.Rows[0][0].ToString();
            location.InnerText = "Location " + _dt.Rows[0][7].ToString();
        }
        catch (Exception ex) {
           // Response.Write(tablename);
        }
    }
    protected void searchpair()
    {
        string tablename = "select CONCAT(fname,' ',sname) as name,mobileno,organization,emailid,m.mentee_id,am.assign_id  "
 +" from mentee m inner join assign_mentor_mentee am "
+" on m.mentee_id=am.mentee_id "
+ " where mentor_id=" + Request.Cookies["mentorpair"].Value + " and am.stat=1 ";
        MySqlCommand _cmd = new MySqlCommand(tablename, _con);
        MySqlDataAdapter _adp = new MySqlDataAdapter(_cmd);
        DataTable _dt = new DataTable();
        _adp.Fill(_dt);
        GridView1.DataSource = _dt;
        GridView1.DataBind();
    }
    protected void search()
    {
        string tablename = "select CONCAT(fname,' ',sname) as name,mobileno,organization,emailid,mentee_id "
+" from mentee "
+" where mentee_id not in (select mentee_id "
+" from assign_mentor_mentee "
+" where stat=1 "
+" ) and fname like '%" + txtsearch.Text + "%'";
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
        
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        int id = Convert.ToInt32(btn.CommandArgument.ToString());
        try
        {
            MySqlCommand _cmd = new MySqlCommand("update assign_mentor_mentee set stat=0 where assign_id=" + id + " ", _con);
            _con.Open();
            _cmd.ExecuteNonQuery();
            _con.Close();
            Response.Redirect("Addpair.aspx");
        }
        catch
        {

        }
        

    }
}