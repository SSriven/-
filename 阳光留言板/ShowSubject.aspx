<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ShowSubject.aspx.cs" Inherits="阳光留言板.ShowSubject" %>

<%@ Register Src="~/nav.ascx" TagPrefix="uc1" TagName="nav" %>
<%@ Register Src="~/UserDataPager.ascx" TagPrefix="uc1" TagName="UserDataPager" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/showsubject.css" rel="stylesheet" />
    <style>
        table{
            width:100%;
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
            <span>查看主题</span>
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
                                                <%#Eval("Subject")%>
                                            </a>
                                        </li>
                                        <li class=DateTime>
                                            <%#Eval("leaveTime") %>
                                        </li>
                                    </ul>
                                </li>
                            </ItemTemplate>
                            <FooterTemplate >
                                <!--<br />
                                
                                <div id="footer">
                                    <asp:Label ID="labPageCount" runat="server" style="font-weight:bold;" Text="Label"></asp:Label>/
                                    <asp:Label ID="labCurrentPage" runat="server" Text="Label"></asp:Label>
                                    <asp:Button ID="lnkbtnFirst" class="btn btn-default" runat="server" CommandName="first" Text="首页"></asp:Button>
                                    <asp:Button ID="lnkbtnFront" class="btn btn-default" runat="server" CommandName="pre" Text="<< 上一页"></asp:Button>
                                    <asp:Button ID="lnkbtnNext" class="btn btn-default" runat="server" CommandName="next" Text="下一页 >>"></asp:Button>
                                    <asp:Button ID="lnkbtnLast" class="btn btn-default" runat="server" CommandName="last" Text="尾页"></asp:Button>
                                    <span>跳转至：</span>
                                    <asp:TextBox ID="txtPage" class="form-control" runat="server" style="width:40px;display:inline;"></asp:TextBox>
                                    <asp:LinkButton ID="lnkbtnSearch" class="btn btn-success" runat="server" CommandName="search">Go</asp:LinkButton>
                                </div>
                                <div style="clear:both">&nbsp;</div>-->
                            </FooterTemplate>
                        </asp:DataList>
                        <br />
                        <uc1:UserDataPager runat="server" id="UserDataPager" />
                        <div style="clear:both">&nbsp;</div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!--<ul class="list-unstyled">
                </ul>-->
            </div><!--list-->
        </div><!--subList-->
    </div><!--subject-->
</asp:Content>
