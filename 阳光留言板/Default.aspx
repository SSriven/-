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
<asp:Content ID="Content2" ContentPlaceHolderID="h" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    
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
                    <div class="row">
                        <div class="col-lg-12">
                            <asp:TextBox ID="txtCode" style="float: left;margin-right: 40px;" class="form-control" runat="server" Width="150px" placeholder="验证码"></asp:TextBox>
                            <asp:ImageButton ID="imgCode" runat="server" alt="看不清，请点击我！" Width="100" Height="40" src="CheckCode.aspx" />
                        </div>
                    </div>
                        <asp:Label ID="Warning" style="margin-left: 150px;color: red;" runat="server" Text=""></asp:Label>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:Button ID="Login" style="width:416px;" class="btn btn-success" runat="server" Text="登录" OnClick="Login_Click" />
                            </div>
                        </div>
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
