<%@ Page Title="" Language="C#" MasterPageFile="~/MyYugiohStore.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyYugiohStore.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Login">
    
        <asp:Login ID="Login1" runat="server" BackColor="#F7F7DE" BorderColor="#CCCC99" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            Font-Size="10pt" DestinationPageUrl="~/Index.aspx">
            <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
        </asp:Login>
    
    </div>

    <div>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/NewUser.aspx">New User?</asp:HyperLink>   
    </div>
</asp:Content>
