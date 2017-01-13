using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Catch_if_you_Misbehave.Common;

namespace Catch_if_you_Misbehave.User
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("User_Login.aspx");
            }
            if (Request.QueryString["msg"] == "invalid")
            {
                Alert.Show("Admin Not allow you to download the file");
            }
            if (!IsPostBack)
            {
                SqlCommand sqlSelect= new SqlCommand("select f.file_id, f.file_name, o.full_name as Owner_Name, a.status_name from [dbo].[File_Master] f, [dbo].[Access_Status] a,  [dbo].[Owner_Master] o where o.owner_id=a.owner_id and f.file_id=a.file_id and a.user_id=@user_id");
                SqlParameter[] sqlParameters =
                {
                    new SqlParameter("@user_id", Session["user_id"]),

                };
                var sqltype = CommandType.Text;
                DataTable dt = Database.GetDataTable(sqlSelect, sqlParameters, sqltype);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}