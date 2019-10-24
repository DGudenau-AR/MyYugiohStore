<%@ Page Title="" Language="C#" MasterPageFile="~/MyYugiohStore.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MyYugiohStore.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Header">
        <asp:Label ID="Label1" runat="server" CssClass="PageHeader" Text="Featured Items"></asp:Label>
        <br /><br />
    </div>
    <div id="Item">
        <table border="0" cellpadding="5" cellspacing="0" width="100%">
            <tr>
                <td><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/Sale.gif" 
                        PostBackUrl="~/SpecialItem.aspx" AlternateText="Sale Items"/></td>
                <td><asp:ImageButton ID="ImageButton2" runat="server" 
                        ImageUrl="~/Images/WarriorsStrike.gif" AlternateText="Structure Decks" 
                        onclick="ImageButton2_Click"/></td>
                <td><asp:ImageButton ID="ImageButton3" runat="server" 
                        ImageUrl="~/Images/CollectibleTin2009Wave2.gif" 
                        AlternateText="Collectible Tins" onclick="ImageButton3_Click"/></td>
            </tr>
            <tr>
                <td><asp:ImageButton ID="ImageButton4" runat="server" 
                        ImageUrl="~/Images/AncientProphecy.gif" AlternateText="Individual Packs" 
                        onclick="ImageButton4_Click" /></td>
                <td><asp:ImageButton ID="ImageButton5" runat="server" 
                        ImageUrl="~/Images/RetroPack2.gif" AlternateText="Special Packs and Sets" 
                        onclick="ImageButton5_Click" /></td>
                <td><asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/Images/Card.jpg" 
                        AlternateText="Individual Cards" Height="90px" Width="60px" ImageAlign="Middle" 
                        onclick="ImageButton6_Click"/></td>
            </tr>  
<!---      
            <tr>
                <td><asp:ImageButton ID="ImageButton7" runat="server" /></td>
                <td><asp:ImageButton ID="ImageButton8" runat="server" /></td>
                <td><asp:ImageButton ID="ImageButton9" runat="server" onclientclick="DoPopup();return false" /></td>
            </tr>
--->        
        </table>
        <br /><br />
    </div>
    <div id="About us">
   
       <asp:TextBox ID="TextBox1" runat="server"
            Text="Welcome to DennisG's Yu-Gi-Oh! Store. We've been providing excellent service to people like you since 09/2009. We are know for our large selection of Yu-Gi-Oh! cards, tins, packs and more. We hope you enjoy shopping with us as we strive to provide superior customer service to our valued clientelle. Check back regularly as our sale items change weekly. You never know what items will go on sale! " 
            Height="100px" Width="100%" CssClass="Legal" Rows="5" TextMode="MultiLine">Welcome to DennisG&#39;s Yu-Gi-Oh! Store. We&#39;ve been providing excellent service to people like you since 09/2009. We are know for our large selection of Yu-Gi-Oh! cards, tins, packs and more. We hope you enjoy shopping with us as we strive to provide superior customer service to our valued clientelle. Check back regularly as our sale items change weekly. You never know what items will go on sale! </asp:TextBox>
  
    <div />
    <br /><br />
 
 
 

</asp:Content>
