using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 阳光留言板
{
    public partial class discuss : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            UserDataPager.OperateID = DataList2;
            UserDataPager.DataMySql = "select *from tb_reply where ReplyID='" + Request["subjectID"] + "' order by ReplyTime desc";
            UserDataPager.PageNum = 10;
            if (Session["userName"] == null || Session["userName"].ToString() == "")
            {
                Session.Abandon();
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                try
                {
                    this.nav.str_userName = Session["userName"].ToString();
                    if (Request["Reply_num"].ToString() == "0")
                        labNull.Text = "还没有人评论，赶紧留下你的足迹吧~";                      
                }
                catch
                {
                    this.nav.str_userName = "";
                    
                    Response.Redirect("ShowWords.aspx");
                }
                finally
                {
                    this.nav.str_dataTime = DateTime.Now.ToLongDateString().ToString();
                }

            }
        }
        
    }
}