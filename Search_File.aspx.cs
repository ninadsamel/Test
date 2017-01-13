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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("User_Login.aspx");
            }
            if (!IsPostBack)
            {
                string query =
                    "select f.file_id, o.full_name, f.file_name, f.upload_date, f.description from File_Master f, Owner_Master o where f.owner_id=o.owner_id";
                GridView1.DataSource = Database.Getdata(query);
                GridView1.DataBind();
            }

            if (Request.QueryString["msg"] == "send")
            {
                int file_id = Convert.ToInt32(Request.QueryString["file_id"]);

                SqlCommand selectOwner = new SqlCommand("select owner_id from File_Master where file_id=@file_id");
                SqlParameter[] sqlParameters =
                {
                    new SqlParameter("@file_id",file_id), 
                };
                var sqltype = CommandType.Text;
                DataTable ownerInfo = Database.GetDataTable(selectOwner, sqlParameters, sqltype);
                int owner_id = Convert.ToInt32(ownerInfo.Rows[0]["owner_id"]);

                SqlCommand requestExist = new SqlCommand("select *  from Access_Status where file_id=@file_id and user_id=@user_id");
                SqlParameter[] sqlRequestPara =
                {
                    new SqlParameter("@file_id",file_id), 
                    new SqlParameter("@user_id",Session["user_id"]), 
                };

                DataTable AccessRequestInfo = Database.GetDataTable(requestExist, sqlRequestPara, sqltype);

                if (AccessRequestInfo.Rows.Count > 0)
                {
                    Alert.Show("Access Request Already Send");
                }
                else
                {
                    SqlCommand InsertRequest = new SqlCommand("insert into Access_Status values(@user_id, @file_id,@owner_id,@status,@status_name)");
                    SqlParameter[] InsertPara =
                {
                    new SqlParameter("@user_id",Session["user_id"]), 
                    new SqlParameter("@file_id",file_id), 
                    new SqlParameter("@owner_id",owner_id), 
                    new SqlParameter("@status",Convert.ToInt32(1)), 
                    new SqlParameter("@status_name","Pending"), 
                };   
                    Database.InsertData(InsertRequest, InsertPara,sqltype);
                    Alert.Show("Access Request Send Successfully");
                }

                
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //SqlCommand FileInfo = new SqlCommand("select f.file_id, o.full_name, f.file_name, f.upload_date, f.file_path from File_Master f, Owner_Master o where f.owner_id=o.owner_id and f.description like '%  @SearchVal  %'");
            //SqlParameter[] sqlParameters =
            //{
            //    new SqlParameter("@SearchVal",txtSearch.Text.Trim()), 
            //};
            //var sqltype = CommandType.Text;
            string query="select f.file_id, o.full_name, f.file_name, f.upload_date, f.file_path from File_Master f, Owner_Master o where f.owner_id=o.owner_id and f.description like '%"  +txtSearch.Text+ "%'";
            DataTable fileInfo = Database.Getdata(query);
            if(fileInfo.Rows.Count>0)
            {
            GridView1.DataSource = fileInfo;
            GridView1.DataBind();
            }
            else
            {
                Alert.Show("No Data Found");
                txtSearch.Text = string.Empty;
            }
        }
    }
}