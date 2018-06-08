<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserDataPager.ascx.cs" Inherits="阳光留言板.UserDataPager" %>
<div id="footer">
    <asp:Label ID="labPageCount" runat="server" style="font-weight:bold;" Text="Label"></asp:Label>/
    <asp:Label ID="labCurrentPage" runat="server" Text="Label"></asp:Label>
    <asp:Button ID="lnkbtnFirst" class="btn btn-default" runat="server" CommandName="first" Text="首页" OnClick="lnkbtnFirst_Click"></asp:Button>
    <asp:Button ID="lnkbtnFront" class="btn btn-default" runat="server" CommandName="pre" Text="<< 上一页" OnClick="lnkbtnFront_Click"></asp:Button>
    <asp:Button ID="lnkbtnNext" class="btn btn-default" runat="server" CommandName="next" Text="下一页 >>" OnClick="lnkbtnNext_Click"></asp:Button>
    <asp:Button ID="lnkbtnLast" class="btn btn-default" runat="server" CommandName="last" Text="尾页" OnClick="lnkbtnLast_Click"></asp:Button>
    <span>跳转至：</span>
    <asp:TextBox ID="txtPage" class="form-control" runat="server" style="width:40px;display:inline;"></asp:TextBox>
    <asp:LinkButton ID="lnkbtnSearch" class="btn btn-success" runat="server" CommandName="search" OnClick="lnkbtnSearch_Click">Go</asp:LinkButton>
</div>
