<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="阳光留言板.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #login{
            height: 500px;
            background: url(images/login.png);
        }
        #login_main{
    padding-top:15%;
}
        #main{
    background: white;
    width:50%;
    margin:0 auto;
        opacity: 0.9;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="login">
        <div id="login_main">
            <div id="main">
                <div class="container">
                    <div class="h2">用户登录</div>
                    <div class="input-group">
                        <span class="input-group-addon glyphicon glyphicon-user"></span>
                        <asp:TextBox ID="txtUserName" class="form-control" placeholder="用户名" runat="server"></asp:TextBox>
                    </div>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon glyphicon glyphicon-star"></span>
                        <asp:TextBox ID="txtPassword" class="form-control" placeholder="密码" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <br />
                    <asp:Button ID="Login" style="width:416px;" class="btn btn-success" runat="server" Text="登录" />
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
