<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="logon.aspx.cs" Inherits="阳光留言板.logon" %>

<%@ Register Src="~/nav.ascx" TagPrefix="uc1" TagName="nav" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="h" runat="server">
    <uc1:nav runat="server" ID="nav" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div id="logon">
        <div id="logon_main">
            <div id="main">
                <div class="container">
                    <div class="h2">用户注册</div>
                    <div class="input-group">
                        <span class="input-group-addon glyphicon glyphicon-user"></span>
                        <asp:TextBox ID="txtUserName" class="form-control" placeholder="用户名" runat="server"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能输入为空" ControlToValidate="txtUserName" style="color:red">不能输入为空</asp:RequiredFieldValidator>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon glyphicon glyphicon-star"></span>
                        <asp:TextBox ID="txtPassword" class="form-control" placeholder="请输入6~18位密码" runat="server" TextMode="Password" MaxLength="18"></asp:TextBox>
                    </div>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon glyphicon glyphicon-star"></span>
                        <asp:TextBox ID="txtQpassword" class="form-control" placeholder="确认密码" runat="server" TextMode="Password" MaxLength="18"></asp:TextBox>
                    </div>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次输入的密码不一致" ControlToCompare="txtPassword" ControlToValidate="txtQpassword" style="color:red">两次输入的密码不一致</asp:CompareValidator>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon glyphicon glyphicon-star"></span>
                        <asp:TextBox ID="txtQQ" class="form-control" placeholder="QQ" runat="server" ></asp:TextBox>
                    </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能输入为空" ControlToValidate="txtQQ" style="color:red">不能输入为空</asp:RequiredFieldValidator>
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
                    <asp:Button ID="Logon" style="width:416px;" class="btn btn-success" runat="server" Text="注册" OnClick="Logon_Click" />
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
