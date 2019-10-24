<%@ Page Title="" Language="C#" MasterPageFile="~/MyYugiohStore.Master" AutoEventWireup="true" CodeBehind="NewUser.aspx.cs" Inherits="MyYugiohStore.NewUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <asp:Label ID="Label1" runat="server" CssClass="PageHeader" 
            Text="Welcome New User"></asp:Label>
        <br /><br />

    </div>
    
    <div id="NewUser">
    
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
            CancelDestinationPageUrl="~/Index.aspx" 
            ContinueDestinationPageUrl="~/Index.aspx">
            <WizardSteps>
                <asp:CreateUserWizardStep runat="server" />
                <asp:CompleteWizardStep runat="server" />
            </WizardSteps>
        </asp:CreateUserWizard>
    
    </div>


</asp:Content>
