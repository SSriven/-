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
    public partial class UserDataPager : System.Web.UI.UserControl
    {
        static PagedDataSource pds = new PagedDataSource();
        MySqlConnection conn = new MySqlConnection("server=localhost;database=messageboard;User id=root;password=095637");

        private object operateID;
        public object OperateID
        {
            get { return operateID; }
            set { operateID = value; }
        }
        private int pageNum = 10;
        public int PageNum
        {
            get { return pageNum; }
            set { pageNum = value; }
        }
        private string mysql = "";
        public string DataMySql
        {
            get { return mysql; }
            set { mysql = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataList(0);
            }
        }
        private void BindDataList(int currentpage)
        {
            string mytype = operateID.GetType().ToString();
            mytype = mytype.Substring(mytype.LastIndexOf(".")+1,mytype.Length-1-mytype.LastIndexOf("."));
            pds.AllowPaging = true;
            pds.PageSize = pageNum;
            pds.CurrentPageIndex = currentpage;
            conn.Open();
            MySqlDataAdapter sda = new MySqlDataAdapter(mysql,conn);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            pds.DataSource = ds.Tables[0].DefaultView;
            labPageCount.Text = pds.PageCount.ToString();
            labCurrentPage.Text = (pds.CurrentPageIndex + 1).ToString();
            if (pds.IsFirstPage)
            {
                lnkbtnFirst.Enabled = false;
                lnkbtnFront.Enabled = false;
                /*lnkbtnLast.Enabled = true;
                lnkbtnNext.Enabled = true;*/
            }
            if(pds.IsLastPage)
            {
                lnkbtnLast.Enabled = false;
                lnkbtnNext.Enabled = false;
            }
            if (mytype == "GridView")
            {
                ((GridView)(operateID)).DataSource = pds;
                ((GridView)(operateID)).DataBind();
            }
            else if (mytype == "DataList")
            {
                ((DataList)(operateID)).DataSource = pds;
                ((DataList)(operateID)).DataBind();
            }
            conn.Close();
        }

        protected void lnkbtnFirst_Click(object sender, EventArgs e)
        {
            pds.CurrentPageIndex = 0;
            BindDataList(pds.CurrentPageIndex);
            lnkbtnFirst.Enabled = false;
            lnkbtnFront.Enabled = false;
            lnkbtnLast.Enabled = true;
            lnkbtnNext.Enabled = true;
        }

        protected void lnkbtnFront_Click(object sender, EventArgs e)
        {
            if (pds.CurrentPageIndex >= 0)
            {
                pds.CurrentPageIndex = pds.CurrentPageIndex - 1;
                BindDataList(pds.CurrentPageIndex);
                lnkbtnNext.Enabled = true;
                lnkbtnLast.Enabled = true;
                if (pds.CurrentPageIndex == 0)
                {
                    lnkbtnFirst.Enabled = false;
                    lnkbtnFront.Enabled = false;
                }
            }
        }

        protected void lnkbtnNext_Click(object sender, EventArgs e)
        {
            if (pds.CurrentPageIndex <= pds.PageCount - 1)
            {
                lnkbtnFirst.Enabled = true;
                lnkbtnFront.Enabled = true;
                pds.CurrentPageIndex += 1;
                BindDataList(pds.CurrentPageIndex);
                if (pds.CurrentPageIndex == pds.PageCount - 1)
                {
                    lnkbtnNext.Enabled = false;
                    lnkbtnLast.Enabled = false;
                }
            }
        }

        protected void lnkbtnLast_Click(object sender, EventArgs e)
        {
            pds.CurrentPageIndex = pds.PageCount-1;
            BindDataList(pds.CurrentPageIndex);
            lnkbtnFirst.Enabled = true;
            lnkbtnFront.Enabled = true;
            lnkbtnLast.Enabled = false;
            lnkbtnNext.Enabled = false;
        }

        protected void lnkbtnSearch_Click(object sender, EventArgs e)
        {
            int PageCount = int.Parse(pds.PageCount.ToString());
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
    }
}