<%@ Page Title="" Language="C#" MasterPageFile="~/MyYugiohStore.Master" AutoEventWireup="true" CodeBehind="ConfirmationPage.aspx.cs" Inherits="MyYugiohStore.ConfirmationPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Header">
        <asp:Label ID="Label1" runat="server" CssClass="PageHeader" 
            Text="Please Confirm Your User Information"></asp:Label>
        <br /><br />
    </div>

    <div id="contact info">

        <br />
        <asp:Label ID="lblFirst" CssClass="UserInfo" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblMI" CssClass="UserInfo" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblLast" CssClass="UserInfo" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblAddress" CssClass="UserInfo" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblCity" CssClass="UserInfo" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblState" CssClass="UserInfo" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblZip" CssClass="UserInfo" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblPhone" CssClass="UserInfo" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblEmail" CssClass="UserInfo" runat="server" Text=""></asp:Label>
    
        <br /><br />
    </div>
    
    <div>
        <table border="0" cellpadding="5" cellspacing="0" width="100%">
            <tr>
                <td>
                    <asp:Button ID="btnEdit" runat="server" Text="Edit User Info" 
                        onclick="btnEdit_Click" />
                </td>

                <td align="right">
                    <asp:Button ID="btnConfirm" runat="server" Text="Confirm" 
                        onclick="btnConfirm_Click" />
                </td>
            </tr>
        </table>    
    </div>

</asp:Content>
