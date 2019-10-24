using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Web.Security;
using System.Data;

namespace MyYugiohStore
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // If posting back (i.e. button press), don't perform this code
            {
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
                    if (Request.QueryString["f"].ToString().Trim() == string.Empty)
                    {
                        Response.Redirect("Checkout.aspx?f=y");
                    }
                }
                catch
                {
                    Response.Redirect("Checkout.aspx?f=y");
                }

                if (Request.QueryString["f"].ToString().Trim() == "n")
                {
                    // Get User Info from session
                    this.txtFirst.Text = Session["First"].ToString().Trim();
                    this.txtMI.Text = Session["MI"].ToString().Trim();
                    this.txtLast.Text = Session["Last"].ToString().Trim();
                    this.txtAddress.Text = Session["Address"].ToString().Trim();
                    this.txtCity.Text = Session["City"].ToString().Trim();
                    this.txtState.Text = Session["State"].ToString().Trim();
                    this.txtZip.Text = Session["Zip"].ToString().Trim();
                    this.txtPhone.Text = Session["Phone"].ToString().Trim();
                    this.txtEmail.Text = Session["Email"].ToString().Trim();
                }
                else
                {
                    // Get User Info from Database if it exists
                    try
                    {
                        Hashtable oHash = new Hashtable();
                        DataSet sqlDataSet;
                        cFunctions ocFunctions = new cFunctions();

                        oHash.Add("@UserName", Session["UserName"].ToString().Trim());
                        sqlDataSet = ocFunctions.RunSprocDataSet("GetUserDetails", oHash);

                        // get data from data set
                        this.txtFirst.Text = sqlDataSet.Tables[0].Rows[0]["FirstName"].ToString().Trim();
                        this.txtMI.Text = sqlDataSet.Tables[0].Rows[0]["MI"].ToString().Trim();
                        this.txtLast.Text = sqlDataSet.Tables[0].Rows[0]["LastName"].ToString().Trim();
                        this.txtAddress.Text = sqlDataSet.Tables[0].Rows[0]["Address"].ToString().Trim();
                        this.txtCity.Text = sqlDataSet.Tables[0].Rows[0]["City"].ToString().Trim();
                        this.txtState.Text = sqlDataSet.Tables[0].Rows[0]["State"].ToString().Trim();
                        this.txtZip.Text = sqlDataSet.Tables[0].Rows[0]["ZipCode"].ToString().Trim();
                        this.txtPhone.Text = sqlDataSet.Tables[0].Rows[0]["PhoneNumber"].ToString().Trim();
                        this.txtEmail.Text = sqlDataSet.Tables[0].Rows[0]["Email"].ToString().Trim();
                        this.lblError.Visible = false;
                    }
                    catch
                    {
                        this.lblError.Text = "Note: No shipping information found for current user.";
                        this.lblError.Visible = true;
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Response.Write(this.txtFirst.Text.ToString().Trim());
            // Response.End();
            Session["First"] = this.txtFirst.Text.ToString().Trim();
            Session["Last"] = this.txtLast.Text.ToString().Trim();
            Session["MI"] = this.txtMI.Text.ToString().Trim();
            Session["Address"] = this.txtAddress.Text.ToString().Trim();
            Session["City"] = this.txtCity.Text.ToString().Trim();
            Session["State"] = this.txtState.Text.ToString().Trim();
            Session["Zip"] = this.txtZip.Text.ToString().Trim();
            Session["Phone"] = this.txtPhone.Text.ToString().Trim();
            Session["Email"] = this.txtEmail.Text.ToString().Trim();

            //  Response.Redirect("ConfirmationPage.aspx?i=" + this.txtFirst.Text.ToString().Trim());
            Response.Redirect("ConfirmationPage.aspx");

        }
    }
}
