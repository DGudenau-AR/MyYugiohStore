<%@ Page Title="" Language="C#" MasterPageFile="~/MyYugiohStore.Master" AutoEventWireup="true" CodeBehind="ItemDetails.aspx.cs" Inherits="MyYugiohStore.ItemDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Header">
        <asp:Label ID="Label1" runat="server" CssClass="PageHeader" Text="Item Details"></asp:Label>
        <br /><br />
    </div>

    <div id="Image">

        <asp:Image ID="Image1" runat="server" AlternateText="Image Not Available" />

        <br /><br />
    </div>

    <div id="Details">
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="70%" 
            AutoGenerateRows="False" BackColor="White" BorderColor="#DEDFDE" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
            <FooterStyle BackColor="#CCCC99" />
            <RowStyle BackColor="#F7F7DE" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <Fields>
                <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                <asp:BoundField DataField="RegularPrice" HeaderText="Regular Price" 
                    SortExpression="RegularPrice" DataFormatString="{0:c}" 
                    HtmlEncodeFormatString="False" HtmlEncode="False" />
                <asp:BoundField DataField="SalePrice" HeaderText="Sale Price" ReadOnly="True" 
                    SortExpression="SalePrice" DataFormatString="{0:c}" 
                    HtmlEncodeFormatString="False" HtmlEncode="False" />
                <asp:BoundField DataField="ReleaseDate" HeaderText="Release Date" 
                    SortExpression="ReleaseDate" />
                <asp:CheckBoxField DataField="FutureItem" HeaderText="FutureItem" 
                    SortExpression="FutureItem" Visible="False" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" 
                    SortExpression="Discount" Visible="False" />
                <asp:BoundField DataField="ImageURL" HeaderText="ImageURL" 
                    SortExpression="ImageURL" Visible="False" />
            </Fields>
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyYugiohStoreConnectionString %>" 
            SelectCommand="GetItemDetails" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="ItemID" QueryStringField="i" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    <div />

    <div id="Label">
        <asp:Label ID="lblNote" runat="server" 
            Text="Note: if the Release Date is displayed, the item is not yet available for purchase."></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Sorry, Item Not Found" 
            Visible="False"></asp:Label>
        <br /><br />            
    </div>

    <div id="AddToCart">
        <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" 
            onclick="btnAddToCart_Click1" />
    <div />       
    <br /><br />    
</asp:Content>
