using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Collections;

namespace MyYugiohStore
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cFunctions oFunctions = new cFunctions();
            int count = 0;

            try
            {
                if (Membership.GetUser().ToString().Trim() == string.Empty)
                {
                    Response.Redirect("Login.aspx");
                }
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }

            Session["UserName"] = Membership.GetUser().ToString().Trim();

            try
            {
                if (Request.QueryString["m"].ToString().Trim() == "y")
                {
                    DeleteAll();
                }
            }
            catch
            {
                Response.Redirect("Index.aspx");
            }

            count = oFunctions.GetCount("SELECT count(*) from dbo.ShoppingCart WHERE (UserName = '" + Membership.GetUser().ToString().Trim() + "') AND (Active = 1)");
            if (count == 0)
            {
                this.lblEmptyCart.Visible = true;
                this.btnCheckout.Enabled = false;
                this.btnRemoveAll.Enabled = false;
            }
            else
            {
                this.lblEmptyCart.Visible = false;
                this.btnCheckout.Enabled = true;
                this.btnRemoveAll.Enabled = true;
            }

            string sum2 = oFunctions.GetString("SELECT SUM(Items.RegularPrice * Items.Discount / 100) AS Expr1 FROM ShoppingCart INNER JOIN Items ON ShoppingCart.ItemID = Items.ItemID WHERE (ShoppingCart.UserName = '" + Membership.GetUser().ToString().Trim() + "') AND (ShoppingCart.Active = 1)");
            if (sum2 == string.Empty)
                this.lblOrderTotal.Text = " ";
            else
                this.lblOrderTotal.Text = String.Format("Order Total: {0:c}", Convert.ToDouble(sum2));           
        }

        private void DeleteAll()
        {
            cFunctions ocFunctions = new cFunctions();
            Hashtable oHashtable = new Hashtable();

            // Add User Name to Hash table
            oHashtable.Add("@UserName", Session["UserName"].ToString().Trim());
            ocFunctions.RunSprocBool("RemoveAllFromCart", oHashtable);
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx?f=y");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            cFunctions ocFunctions = new cFunctions();
            Hashtable oHashtable = new Hashtable();

            oHashtable.Add("@ShoppingCartID", this.GridView1.SelectedValue.ToString().Trim());
            ocFunctions.RunSprocBool("RemoveFromCart", oHashtable);
            Response.Redirect("ShoppingCart.aspx?m=n");
        }

        protected void btnRemoveAll_Click(object sender, EventArgs e)
        {
            cFunctions ocFunctions = new cFunctions();
            Hashtable oHashtable = new Hashtable();

            oHashtable.Add("@UserName", Membership.GetUser().ToString().Trim());
            ocFunctions.RunSprocBool("RemoveAllFromCart", oHashtable);
            Response.Redirect("ShoppingCart.aspx?m=n");

        }

    }
}
