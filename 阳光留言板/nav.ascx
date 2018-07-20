<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="nav.ascx.cs" Inherits="阳光留言板.nav" %>
<header>
   <div id="header">
      <span id="header_left">
      <span>欢迎来到阳光留言板</span>
        <asp:Label ID="UserName" class="control-label username" runat="server" Text="Label"></asp:Label>
      </span>
      <div class="input-group" style="width:30%;display: inline-table;margin-left: 400px;vertical-align: middle;line-height: 30px;">
        <asp:TextBox ID="txtSearch" class="form-control" style="height: 30px;" runat="server" placeholder="请输入关键字"></asp:TextBox>
        <div class="input-group-btn">
            <asp:Button ID="btnSearch" class="btn btn-success" style="height: 30px;" runat="server" Text="搜索" OnClick="btnSearch_Click" />
        </div>
      </div>
      <span id="header_right">
         <asp:Label ID="labDateTime" class="control-label" runat="server" Text="2018/5/22 9:23"></asp:Label>
         <asp:Button ID="exit" class="btn btn-danger btn-xs" runat="server" Text="注销" OnClick="exit_Click"></asp:Button>
      </span>
   </div>
</header>
