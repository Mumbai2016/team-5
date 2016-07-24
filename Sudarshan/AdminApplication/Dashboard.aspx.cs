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
                getstat();
                //getdiscussion();
                //BindChart();
                binddll();
            }

        }
    }
    protected void getstat()
    {
        MySqlCommand _cmd = new MySqlCommand("select count(*),type from user_detail group by type", _con);
       
        MySqlDataAdapter _adp = new MySqlDataAdapter(_cmd);
        DataTable _dt = new DataTable();
        _adp.Fill(_dt);
        for (int i = 0; i < _dt.Rows.Count; i++) {
            if (_dt.Rows[i][1].ToString().Equals("ADMIN")) {
                admin.InnerText = "" + _dt.Rows[i][0].ToString();
            }
            if (_dt.Rows[i][1].ToString().Equals("mentor")) {
                mentor.InnerText = _dt.Rows[i][0].ToString();
            }
            if (_dt.Rows[i][1].ToString().Equals("mentee"))
            {
                mentee.InnerText = _dt.Rows[i][0].ToString();
            }
        }
            
        
        //trans.InnerText = _dt.Rows[0][2].ToString();
        
    }
    protected void binddll() {

        MySqlCommand _cmd = new MySqlCommand("select concat(fname,' ',sname) as name,mentor_id from mentor", _con);

        MySqlDataAdapter _adp = new MySqlDataAdapter(_cmd);
        DataTable _dt = new DataTable();
        _adp.Fill(_dt);
        ddlmentor.DataSource = _dt;
        ddlmentor.DataBind();
        ddlmentor.Items.Insert(0, "Select Mentor");
     
    }
    StringBuilder str = new StringBuilder();
    private void BindChart()
    {
        DataTable dt = new DataTable();
        try
        {

            
            string cmd = "SELECT MONTHNAME(meet_date),YEAR(meet_date),count(*) from mentee_notification_accept "
+ " where accept=2 and meet_date <=NOW() "
+ " group by MONTHNAME(meet_date),YEAR(meet_date) and mentor_id="+ddlmentor.SelectedItem.Value+"";
            MySqlDataAdapter adp = new MySqlDataAdapter(cmd, _con);
            adp.Fill(dt);

            str.Append(@"<script type=*text/javascript*> google.load( *visualization*, *1*, {packages:[*corechart*]});
                       google.setOnLoadCallback(drawChart);
                       function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Year');
        data.addColumn('number', 'Lectures');     
 
        data.addRows(" + dt.Rows.Count + ");");
 
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                str.Append("data.setValue( " + i + "," + 0 + "," + "'" + dt.Rows[i][0].ToString() +"-"+dt.Rows[i][1].ToString() +"');");
                str.Append("data.setValue(" + i + "," + 1 + "," + dt.Rows[i][2].ToString() + ") ;");            
            }
 
            str.Append(" var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));");
            str.Append(" chart.draw(data, {width: 550, height: 200, title: 'Mentor Performance',");
            str.Append("hAxis: {title: 'Month-Year', titleTextStyle: {color: 'green'}}");
            str.Append("}); }");
            str.Append("</script>");
            lt.Text = str.ToString().Replace('*', '"');
        }
        catch
        {   }
    }

    private void bindChart1()
    {
        try
        {
            DataTable dt = new DataTable();
            string cmd = "SELECT MONTHNAME(meet_date),YEAR(meet_date),count(*) from mentee_notification_accept "
+" where accept=2 and meet_date <=NOW() "
+" group by MONTHNAME(meet_date),YEAR(meet_date)";
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
                str.Append("data.setValue( " + i + "," + 0 + "," + "'" + dt.Rows[i][0].ToString() + "');");
                str.Append("data.setValue(" + i + "," + 1 + "," + dt.Rows[i][2].ToString() + ") ;");
                str.Append("data.setValue(" + i + "," + 2 + ",0) ;");
            }

            str.Append(" var chart = new google.visualization.ColumnChart(document.getElementById('LineChart'));");
            str.Append(" chart.draw(data, {width: 650, height: 300, title: 'Company Performance',");
            str.Append("hAxis: {title: 'Month', titleTextStyle: {color: 'green'}}");
            str.Append("}); }");
            str.Append("</script>");
            lt.Text = str.ToString().Replace('*', '"');
        }
        catch
        { }

    }

    [WebMethod]
    public static List<Data2> GetData3()
    {
        MySqlConnection conn = new MySqlConnection(connection);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        //_con.Open();
        string cmdstr = "SELECT MONTHNAME(meet_date),YEAR(meet_date),count(*) "
+" from mentee_notification_accept "
+" where accept=2 and meet_date <=NOW() "
+" group by MONTHNAME(meet_date),YEAR(meet_date) ";
        MySqlCommand cmd = new MySqlCommand(cmdstr, conn);
        MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
        adp.Fill(ds);
        dt = ds.Tables[0];
        List<Data2> dataList = new List<Data2>();
        string cat = "";
        int val = 0;
        foreach (DataRow dr in dt.Rows)
        {
            cat = dr[0].ToString()+"-"+dr[1].ToString();
            val = Convert.ToInt32(dr[2]);
            dataList.Add(new Data2(cat, val));
        }
        return dataList;
    }


    protected void ddlmentor_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindChart();
    }
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