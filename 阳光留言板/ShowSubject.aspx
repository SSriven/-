<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ShowSubject.aspx.cs" Inherits="阳光留言板.ShowSubject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/showsubject.css" rel="stylesheet" />
    <style>
        table{
            width:100%;
        }

    </style>
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
    <div id="subject">
        <div id="top">
            <span>||</span>
            <span>查看主题</span>
        </div>
        <div id="subList">
            <div id="list">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound" >
                            <ItemTemplate>
                                <li class=Sub>
                                    <span><%#Eval("Uid") %></span>
                                    <ul class=list-unstyled>
                                        <li>
                                            <a href="ShowWords.aspx?ID=<%#Eval("ID")%>">
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
                                <br />
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
                                <div style="clear:both">&nbsp;</div>
                            </FooterTemplate>
                        </asp:DataList>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!--<ul class="list-unstyled">
                </ul>-->
            </div>
        </div>
    </div>
</asp:Content>
