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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["msg"] == "logout")
            {
                Session["user_id"] = null;
                Alert.Show("You are Logout Successfully");

            }
            if (Request.QueryString["msg"] == "add")
            {
                Alert.Show("User Successfully Register");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlCommand sqlSelect = new SqlCommand("select * from user_Master where username=@username and password=@password");
            SqlParameter[] sqlParameter =
            {
                new SqlParameter("@username", txtusername.Text),
                new SqlParameter("@password",txtpassword.Text), 
            };
            var sqltype = CommandType.Text;
            DataTable selectUser = Database.GetDataTable(sqlSelect, sqlParameter, sqltype);
            if (selectUser.Rows.Count > 0)
            {
                Session["user_id"] = Convert.ToString(selectUser.Rows[0]["user_id"]);
                Response.Redirect("Home.aspx");
            }
            else
            {
                Alert.Show("Invalid username or password");
                txtusername.Text = txtpassword.Text = string.Empty;
                txtusername.Focus();
            }
        }
    }
}