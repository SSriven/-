using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 阳光留言板
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["userName"] == null || Session["userName"].ToString() == "")
            {
                Session.Abandon();
                Response.Write("<script>window.location.href='Default.aspx'</script>");
            }
            if (!IsPostBack)
            {
                try
                {
                    UserName.Text = Session["userName"].ToString();
                }
                catch
                {
                    UserName.Text = "";
                }
                finally
                {
                    labDateTime.Text = DateTime.Now.ToLongDateString().ToString();
                }
                
            }
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            MySqlData da = new MySqlData();
            string cmdtxt = "insert into tb_leaveword(Uid,Subject,Content,leaveTime)";
            cmdtxt += "values('" + Session["userName"].ToString() + "','" + txtSubject.Text + "','" + txtContent.Text + "','" + DateTime.Now + "')";
            bool add = da.ExceSQL(cmdtxt);
            if (add == true)
            {
                Response.Redirect("ShowSubject.aspx");
            }
            else
            {
                Response.Write("<script>alert('发送失败！')");
            }
        }

        protected void exit_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Write("<script>window.location.href='Default.aspx'</script>");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            txtSubject.Text = "";
            txtContent.Text = "";
        }
    }
}