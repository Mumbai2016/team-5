using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

public partial class AddAdmin : System.Web.UI.Page
{
    MySqlConnection _con = new MySqlConnection(ConfigurationManager.ConnectionStrings["katalyst"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["userid"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["admin"].Value == "0")
                {

                }
                else
                {
                    Button1.Text = "Update Admin";
                    viewdata();
                }

            }
        }
    }

    protected void viewdata()
    {
        txtpasswd.Enabled = false;
        txtemailid.Enabled = false;
        MySqlCommand _cmd = new MySqlCommand("select * from Admin where aid=" + Request.Cookies["admin"].Value + "", _con);
        MySqlDataAdapter _da = new MySqlDataAdapter(_cmd);
        DataTable _dt = new DataTable();
        _da.Fill(_dt);

        txtname.Text = _dt.Rows[0][1].ToString();
        txtemailid.Text = _dt.Rows[0][2].ToString();
        txtpasswd.Text = _dt.Rows[0][3].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         string error = "";
        string empname = "", emailid = "", passw = "";

        if (txtname.Text != "")
        {
            empname = txtname.Text.Trim().ToUpper();
        }
        else
        {
            error += "Name must be defined <br>";
        }

        if (txtemailid.Text != "")
        {
            emailid = txtemailid.Text.Trim();
        }
        else
        {
            error += "Emailid must be defined <br>";
        }



        if (txtpasswd.Text != "")
        {
            passw = txtpasswd.Text.Trim();
        }
        else
        {
            error += "Password must be defined <br>";
        }




        if (error == "")
        {
            MySqlCommand _cmd = new MySqlCommand("registeradmin", _con);
            _cmd.CommandType = CommandType.StoredProcedure;

            _cmd.Parameters.AddWithValue("@name1", empname);
            _cmd.Parameters.AddWithValue("@email1", emailid);

            _cmd.Parameters.AddWithValue("@pass", passw);
            _cmd.Parameters.AddWithValue("@stat", Convert.ToInt32(Request.Cookies["admin"].Value));


            _con.Open();
            _cmd.ExecuteNonQuery();
            _con.Close();
            Response.Redirect("ViewAdmin.aspx");
        }
        else
        {
            erro.InnerHtml = error;
        }
    }

    
}