using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Configuration; 

public partial class AddCharge : System.Web.UI.Page
{
    MySqlConnection _con = new MySqlConnection(ConfigurationManager.ConnectionStrings["account"].ConnectionString);
    static int update = 0;
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
                if (Request.Cookies["tax"].Value == "0")
                {
                    update = 0;
                }
                else
                {
                    update = 1;
                    searchweight();
                }

            }
        }

    }

    protected void searchweight()
    {
        MySqlCommand _cmd = new MySqlCommand("select * from tax_rate where rowid=" + Request.Cookies["tax"].Value + "", _con);
        MySqlDataAdapter _da = new MySqlDataAdapter(_cmd);
        DataTable _dt = new DataTable();
        _da.Fill(_dt);
        txttaxname.Text = _dt.Rows[0][1].ToString();
        txttaxname.ReadOnly = true;
        txttaxcode.Text = _dt.Rows[0][2].ToString();
        txttaxcode.ReadOnly = true;
        txtpincode.Text = _dt.Rows[0][3].ToString();
        txtrate.Text = _dt.Rows[0][5].ToString();
        ddltype.Items.FindByValue(_dt.Rows[0][4].ToString()).Selected = true;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string error = "";
        String taxname = "";
        if (txttaxname.Text != "")
        {
            taxname = txttaxname.Text;
        }
        else
        {
            error += "tax should be entered . .";
        }

        String taxcode = "";
        if (txttaxcode.Text != "")
        {
            taxcode = txttaxcode.Text;
        }
        else
        {
            error += "taxcode should be entered . .";
        }

        String pincode = "";
        if (txtpincode.Text != "")
        {
            pincode = txtpincode.Text;
        }
        else
        {
            error += "pincode should be entered . .";
        }


        Decimal rate = 0;
        if (txtrate.Text != "")
        {
            try
            {
                rate = Convert.ToDecimal(txtrate.Text);
            }
            catch
            {
                error += "rate must be numeric <br>";
            }
        }
        else
        {
            error += "rate must be defined <br>";
        }

       
        int type = 0;
        if (ddltype.SelectedIndex>0)
        {
                type = Convert.ToInt32(ddltype.SelectedItem.Value);
            
        }
        else
        {
            error += "Type  must be defined <br>";
        }

       



        if (error == "")
        {
            String query = "";
            if (update == 0)
            {
                query = "insert into tax_rate(tax_name,tax_code,pincode,type,tax_rate,created_by) values('" + taxname + "','" + taxcode + "','" + pincode + "'," + type + ","+rate+"," + Convert.ToInt32(Request.Cookies["userid"].Value) + ")";
            }
            else
            {
                query = "update tax_rate set tax_name='" + taxname + "',tax_code='" + taxcode + "',pincode='" + pincode + "',type="+type+",tax_rate="+rate+" where rowid=" + Convert.ToInt32(Request.Cookies["tax"].Value) + "";
            }
            MySqlCommand _cmd = new MySqlCommand(query, _con);
            _con.Open();
            _cmd.ExecuteNonQuery();
            _con.Close();
            Response.Redirect("ViewCharges.aspx");
        }
        else
        {
            erro.InnerHtml = error;
        }
    }

    protected void btnupload_Click(object sender, EventArgs e)
    {

        if (flexcel.HasFile)
        {

            string FileName = Path.GetFileName(flexcel.PostedFile.FileName);
            string Extension = Path.GetExtension(flexcel.PostedFile.FileName);
            string FolderPath = ConfigurationManager.AppSettings["FolderPath"];
            string FilePath = Server.MapPath(FolderPath + FileName);
            flexcel.SaveAs(FilePath);

            Import_To_Grid(FilePath, Extension);

        }
        else
        {
            P1.InnerHtml = "<b>File Should be selected first</b>";
        }
    }



    private void Import_To_Grid(string FilePath, string Extension)
    {
        string conStr = "";
        switch (Extension)
        {
            case ".xls": //Excel 97-03
                conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                break;
            case ".xlsx": //Excel 07
                conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;
                break;
        }
        conStr = String.Format(conStr, FilePath, "yes");
        OleDbConnection connExcel = new OleDbConnection(conStr);
        OleDbCommand cmdExcel = new OleDbCommand();
        OleDbDataAdapter oda = new OleDbDataAdapter();
        DataTable dt = new DataTable();
        cmdExcel.Connection = connExcel;

        //Get the name of First Sheet
        connExcel.Open();
        DataTable dtExcelSchema;
        dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
        string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
        connExcel.Close();

        //Read Data from First Sheet
        connExcel.Open();
        cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";
        oda.SelectCommand = cmdExcel;
        oda.Fill(dt);
        connExcel.Close();

        //Bind Data to GridView
        String error = "Data Not upploaded are due to it exist in the system or some required fields are not entered .. <br>";
        for (int i = 1; i < dt.Rows.Count; i++)
        {
            try
            {
                String query = "insert into tax_rate(tax_name,tax_code,pincode,type,tax_rate,created_by) values('" + dt.Rows[i][0].ToString() + "','" + dt.Rows[i][1].ToString() + "','" + dt.Rows[i][2].ToString() + "'," + dt.Rows[i][3].ToString() + "," + dt.Rows[i][4].ToString() + "," + Convert.ToInt32(Request.Cookies["userid"].Value) + ")";
                MySqlCommand _cmd = new MySqlCommand(query, _con);
                _con.Open();
                _cmd.ExecuteNonQuery();
                _con.Close();
            }
            catch
            {
                error += "Numbers which are not uploaded are " + dt.Rows[i][0] + " <br>";
                continue;
            }

        }
        erro.InnerHtml = error;
        Response.Redirect("ViewCharges.aspx");

    }
}