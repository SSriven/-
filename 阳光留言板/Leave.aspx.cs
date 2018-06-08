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
    public partial class MyLeave : System.Web.UI.Page
    {
        static PagedDataSource pds = new PagedDataSource();
        MySqlConnection conn = new MySqlConnection("server=localhost;database=messageboard;User id=root;password=095637");
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
                    this.nav.str_userName = Session["userName"].ToString();
                    if (Request["Name"].ToString() == Session["userName"].ToString())
                    {
                        labOtherName.Text = "我";
                    }
                    else
                    {
                        labOtherName.Text = Request["Name"].ToString();
                    }
                    BindDataList1(0);
                }
                catch(EvaluateException ex)
                {
                    this.nav.str_userName = "";
                    Response.Write(ex);
                }
                finally
                {
                    this.nav.str_dataTime = DateTime.Now.ToLongDateString().ToString();
                }

            }
        }

        private void BindDataList1(int currentpage)
        {
            pds.AllowPaging = true;
            pds.PageSize = 3;
            pds.CurrentPageIndex = currentpage;
            conn.Open();
            string strSql = "select *from tb_leaveword where Uid='"+Request["Name"].ToString()+"' order by leaveTime desc";
            MySqlDataAdapter sda = new MySqlDataAdapter(strSql,conn);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            pds.DataSource= ds.Tables[0].DefaultView;
            DataList1.DataSource = pds;
            DataList1.DataBind();
            conn.Close();
        }


        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                
                Label CurrentPage = e.Item.FindControl("labCurrentPage") as Label;
                Label PageCount = e.Item.FindControl("labPageCount") as Label;
                Button FirstPage = e.Item.FindControl("lnkbtnFirst") as Button;
                Button PrePage = e.Item.FindControl("lnkbtnFront") as Button;
                Button NextPage = e.Item.FindControl("lnkbtnNext") as Button;
                Button LastPage = e.Item.FindControl("lnkbtnLast") as Button;
                
                CurrentPage.Text = (pds.CurrentPageIndex + 1).ToString();
                PageCount.Text = pds.PageCount.ToString();
                if (pds.IsFirstPage)
                {
                    FirstPage.Enabled = false;
                    PrePage.Enabled = false;
                }
                if (pds.IsLastPage)
                {
                    NextPage.Enabled = false;
                    LastPage.Enabled = false;
                }
            }
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Label mainID = e.Item.FindControl("mainID") as Label;
                Button btnok = e.Item.FindControl("btnok") as Button;
                DataList DataList2 = e.Item.FindControl("DataList2") as DataList;
                //mainID.Visible= true;
                DataRowView drv = e.Item.DataItem as DataRowView;
                string strcon = "select *from tb_reply where ReplyID='" + Convert.ToInt32(drv["ID"]) + "'";
                MySqlDataAdapter sda = new MySqlDataAdapter(strcon, conn);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                DataList2.DataSource = ds.Tables[0].DefaultView;
                DataList2.DataBind();
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "first":
                    pds.CurrentPageIndex = 0;
                    BindDataList1(pds.CurrentPageIndex);
                    break;
                case "pre":
                    pds.CurrentPageIndex = pds.CurrentPageIndex - 1;
                    BindDataList1(pds.CurrentPageIndex);
                    break;
                case "next":
                    pds.CurrentPageIndex = pds.CurrentPageIndex + 1;
                    BindDataList1(pds.CurrentPageIndex);
                    break;
                case "last":
                    pds.CurrentPageIndex = pds.PageCount - 1;
                    BindDataList1(pds.CurrentPageIndex);
                    break;
                case "btnok":
                    if(e.Item.ItemType == ListItemType.Item|| e.Item.ItemType == ListItemType.AlternatingItem)
                    {
                        MySqlData da = new MySqlData();
                        Label mainID = e.Item.FindControl("mainID") as Label;
                        TextBox txtreply = e.Item.FindControl("txtReply") as TextBox;
                        mainID.Visible = true;
                        string cmdtxt = "insert into tb_reply(Uname,Content,ReplyTime,ReplyID)";
                        cmdtxt += "values('" + Session["userName"].ToString() + "','" + txtreply.Text + "','" + DateTime.Now + "','" + Convert.ToInt32(mainID.Text) + "')";
                        if (da.ExceSQL(cmdtxt))
                        {
                            txtreply.Text = "";
                            BindDataList1(pds.CurrentPageIndex);
                        }
                        else
                        {
                            Response.Write("<script>alert('回复失败')</script>");
                        }
                    }
                    
                    break;
                case "search":
                    if (e.Item.ItemType == ListItemType.Footer)
                    {
                        int PageCount = int.Parse(pds.PageCount.ToString());
                        TextBox txtPage = e.Item.FindControl("txtPage") as TextBox;
                        int MyPageNum = 0;
                        if (!txtPage.Text.Equals(""))
                        {
                            MyPageNum = Convert.ToInt32(txtPage.Text.ToString());
                        }
                        if (MyPageNum <= 0 || MyPageNum > PageCount)
                        {
                            Response.Write("<script>alert('请输入页数并确定没有超出总页数！')</script>");
                        }
                        else
                        {
                            BindDataList1(MyPageNum - 1);
                        }
                    }
                    break;
            }
        }
    }
}