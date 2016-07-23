using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;


public partial class login : System.Web.UI.Page
{
    MySqlConnection _con = new MySqlConnection(ConfigurationManager.ConnectionStrings["katalyst"].ConnectionString);  
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        string user = "", pass = "";
        int flag = 0;
        if (ulogin.Value == "")
        {
            flag = 1;
        }
        else
        {
            user = ulogin.Value;
        }

        if (plogin.Value == "")
        {
            flag = 1;
        }
        else
        {
            pass = plogin.Value;
        }

        if (flag == 0)
        {

            //if (user.Equals("sudarshan") && pass.Equals("sudarshan"))
            //{
            //    Response.Cookies["userid"].Value = 1+"";
            //    Response.Redirect("Dashboard.aspx");
            
            //}
            //else
            //{
            //    Label1.Text = "Incorrect Credentials";
            //}
            //For lOGIN WITH DATABASE

            
            try
            {
                MySqlCommand _cmd = new MySqlCommand("select fkid from user_detail where username ='"+user+"' AND password like '"+pass+"' ", _con);
                
                
                MySqlDataAdapter _da = new MySqlDataAdapter(_cmd);
                DataTable _dt = new DataTable();
                _da.Fill(_dt);
                if (_dt.Rows.Count > 0)
                {
                    Response.Cookies["userid"].Value = _dt.Rows[0][0].ToString();
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    Label1.Text = "Incorrect Credentials";
                }
            }
            catch(Exception ex)
            {
                Label1.Text = ex.ToString();
                //Label1.Text = "Incorrect Data Or username may not exist. . . .";
            }
             

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //Label1.Text = "Contact Developer Sudarshan Shinde <br>Call to 9821837934";
    }
}