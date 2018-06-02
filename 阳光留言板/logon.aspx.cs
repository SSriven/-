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
    public partial class logon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Session["userName"] == null || Session["userName"].ToString() == "")
            {
                Session["userName"] = "";
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

        protected void Logon_Click(object sender, EventArgs e)
        {
            if ((txtUserName.Text==""||txtPassword.Text==""||txtQpassword.Text==""||txtQQ.Text=="")||(male.Checked == false && famale.Checked == false)||txtPassword.Text!=txtQpassword.Text)
            {
                Response.Write("<script>alert('注册失败，请正确填写信息！')</script>");
            }
            else
            {
                if(isName())
                {
                    Response.Write("<script>alert('注册失败，该QQ号已被注册！')</script>");
                }
                else
                {
                    string userName = txtUserName.Text;
                    MD5Class md5 = new MD5Class();
                    string userPass = md5.Md5Encrypt(txtPassword.Text);
                    string qq = txtQQ.Text;
                    string sex = "";
                    if(male.Checked==true)
                    {
                        sex = "male";
                    }
                    else if(famale.Checked==true)
                    {
                        sex = "famale";
                    }
                    string mysqlinsert = "insert into tb_user(Uid,PassWord,QQ,Sex) values('" + userName + "','" + userPass + "','" + qq + "','" + sex + "')";
                    MySqlData da = new MySqlData();
                    bool add = da.ExceSQL(mysqlinsert);
                    if (add == true)
                    {
                        Response.Write("<script>alert('注册成功！')</script>");
                        txtPassword.Text = txtQpassword.Text = txtUserName.Text = txtQQ.Text = "";
                    }
                    else
                    {
                        Response.Write("<script>alert('注册失败！')</script>");
                    }
                }
                
            }
        }
        protected bool isName()
        {
            bool bllsName = false;
            string mysqlSel = "select *from tb_user where QQ='" + txtQQ.Text + "'";
            MySqlData da = new MySqlData();
            if (da.ExceSelectSQL(mysqlSel))
            {
                bllsName = true;
            }
            else
            {
                bllsName = false;
            }
            return bllsName;
        }
    }
}