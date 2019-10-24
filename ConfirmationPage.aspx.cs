using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Web.Security;


namespace MyYugiohStore
{
    public partial class ConfirmationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.lblFirst.Text = Session["First"].ToString().Trim();
                this.lblMI.Text = Session["MI"].ToString().Trim();
                this.lblLast.Text = Session["Last"].ToString().Trim();
                this.lblAddress.Text = Session["Address"].ToString().Trim();
                this.lblCity.Text = Session["City"].ToString().Trim();
                this.lblState.Text = Session["State"].ToString().Trim();
                this.lblZip.Text = Session["Zip"].ToString().Trim();
                this.lblPhone.Text = Session["Phone"].ToString().Trim();
                this.lblEmail.Text = Session["Email"].ToString().Trim();
            }
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

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx?f=n");
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            cFunctions ocFunctions = new cFunctions();
            Hashtable oHashtable = new Hashtable();
            int count = 0;

            oHashtable.Add("@UserName", Session["UserName"].ToString().Trim());
            oHashtable.Add("@FirstName", Session["First"].ToString().Trim());
            oHashtable.Add("@LastName", Session["Last"].ToString().Trim());
            oHashtable.Add("@MI", Session["MI"].ToString().Trim());
            oHashtable.Add("@Address", Session["Address"].ToString().Trim());
            oHashtable.Add("@City", Session["City"].ToString().Trim());
            oHashtable.Add("@State", Session["State"].ToString().Trim());
            oHashtable.Add("@ZipCode", Session["Zip"].ToString().Trim());
            oHashtable.Add("@PhoneNumber", Session["Phone"].ToString().Trim());
            oHashtable.Add("@Email", Session["Email"].ToString().Trim());

            // See if user record exists already
            count = ocFunctions.GetCount("SELECT count(*) from dbo.UserDetails WHERE UserName = '" + Membership.GetUser().ToString().Trim() + "'");
            if (count == 0)
            {
                // Add User Details for new user
                ocFunctions.RunSprocBool("AddUserDetails", oHashtable);
            }
            else
            {
                // Update User Details for exisiting user            
                ocFunctions.RunSprocBool("UpdateUserDetails", oHashtable);
            }
            
            // Add to Orders
            oHashtable.Clear();
            oHashtable.Add("@UserName", Session["UserName"].ToString().Trim());
            ocFunctions.RunSprocBool("PlaceOrder", oHashtable);

            Response.Redirect("ThankYou.aspx");
        }
    }
}
