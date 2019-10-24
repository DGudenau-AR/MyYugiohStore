<%@ Page Title="" Language="C#" MasterPageFile="~/MyYugiohStore.Master" AutoEventWireup="true" CodeBehind="SpecItems.aspx.cs" Inherits="MyYugiohStore.SpecItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <asp:Label ID="Label1" runat="server" CssClass="PageHeader" Text="Sale Items"></asp:Label>
        <br /><br />
    </div>

    <div id="grid">

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyYugiohStoreConnectionString %>" 
            SelectCommand="GetSaleItemInfo" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>

    </div>
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="ItemID" DataSourceID="SqlDataSource1" 
            ForeColor="Black" GridLines="Vertical" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ItemID" Visible="False" />
                <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                <asp:BoundField DataField="RegularPrice" HeaderText="RegularPrice" 
                    SortExpression="RegularPrice" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" 
                    SortExpression="Discount" />
                <asp:CheckBoxField DataField="FutureItem" HeaderText="FutureItem" 
                    SortExpression="FutureItem" Visible="False" />
                <asp:ButtonField ButtonType="Button" Text="Select" SortExpression="ItemID" />
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>

    <div>
 <br /><br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="CategoryID" DataSourceID="SqlDataSource2" 
            ForeColor="Black" GridLines="Vertical" 
        onselectedindexchanged="GridView2_SelectedIndexChanged">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:BoundField DataField="Category" HeaderText="Category" 
                    SortExpression="Category" />
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="CategoryID" 
                    Visible="False" />
                <asp:ButtonField ButtonType="Button" Text="Select" 
                    SortExpression="CategoryID" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
       
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyYugiohStoreConnectionString %>" 
            SelectCommand="GetCategories" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        
    
    </div>

    <div>
        <br /><br />
        <asp:Button ID="btnOne" runat="server" Text="SelectOne" 
            onclick="btnOne_Click" />
        <br /><br />
        <asp:Button ID="btnTwo" runat="server" Text="SelectTwo" 
            onclick="btnTwo_Click" />
        <br /><br />
        <asp:Button ID="btnThree" runat="server" Text="SelectThree" 
            onclick="btnThree_Click" />
    </div>

    <br /><br />

</asp:Content>
