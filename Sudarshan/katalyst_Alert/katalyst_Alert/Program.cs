using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Data;
using ClosedXML.Excel;
using System.Net.Mail;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web;
using System.Collections.Specialized;


namespace katalyst_Alert
{
    class Program
    {
        static void Main(string[] args)
        {
            lessthan10();
            lessthan20();
            morethan();



        }
        private static void morethan()
        {

            MySqlConnection _con = new MySqlConnection(@"server=localhost;User Id=root;password='';Persist Security Info=True;database=katalyst;");
            MySqlCommand _cmd = new MySqlCommand("SELECT mn.mentor_id,m.email,m.fname,count(*) "
+ " from mentee_notification_accept mn inner join mentor m "
+ " on mn.mentor_id=m.mentor_id "
+ " where accept=2 and MONTH(meet_date)=MONTH(now()) and DAY(meet_date)<=20 "
+ " group by mn.mentor_id,m.email,m.fname having count(*)>=2", _con);
            MySqlDataAdapter _da = new MySqlDataAdapter(_cmd);
            DataTable _dt = new DataTable();
            _da.Fill(_dt);
            for (int i = 0; i < _dt.Rows.Count; i++)
            {
                sendExcel("Alert message", "Well done you are at par forthe meetings", _dt.Rows[i][1].ToString(), "sshinde1392@gmail.com");
            }

        }
        private static void lessthan10()
        {

            MySqlConnection _con = new MySqlConnection(@"server=localhost;User Id=root;password='';Persist Security Info=True;database=katalyst;");
            MySqlCommand _cmd = new MySqlCommand("SELECT mn.mentor_id,m.email,m.fname,count(*) "
+ " from mentee_notification_accept mn inner join mentor m "
+ " on mn.mentor_id=m.mentor_id "
+ " where accept=2 and MONTH(meet_date)=MONTH(now()) and DAY(meet_date)<=10 "
+ " group by mn.mentor_id,m.email,m.fname having count(*)<=1", _con);
            MySqlDataAdapter _da = new MySqlDataAdapter(_cmd);
            DataTable _dt = new DataTable();
            _da.Fill(_dt);
            for (int i = 0; i < _dt.Rows.Count; i++)
            {
                sendExcel("Alert message", "You have not completed your one meetings", _dt.Rows[i][1].ToString(), "sshinde1392@gmail.com");
            }

        }

        private static void lessthan20(){
             
             MySqlConnection _con = new MySqlConnection(@"server=localhost;User Id=root;password='';Persist Security Info=True;database=katalyst;");
                MySqlCommand _cmd=new MySqlCommand("SELECT mn.mentor_id,m.email,m.fname,count(*) "
+" from mentee_notification_accept mn inner join mentor m "
+" on mn.mentor_id=m.mentor_id "
+" where accept=2 and MONTH(meet_date)=MONTH(now()) and DAY(meet_date)<=20 "
+" group by mn.mentor_id,m.email,m.fname having count(*)<=2",_con);
            MySqlDataAdapter _da=new MySqlDataAdapter(_cmd);
            DataTable _dt=new DataTable();
            _da.Fill(_dt);
            for (int i = 0; i < _dt.Rows.Count; i++) {
                sendExcel("Alert message","You have not completed your two meetings",_dt.Rows[i][1].ToString(),"sshinde1392@gmail.com");
            }

        }
        

      //  protected void ExportExcel(object sender, EventArgs e)
        protected static void sendExcel(string subsubject, String messagepart,  string tomail, string ccmail)
        {

            
            

                //    using (MailMessage mm = new MailMessage("rajesh@mulyabuy.com", tomail))
                    using (MailMessage mm = new MailMessage("ndr@logikarts.com", tomail))
                    {

                        mm.CC.Add(ccmail);

                        mm.IsBodyHtml = true;
                        mm.Subject = subsubject;
                        mm.Body = messagepart;
                       
                        mm.IsBodyHtml = true;
                     //   System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("smtp.bizmail.yahoo.com");
                        System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("smtp.logikarts.com");
                     //   smtp.Credentials = new System.Net.NetworkCredential("ndr@logikarts.com", "R$TRIOo2"); // enduevrxbwqemnru      //nplihdxixdwfvlag//enduevrxbwqemnru
                       // smtp.Credentials = new System.Net.NetworkCredential("vinayak.sawant@mulyabuy.com", "enduevrxbwqemnru"); // enduevrxbwqemnru      //nplihdxixdwfvlag//enduevrxbwqemnru
                    //    smtp.Credentials = new System.Net.NetworkCredential("rajesh@mulyabuy.com", "nplihdxixdwfvlag"); // enduevrxbwqemnru      //nplihdxixdwfvlag//enduevrxbwqemnru
                        smtp.Credentials = new System.Net.NetworkCredential("ndr@logikarts.com", "R$TRIOo2"); // enduevrxbwqemnru      //nplihdxixdwfvlag//enduevrxbwqemnru
                   
                        

                        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                     // smtp.Port = 587;
                      //smtp.Port = 25;
                       // smtp.Timeout = 0;
                        //smtp.UseDefaultCredentials = false;
                       // smtp.EnableSsl = true;
                        smtp.Send(mm);
                       // smtp.SendAsync(mm,"mm");

                        mm.Dispose();

                    }
         


    }
    }
}
