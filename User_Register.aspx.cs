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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlCommand ownerExist = new SqlCommand("select * from User_Master where username=@username or email_id=@email_id");
            SqlParameter[] sqlParameters =
            {
                new SqlParameter("@username", txtusername.Text),
                new SqlParameter("@email_id", txtemail_id.Text),
            };
            var sqlType = CommandType.Text;
            DataTable DTExist = Database.GetDataTable(ownerExist, sqlParameters, sqlType);
            if (DTExist.Rows.Count > 0)
            {
                Alert.Show("User Already Exist");
            }
            else
            {
                SqlCommand ownerInsert = new SqlCommand("insert into User_Master values(@full_name, @username,@password,@contact_no,@email_id,@qualification)");
                SqlParameter[] sqlInsertPara =
                {
                    new SqlParameter("@full_name",txtfullname.Text), 
                    new SqlParameter("@username",txtusername.Text), 
                    new SqlParameter("@password",txtpassword.Text), 
                    new SqlParameter("@contact_no",txtcontact_no.Text), 
                    new SqlParameter("@email_id",txtemail_id.Text), 
                    new SqlParameter("@qualification",txtqualification.Text), 
                };
                Database.InsertData(ownerInsert, sqlInsertPara, sqlType);
                Response.Redirect("User_Login.aspx?msg=add");

            }
        }
    }
}