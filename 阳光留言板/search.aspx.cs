using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 阳光留言板
{
    public partial class search : System.Web.UI.Page
    {
        public string txtSearch;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
            if (Session["userName"] == null || Session["userName"].ToString() == "")
            {
                Session.Abandon();
                Response.Write("<script>window.location.href='Default.aspx'</script>");
            }
            try
            {
                UserDataPager.OperateID = DataList1;
                UserDataPager.DataMySql = Session["search"].ToString();
                UserDataPager.PageNum = 10;
                txtSearch = Request["keyword"].ToString();
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                Page.EnableViewState = true;
                DataList1.EnableViewState = true;
                try
                {
                   
                    this.nav.str_userName = Session["userName"].ToString();
                    //BindDataList(0);
                }
                catch
                {
                    this.nav.str_userName = "";
                }
                finally
                {
                    this.nav.str_dataTime = DateTime.Now.ToLongDateString().ToString();
                }

            }
        }
        protected string HightLight(string strKey,string keyword)//strKey为搜索出的内容，keyword为搜索的关键字
        {
            if (keyword == ""||keyword==null)//如果搜索关键字为空
            {
                return strKey;
            }
            if(strKey.IndexOf(keyword.Substring(keyword.IndexOf("'") + 1, keyword.LastIndexOf("'") - 1))>-1)//如果搜索的关键字在原文中存在（这里区分大小写）
            {
                //替换原文中的关键字
                string strReturn = strKey.Replace(keyword.Substring(keyword.IndexOf("'") + 1, keyword.LastIndexOf("'") - 1), "<span class='hightlightTxtSearch'>" + keyword.Substring(keyword.IndexOf("'") + 1, keyword.LastIndexOf("'") - 1) + "</span>");
                return strReturn;
            }
            else if(strKey.ToUpper().IndexOf(keyword.Substring(keyword.IndexOf("'") + 1, keyword.LastIndexOf("'") - 1).ToUpper()) >-1)//将原文与关键字都变为大写，如果能够匹配
            {
                //替换原文中的关键字
                keyword = strKey.Substring(strKey.ToUpper().IndexOf(keyword.Substring(keyword.IndexOf("'") + 1, keyword.LastIndexOf("'") - 1).ToUpper()), keyword.Substring(keyword.IndexOf("'") + 1, keyword.LastIndexOf("'") - 1).Length);
                string strReturn = strKey.Replace(keyword, "<span class='hightlightTxtSearch'>" + keyword+ "</span>");
                return strReturn;
            }
            else
            {
                return strKey;
            }
        }
    }
}