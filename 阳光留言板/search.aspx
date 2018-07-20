<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="阳光留言板.search" %>

<%@ Register Src="~/nav.ascx" TagPrefix="uc1" TagName="nav" %>
<%@ Register Src="~/UserDataPager.ascx" TagPrefix="uc1" TagName="UserDataPager" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/showsubject.css" rel="stylesheet" />
    <style>
        table{
            width:100%;
        }
        .hightlightTxtSearch{
            color:red;
            margin:0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="h" runat="server">
    <uc1:nav runat="server" ID="nav" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div id="subject">
        <div id="top">
            <span>||</span>
            <span>搜索结果</span>
        </div>
        <div id="subList">
            <div id="list">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:DataList ID="DataList1" runat="server"  >
                            <ItemTemplate>
                                <li class=Sub>
                                    <a href="Leave.aspx?Name=<%#Eval("Uid")%>"><span><%#Eval("Uid") %></span></a>
                                    <ul class=list-unstyled>
                                        <li>
                                            <a href="ShowWords.aspx?subjectID=<%#Eval("ID")%>">
                                                <%#HightLight((string)Eval("Subject"),txtSearch) %>
                                            </a>
                                        </li>
                                        <li class=DateTime>
                                            <%#Eval("leaveTime")%>
                                        </li>
                                    </ul>
                                </li>
                            </ItemTemplate>
                        </asp:DataList>
                        <br />
                        <uc1:UserDataPager runat="server" ID="UserDataPager" />
                        <div style="clear:both">&nbsp;</div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!--<ul class="list-unstyled">
                </ul>-->
            </div><!--list-->
        </div><!--subList-->
    </div><!--subject-->
</asp:Content>
