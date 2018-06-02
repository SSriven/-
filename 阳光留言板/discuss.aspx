<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="discuss.aspx.cs" Inherits="阳光留言板.discuss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/showsubject.css" rel="stylesheet" />
    <link href="css/discuss.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="h" runat="server">
     <header>
            <div id="header">
                <span id="header_left">
                    <span>欢迎来到阳光留言板</span>
                    <asp:Label ID="UserName" class="control-label username" runat="server" Text="Label"></asp:Label>
                </span>
                <span id="header_right">
                     <asp:Label ID="labDateTime" class="control-label" runat="server" Text="2018/5/22 9:23"></asp:Label>
                     <asp:Button ID="exit" class="btn btn-danger btn-xs" runat="server" Text="注销" OnClick="exit_Click"></asp:Button>
                </span>
            </div>
         </header>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div id="discuss">
        <div id="top">
            <span>||</span>
            <span>评论区</span>
        </div>
        <div id="discuss_content">
            <div id="border">
                <ul class="list-unstyled">
                    <li>
                        <asp:LinkButton ID="ReplyNmae" runat="server">LinkButton</asp:LinkButton>
                    </li>
                    <li><span id="content">ggrthgrgtj从niece发v弄i阿胶</span></li>
                    <li>
                        <span id="time">2018/06/02 21:41</span>
                        ·
                        <span class="Ta">回复Ta</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
