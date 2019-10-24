<%@ Page Title="" Language="C#" MasterPageFile="~/MyYugiohStore.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="MyYugiohStore.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Header">
        <asp:Label ID="Label1" runat="server" CssClass="PageHeader" Text="Please Enter Shipping Information"></asp:Label>
        <br /><br />
    </div>

    <div id="form">
            <table border="0" cellpadding="5" cellspacing="0">
             <tr>
                <td class="FormText">* First Name</td>
                <td>
                    <asp:TextBox ID="txtFirst" runat="server" Columns="20" CssClass="FormText" MaxLength="20"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtFirst" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="FormText">&nbsp;&nbsp;MI</td>
                <td>
                    <asp:TextBox ID="txtMI" runat="server" Columns="1" CssClass="FormText" 
                        MaxLength="1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="FormText">* Last Name</td>
                <td>
                    <asp:TextBox ID="txtLast" runat="server" Columns="20" CssClass="FormText" MaxLength="20"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtLast" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
           <tr>
                <td class="FormText">* Address</td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" Columns="60" CssClass="FormText" MaxLength="50"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAddress" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="FormText">* City</td>
                <td>
                    <asp:TextBox ID="txtCity" runat="server" Columns="60" CssClass="FormText" MaxLength="25"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCity" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>       
            <tr>
                <td class="FormText">* State</td>
                <td>
                    <asp:TextBox ID="txtState" runat="server" Columns="2" CssClass="FormText" MaxLength="2"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtState" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>   
            <tr>
                <td class="FormText">* Zip Code</td>
                <td>
                    <asp:TextBox ID="txtZip" runat="server" Columns="11" CssClass="FormText" MaxLength="10"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtZip" ErrorMessage="Invalid Zip Code" ValidationExpression="\d{5}(-\d{4})?"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="Required" ControlToValidate="txtZip"></asp:RequiredFieldValidator>
                </td>
            </tr>
                        <tr>
                <td class="FormText">* Phone Number</td>
                <td>                
                    <asp:TextBox ID="txtPhone" runat="server" Columns="19" CssClass="FormText" 
                        MaxLength="18"></asp:TextBox>Ex:(800)555-1212
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtPhone" ErrorMessage="Invalid Phone Number format" 
                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="Required" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
               </td>
            </tr>
            <tr>
                <td class="FormText">* email address</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Columns="41" CssClass="FormText" 
                        MaxLength="40"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Invalid email format" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="Required" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td></td>
                <td><asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        onclick="btnSubmit_Click" /></td>
                <td></td>
            </tr>                          
        </table>
    </div>
    
    <div id="Alert">
        <asp:Label ID="alertMsg" runat="server" CssClass="Alert" Text="* Indicates a required field." Visible="False"></asp:Label>
    </div>
    
    <div id="ErrorMsg">
        <br />
        <asp:Label ID="lblError" runat="server" CssClass="PageHeader" Text=" " Visible="False"></asp:Label>
        <br />
    </div>



</asp:Content>
