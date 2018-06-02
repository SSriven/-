<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ShowWords.aspx.cs" Inherits="阳光留言板.ShowWords" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/subject.css" rel="stylesheet" />
    <link href="css/ShowWords.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="h" runat="server">
    <header>
            <div id="header">
                <span id="header_left">
                    <span>欢迎来到阳光留言板</span>
                    <asp:Label ID="UserName" class="control-label" runat="server" Text="Label"></asp:Label>
                </span>
                <span id="header_right">
                     <asp:Label ID="labDateTime" class="control-label" runat="server" Text="2018/5/22 9:23"></asp:Label>
                     <asp:Button ID="exit" class="btn btn-danger btn-xs" runat="server" Text="注销" OnClick="exit_Click"></asp:Button>
                </span>
            </div>
         </header>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div id="Words">
        <div id="top">
            <span>||</span>
            <span>查看留言</span>
        </div>
        <div id="leaveWords">
            <table class="showwords">
                <tr class="words">
                    <th class="title">留言主题</th>
                    <td class="content"><%=ShowSubject %></td>
                </tr>
                <tr class="words">
                    <th class="title">留言人</th>
                    <td class="content"><%=ShowName %></td>
                </tr>
                <tr class="words">
                   <th class="title">留言时间</th>
                   <td class="content"><%=ShowTime %></td>
                </tr>
                <tr class="words">
                   <th class="title">留言内容</th>
                   <td class="content">&nbsp;</td>
                </tr>
            </table>
            <div class="leavewords">
                <span class="wordscontent"><%=ShowContent %></span>
            </div>
        </div>
        <div id="reply">
            <div id="input">
                <asp:TextBox ID="txtReply" runat="server" class="form-control" TextMode="MultiLine" MaxLength="100" Width="100%" Rows="2" placeholder="请输入少于100字"></asp:TextBox>
            </div>
            <div id="sent">
               <div id="btn">
                   <asp:Button ID="btnok" class="btn btn-danger" runat="server" Text="回复" OnClick="btnok_Click" />
               </div>
               <div id="watch">
                   <a href="discuss.aspx?ID=<%=x %>">神评论（<asp:Label ID="lblNumber" runat="server" Text="0"></asp:Label>)</a>
               </div>
            </div>
        </div>
    </div>
</asp:Content>
