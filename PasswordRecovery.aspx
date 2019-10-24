<%@ Page Title="" Language="C#" MasterPageFile="~/MyYugiohStore.Master" AutoEventWireup="true" CodeBehind="PasswordRecovery.aspx.cs" Inherits="MyYugiohStore.PasswordRecovery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="forgot">
        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" BackColor="#F7F7DE" 
            BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" 
            Font-Names="Verdana" Font-Size="10pt">
            <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
        </asp:PasswordRecovery>
    <div />
    
</asp:Content>
