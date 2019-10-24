using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;


namespace MyYugiohStore
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
        }
    }
}
