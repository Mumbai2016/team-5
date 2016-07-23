using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

public partial class AddMentee : System.Web.UI.Page
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
                if (Request.Cookies["mentee"].Value == "0")
                {

                }
                else
                {
                    Button1.Text = "Update mentee";
                    viewdata();
                }

            }
        }
    }

    protected void viewdata()
    {
        txtpasswd.Enabled = false;
        txtemailid.Enabled = false;
        MySqlCommand _cmd = new MySqlCommand("select * from mentee where mentee_id=" + Request.Cookies["mentee"].Value + "", _con);
        MySqlDataAdapter _da = new MySqlDataAdapter(_cmd);
        DataTable _dt = new DataTable();
        _da.Fill(_dt);

        txtname.Text = _dt.Rows[0][1].ToString();
        txtlastname.Text = _dt.Rows[0][2].ToString();
        txtaddress.Text = _dt.Rows[0][3].ToString();
        example1.Value = _dt.Rows[0][4].ToString();
        txtincome.Text = _dt.Rows[0][5].ToString();
        txtmobile.Text = _dt.Rows[0][6].ToString();
        txtemailid.Text = _dt.Rows[0][8].ToString();
        txtorg.Text = _dt.Rows[0][7].ToString();
        txtpasswd.Text = _dt.Rows[0][9].ToString();
        
        
        
        
    }
    Date_Convert d = new Date_Convert();
    protected void Button1_Click(object sender, EventArgs e)
    {
        string error = "";
        string emailid = "", passw = "", fname = "", lname = "", org = "", dob = "", address = "", password = "", mobileno = "";
        double income = 0;

        if (txtname.Text != "")
        {
            fname = txtname.Text.Trim().ToUpper();
        }
        else
        {
            error += "First Name must be defined <br>";
        }


        if (txtlastname.Text != "")
        {
            lname = txtlastname.Text.Trim().ToUpper();
        }
        else
        {
            error += "Last Name must be defined <br>";
        }


        if (example1.Value != "")
        {
            dob = d.datecon(example1.Value.Trim());
        }
        else
        {
            error += "Middle Name must be defined <br>";
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


        if (txtaddress.Text != "")
        {
            address = txtaddress.Text.Trim();
        }
        else
        {
            error += "Address must be defined <br>";
        }

        if (txtmobile.Text != "")
        {
            mobileno = txtmobile.Text.Trim();
        }
        else
        {
            error += "Address must be defined <br>";
        }

        if (txtincome.Text != "")
        {
            try
            {
                income = Convert.ToDouble(txtincome.Text.Trim());
            }
            catch
            {
                error += "Income  must be number";
            }
        }
        else
        {
            error += "Income must be defined <br>";
        }
        
        if (txtorg.Text != "")
        {
            try
            {
                org = txtorg.Text.Trim();
            }
            catch
            {
                error += "Orgnaization must be number";
            }
        }
        else
        {
            error += "Organization must be defined <br>";
        }

        if (error == "")
        {
            MySqlCommand _cmd = new MySqlCommand("registermentee", _con);
            _cmd.CommandType = CommandType.StoredProcedure;

            _cmd.Parameters.AddWithValue("@fname1", fname);
            _cmd.Parameters.AddWithValue("@sname1", lname);
            _cmd.Parameters.AddWithValue("@dob1", dob);
            _cmd.Parameters.AddWithValue("@emailid1", emailid);
            _cmd.Parameters.AddWithValue("@passwd", passw);
            _cmd.Parameters.AddWithValue("@address1", address);
            _cmd.Parameters.AddWithValue("@mob", mobileno);
            _cmd.Parameters.AddWithValue("@org", org);
            _cmd.Parameters.AddWithValue("@income", income);
            _cmd.Parameters.AddWithValue("@stat", Convert.ToInt32(Request.Cookies["mentee"].Value));


            _con.Open();
            _cmd.ExecuteNonQuery();
            _con.Close();
            Response.Redirect("ViewMentee.aspx");
        }
        else
        {
            erro.InnerHtml = error;
        }
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
       
    }
}