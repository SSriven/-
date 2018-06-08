using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 阳光留言板
{
    public partial class nav: System.Web.UI.UserControl
    {
        public string str_userName
        {
            get { return this.UserName.Text; }
            set { this.UserName.Text = value; }
        }
        public string str_dataTime
        {
            get { return this.labDateTime.Text; }
            set { this.labDateTime.Text = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void exit_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Write("<script>window.location.href='Default.aspx'</script>");
        }
    }
}