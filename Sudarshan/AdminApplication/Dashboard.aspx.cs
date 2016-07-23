using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
using System.Text;
using System.Web.Services;
using System.Web.Script.Services;

public partial class Admin_Dashboard : System.Web.UI.Page
{
    static string connection = ConfigurationManager.ConnectionStrings["katalyst"].ConnectionString;
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
               // getstat();
                //getdiscussion();
               // bindChart();
            }

        }
    }
    protected void getstat()
    {
        MySqlCommand _cmd = new MySqlCommand("Dashboard", _con);
        _cmd.CommandType = CommandType.StoredProcedure;
        MySqlDataAdapter _adp = new MySqlDataAdapter(_cmd);
        DataTable _dt = new DataTable();
        _adp.Fill(_dt);
        user.InnerText = "" + _dt.Rows[0][0].ToString();
        contact.InnerText = _dt.Rows[0][1].ToString();
        //trans.InnerText = _dt.Rows[0][2].ToString();
        advice.InnerText = _dt.Rows[0][3].ToString();
    }
    
    StringBuilder str = new StringBuilder();
    private void bindChart()
    {
        try
        {
       DataTable dt = new DataTable();
        string cmd = "call paymentchart";
        MySqlDataAdapter adp = new MySqlDataAdapter(cmd, _con);
        adp.Fill(dt);
        
            
            str.Append(@"<script type=*text/javascript*> google.load( *visualization*, *1*, {packages:[*corechart*]});
                       google.setOnLoadCallback(drawChart);
                       function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Month');
        data.addColumn('number', 'Paid');
        data.addColumn('number', 'Raised');      
 
        data.addRows(" + dt.Rows.Count + ");");
 
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                str.Append("data.setValue( " + i + "," + 0 + "," + "'" + dt.Rows[i]["month1"].ToString() + "');");
                str.Append("data.setValue(" + i + "," + 1 + "," + dt.Rows[i]["raised"].ToString() + ") ;");
                str.Append("data.setValue(" + i + "," + 2 + "," + dt.Rows[i]["pay"].ToString() + ") ;");
            }

            str.Append(" var chart = new google.visualization.ColumnChart(document.getElementById('divLineChart'));");
            str.Append(" chart.draw(data, {width: 650, height: 300, title: 'Company Performance',");
            str.Append("hAxis: {title: 'Month', titleTextStyle: {color: 'green'}}");
            str.Append("}); }");
            str.Append("</script>");
            lt.Text = str.ToString().Replace('*', '"');
        }
        catch
        {   }

    }
    
  /*  [WebMethod]
    public static List<Data2> GetData3()
    {
        MySqlConnection conn = new MySqlConnection(connection);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        //_con.Open();
        string cmdstr = "select SUM(totalamount),COALESCE(MONTHNAME(paiddate),'NO MONTH') from payment_detail group by MONTHNAME(paiddate)";
        MySqlCommand cmd = new MySqlCommand(cmdstr, conn);
        MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
        adp.Fill(ds);
        dt = ds.Tables[0];
        List<Data2> dataList = new List<Data2>();
        string cat = "";
        int val = 0;
        foreach (DataRow dr in dt.Rows)
        {
            cat = dr[1].ToString();
            val = Convert.ToInt32(dr[0]);
            dataList.Add(new Data2(cat, val));
        }
        return dataList;
    }
    */

}

public class Data2
{
    public string ColumnName = "";
    public int Value = 0;
    public Data2(string columnName, int value)
    {
        ColumnName = columnName;
        Value = value;
    }
}