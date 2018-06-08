<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="discuss.aspx.cs" Inherits="阳光留言板.discuss" %>

<%@ Register Src="~/nav.ascx" TagPrefix="uc1" TagName="nav" %>
<%@ Register Src="~/UserDataPager.ascx" TagPrefix="uc1" TagName="UserDataPager" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/showsubject.css" rel="stylesheet" />
    <link href="css/discuss.css" rel="stylesheet" />
    <style>
        table{
            width:100%;
        }
        li span {
            font-weight:normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="h" runat="server">
    <uc1:nav runat="server" ID="nav" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div id="discuss">
        <div id="top">
            <span>||</span>
            <span>评论区</span>
        </div>
        <div id="discuss_content">
            <asp:Label ID="labNull" runat="server" Text=" "></asp:Label>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:DataList ID="DataList2" runat="server">
                        <ItemTemplate>
                            <div id="border">
                                <ul class="list-unstyled">
                                    <li>
                                        <a href="Leave.aspx?Name=<%#Eval("Uname")%>"><%#Eval("Uname")%></a>
                                    </li>
                                    <li><span id="content"><%#Eval("Content") %></span></li>
                                    <li>
                                        <span id="time"><%#Eval("ReplyTime") %></span>
                                        ·
                                        <span class="Ta">回复Ta</span>
                                    </li>
                                </ul>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <br />
                    <uc1:UserDataPager runat="server" ID="UserDataPager" />
                    <div style="clear:both">&nbsp;</div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
