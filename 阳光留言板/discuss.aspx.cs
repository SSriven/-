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
                    UserName.Text = Session["userName"].ToString();
                    if (Request["num"].ToString() == "0")
                        labNull.Text = "还没有人评论，赶紧留下你的足迹吧~";
                    BindDataList(0);                      
                }
                catch(EvaluateException ex)
                {
                    UserName.Text = "";
                    Response.Write(ex);
                    //Response.Redirect("Default.aspx");
                }
                finally
                {
                    labDateTime.Text = DateTime.Now.ToLongDateString().ToString();
                }

            }
        }
        private void BindDataList(int currentpage)
        {
            pds.AllowPaging = true;
            pds.PageSize = 10;
            pds.CurrentPageIndex = currentpage;
            string strSql = "select *from tb_reply where ReplyID='"+Request["ID"]+"' order by ReplyTime desc";
            conn.Open();
            MySqlDataAdapter sda = new MySqlDataAdapter(strSql, conn);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            pds.DataSource = ds.Tables[0].DefaultView;
            DataList2.DataSource = pds;
            DataList2.DataBind();
            conn.Close();
        }

        protected void exit_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Write("<script>window.location.href='Default.aspx'</script>");
        }

        protected void DataList2_ItemDataBound(object sender, DataListItemEventArgs e)
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
        }


        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "first":
                    pds.CurrentPageIndex = 0;
                    BindDataList(pds.CurrentPageIndex);
                    break;
                case "pre":
                    pds.CurrentPageIndex = pds.CurrentPageIndex - 1;
                    BindDataList(pds.CurrentPageIndex);
                    break;
                case "next":
                    pds.CurrentPageIndex = pds.CurrentPageIndex + 1;
                    BindDataList(pds.CurrentPageIndex);
                    break;
                case "last":
                    pds.CurrentPageIndex = pds.PageCount - 1;
                    BindDataList(pds.CurrentPageIndex);
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
                            BindDataList(MyPageNum - 1);
                        }
                    }
                    break;
            }
        }
    }
}