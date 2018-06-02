using System;
using System.Collections.Generic;
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
            if (Session["userName"] == null || Session["userName"].ToString() == "")
            {
                Session.Abandon();
                Response.Redirect("Default.aspx");
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
                    Response.Redirect("Default.aspx");
                }
                finally
                {
                    labDateTime.Text = DateTime.Now.ToLongDateString().ToString();
                }

            }
        }
        protected void exit_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Write("<script>window.location.href='Default.aspx'</script>");
        }
    }
}