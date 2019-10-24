<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Legal.ascx.cs" Inherits="MyYugiohStore.Legal" %>
<table border="0" cellpadding="5" cellspacing="0" width="100%">
    <tr>
        <td class="Legal"><asp:HyperLink ID="hlLegal" runat="server" NavigateUrl="~/Legal.aspx?t=1" CssClass="Legal">Legal</asp:HyperLink></td>
        <td class="Legal"><asp:HyperLink ID="hlTerms" runat="server" NavigateUrl="~/Legal.aspx?t=2" CssClass="Legal">Terms of Agreement</asp:HyperLink></td>
        <td class="Legal"><asp:HyperLink ID="hlPrivacy" runat="server" NavigateUrl="~/Legal.aspx?t=3" CssClass="Legal">Privacy Policy</asp:HyperLink></td>
        <td class="Legal"><asp:HyperLink ID="hlHelp" runat="server" NavigateUrl="~/Legal.aspx?t=4" CssClass="Legal">Help</asp:HyperLink></td>
        <td class="Legal"><asp:HyperLink ID="hlContact" runat="server" NavigateUrl="~/Legal.aspx?t=5" CssClass="Legal">Contact Us</asp:HyperLink></td>
    </tr>
</table>
