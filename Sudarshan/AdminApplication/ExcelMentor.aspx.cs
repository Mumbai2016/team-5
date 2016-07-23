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


public partial class ExcelMentor : System.Web.UI.Page
{
    MySqlConnection _con = new MySqlConnection(ConfigurationManager.ConnectionStrings["katalyst"].ConnectionString);
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

            }
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
            erro.InnerHtml = "<b>File Should be selected first</b>";
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
        Date_Convert d = new Date_Convert();
        //Bind Data to GridView
        String error = "Data Not upploaded are due to it exist in the system or some required fields are not entered .. <br>";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            try
            {
                MySqlCommand _cmd = new MySqlCommand("registermentor", _con);
                _cmd.CommandType = CommandType.StoredProcedure;

                _cmd.Parameters.AddWithValue("@fname1", dt.Rows[i][0].ToString());
                _cmd.Parameters.AddWithValue("@lname1", dt.Rows[i][1].ToString());
                _cmd.Parameters.AddWithValue("@mname1", dt.Rows[i][2].ToString());
                _cmd.Parameters.AddWithValue("@dob1",d.datecon( dt.Rows[i][3].ToString()));
                _cmd.Parameters.AddWithValue("@emailid", dt.Rows[i][4].ToString());
                _cmd.Parameters.AddWithValue("@passwd", dt.Rows[i][5].ToString());
                _cmd.Parameters.AddWithValue("@address1", dt.Rows[i][6].ToString());
                _cmd.Parameters.AddWithValue("@mobileno", dt.Rows[i][7].ToString());
                _cmd.Parameters.AddWithValue("@workexp",Convert.ToDecimal( dt.Rows[i][8].ToString()));
                _cmd.Parameters.AddWithValue("@int_time",Convert.ToDecimal( dt.Rows[i][9].ToString()));
                _cmd.Parameters.AddWithValue("@stat",0);


                _con.Open();
                _cmd.ExecuteNonQuery();
                _con.Close();
                erro.InnerHtml = "Uploaded Successfully . . .";
            }
            catch
            {
                error += "Numbers which are not uploaded are " + dt.Rows[i][0] + " <br>";
                continue;
            }

        }
        erro.InnerHtml = error;


    }
}