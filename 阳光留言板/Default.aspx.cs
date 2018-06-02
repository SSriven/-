using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using PublicLibrary.加解密;

namespace 阳光留言板
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string code = txtCode.Text;
            if (Request.Cookies["CheckCode"].Value == code)
            {
                MySqlConnection con = new MySqlConnection("server=localhost;database=messageboard;User id=root;password=095637");
                con.Open();
                MD5Class md5 = new MD5Class();
                string pass = md5.Md5Encrypt(txtPassword.Text);
                string mysqlSel = "select *from tb_user where Uid=@username and PassWord=@userpass";
                MySqlCommand com = new MySqlCommand(mysqlSel, con);
                com.Parameters.Add(new MySqlParameter("username", MySqlDbType.VarChar, 20));
                com.Parameters["username"].Value = txtUserName.Text;
                com.Parameters.Add(new MySqlParameter("userpass", MySqlDbType.VarChar, 100));
                com.Parameters["userpass"].Value = pass;
                
                if (Convert.ToInt32(com.ExecuteScalar()) > 0)
                {
                    Session["userName"] = txtUserName.Text;
                    Response.Redirect("ShowSubject.aspx");
                    txtCode.Text = "";
                }
                else
                {
                    Warning.Text = "用户名或密码错误";
                }
                con.Close();
            }
            else
            {
                Warning.Text = "验证码输入错误";
            }
        }
    }
}