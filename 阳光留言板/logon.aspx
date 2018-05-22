<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="logon.aspx.cs" Inherits="阳光留言板.logon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        #logon{
            height: 500px;
            background: url(images/login.png);
        }
        #logon_main{
    padding-top:10%;
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
    <div id="logon">
        <div id="logon_main">
            <div id="main">
                <div class="container">
                    <div class="h2">用户注册</div>
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
                    <div class="input-group">
                        <span class="input-group-addon glyphicon glyphicon-star"></span>
                        <asp:TextBox ID="txtQpassword" class="form-control" placeholder="确认密码" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon glyphicon glyphicon-star"></span>
                        <asp:TextBox ID="txtQQ" class="form-control" placeholder="QQ" runat="server" ></asp:TextBox>
                    </div>
                    <br />
                    <div class="radio">
                        <label>
                            <asp:RadioButton ID="male" runat="server" Text="男" AutoPostBack="false" GroupName="Sex" />
                        </label>
                        <label>
                            <asp:RadioButton ID="famale" runat="server" Text="女" AutoPostBack="false" GroupName="Sex" />
                        </label>
                    </div>
                    <br />
                    <asp:Button ID="Login" style="width:416px;" class="btn btn-success" runat="server" Text="注册" />
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
