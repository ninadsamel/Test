using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Catch_if_you_Misbehave.Common;

namespace Catch_if_you_Misbehave.User
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("User_Login.aspx");
            }
            if (!IsPostBack)
            {
                if (Request.QueryString["msg"] == "send")
                {
                    Alert.Show("Your Query Send Successfully");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlCommand sqlinsert = new SqlCommand("insert into User_Queries values(@user_id,@owner_id,@subject,@description)");
            SqlParameter[] sqlParameters =
            {
                new SqlParameter("@user_id", Session["user_id"]),
                new SqlParameter("@owner_id",ddlownername.SelectedValue), 
                new SqlParameter("@subject",txtsubject.Text), 
                new SqlParameter("@description",txtdescription.Text), 
            };
            var sqltype = CommandType.Text;
            Database.InsertData(sqlinsert,sqlParameters,sqltype);
            Response.Redirect("Send_Query.aspx?msg=send");
        }
    }
}