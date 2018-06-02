<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="publishWords.aspx.cs" Inherits="阳光留言板.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #publish {
    width: 100%;
    min-height: 500px;
}

#top {
    width: 90%;
    height: 45px;
    line-height: 45px;
    margin: 3% auto;
    background-color: cadetblue;
    border: 2px dashed white;
    border-top-left-radius: 40px;
    border-bottom-right-radius: 40px;
}
#content{
    padding:0 5%;
}
#btn-group{
    padding:0 40%;
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
    <div id="publish">
        <div id="top">
            <span>||</span>
            <span>发表留言</span>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True" UpdateMode="Conditional">
          <ContentTemplate>
        <div id="content">
                    <div id="write">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-lg-2">留言主题:</label>
                                <div class="col-lg-9">
                                    <asp:TextBox ID="txtSubject" runat="server" class="form-control" Columns="50" MaxLength="20" placeholder="不得超过20字"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-2">留言内容:</label>
                                <div class="col-lg-9">
                                    <asp:TextBox ID="txtContent" runat="server" class="form-control" TextMode="MultiLine" Rows="10" Columns="50"></asp:TextBox>
                                </div>
                            </div>
                        </div>

         </div>
            <div id="btn">
                <div id="btn-group">
                    <asp:Button ID="btnOK" class="btn btn-default" runat="server" Text="发表" OnClick="btnOK_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnDelete" class="btn btn-default" runat="server" Text="重置" OnClick="btnDelete_Click" />
                </div>
            </div>
        </div>
                    </ContentTemplate>
            </asp:UpdatePanel>
    </div>
</asp:Content>
