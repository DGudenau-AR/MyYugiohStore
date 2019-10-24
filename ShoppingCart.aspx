<%@ Page Title="" Language="C#" MasterPageFile="~/MyYugiohStore.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="MyYugiohStore.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Header">
        <asp:Label ID="Label1" runat="server" CssClass="PageHeader" Text="Shopping Cart"></asp:Label>
        <br /><br />
    </div>

    <div id="EmptyCart">
        <asp:Label ID="lblEmptyCart" runat="server" CssClass="PageHeader" Text="There are no items in your shopping cart." Visible="False"></asp:Label>
        <br /><br />
    </div>
    <div id="Cart">
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="ShoppingCartID" DataSourceID="SqlDataSource1" 
            ForeColor="Black" GridLines="Vertical" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                <asp:BoundField DataField="SalePrice" HeaderText="Sale Price" ReadOnly="True" 
                    SortExpression="SalePrice" DataFormatString="{0:c}" HtmlEncode="False" />
                <asp:BoundField DataField="Category" HeaderText="Category" 
                    SortExpression="Category" />
                <asp:BoundField DataField="ShoppingCartID" HeaderText="ShoppingCartID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ShoppingCartID" 
                    Visible="False" />
                <asp:CommandField ButtonType="Button" SelectText="Remove" 
                    ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyYugiohStoreConnectionString %>" 
            SelectCommand="GetShoppingCart" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br /><br />
    </div>

    <div>
    <asp:Label ID="lblOrderTotal" runat="server" CssClass="PageHeader" Text=""></asp:Label>        
        <br /><br />
    </div>    
    
    <table border="0" cellpadding="5" cellspacing="0" width="100%">
        <tr>
            <td>
                <asp:Button ID="btnCheckout" runat="server" Text="Checkout" 
                    onclick="btnCheckout_Click" />
            </td>

            <td align="right">
                <asp:Button ID="btnRemoveAll" runat="server" Text="Remove All" 
                    OnClientClick="javascript:confirm_delete()" onclick="btnRemoveAll_Click" />
            </td>
        </tr>
    </table> 
    <br /><br />

</asp:Content>
