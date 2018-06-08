<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Leave.aspx.cs" Inherits="阳光留言板.MyLeave" %>

<%@ Register Src="~/nav.ascx" TagPrefix="uc1" TagName="nav" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/showsubject.css" rel="stylesheet" />
    <link href="css/ShowWords.css" rel="stylesheet" />
    <link href="css/myleave.css" rel="stylesheet" />
    <style>
        table {
            width:100%;
        }
        .mainid {
            display:none;
        }
        .my_content{
            background:none;
        }
        pre{
            white-space:pre-wrap;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="h" runat="server">
    <uc1:nav runat="server" id="nav" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div id="MyLeave">
        <div id="top">
            <span>||</span>
            <span><asp:Label ID="labOtherName" style="margin:0;padding-right:10px;" runat="server" Text="Label"></asp:Label>的动态</span>
        </div>
        <div id="leave_word">
            <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">
                <ItemTemplate>
                    <ul class="list-unstyled first">
                        <li>
                           <asp:Label ID="mainID" class="mainid" runat="server" Text='<%#Eval("ID")%>'></asp:Label>
                        </li>
                        <li><span class="my_tltie"><%#Eval("Subject") %></span></li>
                        <li><span class="time"><%#Eval("leaveTime") %></span></li>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                            <ContentTemplate>
                                <li class="my_content"><pre><%#Eval("Content") %></pre></li>
                                <li>
                                    <ul class="list-unstyled second">
                                        <asp:DataList ID="DataList2" runat="server">
                                            <ItemTemplate>
                                                <li>
                                                    <span class="reply_people"><a href="Leave.aspx?Name=<%#Eval("Uname")%>"><%#Eval("Uname")%></a></span>:
                                                    <span class="reply_content"><%#Eval("Content") %></span>
                                                </li> 
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </ul>
                                </li>
                                <li>
                                    <div class="reply">
                                        <div id="input">
                                            <asp:TextBox ID="txtReply" runat="server" class="form-control" TextMode="MultiLine" MaxLength="100" Width="100%" Rows="1" placeholder="评论"></asp:TextBox>
                                        </div>
                                        <div id="sent">
                                           <div id="btn">
                                               <asp:Button ID="btnok" class="btn btn-danger" runat="server" CommandName="btnok" Text="回复" />
                                           </div> 
                                        </div>
                                    </div>
                                </li>
                            </ContentTemplate>
                       </asp:UpdatePanel>
                    </ul> 
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
        </div>
    </div>
</asp:Content>
