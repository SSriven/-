using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace 阳光留言板
{
    public partial class ShowWords : System.Web.UI.Page
    {
        public string ShowSubject, ShowTime, ShowContent, ShowName, num;
        string id="";
        public int x;
        int n = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            n = 0;
            if (Session["userName"] == null || Session["userName"].ToString() == "")
            {
                Session.Abandon();
                Response.Redirect("Default.aspx");
            }
            id =Request["subjectID"];
            x = Convert.ToInt32(id);
            if (!IsPostBack)
            {
                MySqlConnection Con = new MySqlConnection("server=localhost;database=messageboard;User id=root;password=095637");
               
                try
                {
                    this.nav.str_userName = Session["userName"].ToString();
                    string cmdtxt = "select *from tb_leaveword where ID='" + Request["subjectID"].ToString() + "'";
                    
                    MySqlCommand Com = new MySqlCommand(cmdtxt, Con);
                   
                    Con.Open();
                    
                    MySqlDataReader dr = Com.ExecuteReader();
                    
                    dr.Read();
                    if (dr.HasRows)
                    {
                        ShowSubject = dr["Subject"].ToString();
                        ShowTime = dr["leaveTime"].ToString();
                        ShowContent = dr["Content"].ToString();
                        ShowName = dr["UId"].ToString();
                    }
                    dr.Close();
                    
                }
                catch 
                {
                    this.nav.str_userName = "";
                    Response.Redirect("Default.aspx");
                }
                finally
                {
                    this.nav.str_dataTime = DateTime.Now.ToLongDateString().ToString();
                    
                    Con.Close();
                }

            }
            MySqlConnection Con2 = new MySqlConnection("server=localhost;database=messageboard;User id=root;password=095637");
            string cmdtxt2 = "select *from tb_reply";
            MySqlCommand Com2 = new MySqlCommand(cmdtxt2, Con2);
            Con2.Open();
            MySqlDataReader dr2 = Com2.ExecuteReader();
            while (dr2.Read())
            {
                if (dr2["ReplyID"].ToString() == Request["subjectID"].ToString())
                {
                    n++;
                }
            }
            lblNumber.Text = n.ToString();
            num = n.ToString();
            dr2.Close();
            Con2.Close();

        }

       /* protected void discuss_Click(object sender, EventArgs e)
        {
            discuss.PostBackUrl= "~/discuss.aspx? ID ='"+Request["ID"]+"'";
        }*/

        protected void btnok_Click(object sender, EventArgs e)
        {
            MySqlData da = new MySqlData();
            string cmdtxt = "insert into tb_reply(Uname,Content,ReplyTime,ReplyID)";
            cmdtxt += "values('" + Session["userName"].ToString() + "','" + txtReply.Text + "','" + DateTime.Now + "','" + Request["subjectID"].ToString() + "')";
            if (da.ExceSQL(cmdtxt))
            {
                Response.Write("<script>alert('回复成功');location='ShowWords.aspx?subjectID="+Request["subjectID"]+"'</script>");
                txtReply.Text = "";
            }
            else
            {
                Response.Write("<script>alert('回复失败')</script>");
            }
        }

        private void BindDataList()
        {

        }
    }
}