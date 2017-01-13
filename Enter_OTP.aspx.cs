using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Catch_if_you_Misbehave.Common;

namespace Catch_if_you_Misbehave.User
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("User_Login.aspx");
            }
            int file_id = Convert.ToInt32(Request.QueryString["file_id"]);
            Session["file_id"] = file_id;
            if (!IsPostBack)
            {

                SqlCommand sqlSelect = new SqlCommand("select status_name from Access_Status where file_id=@file_id and user_id=@user_id");
                SqlParameter[] sqlParameters =
                {
                    new SqlParameter("@file_id",file_id), 
                    new SqlParameter("@user_id",Session["user_id"]), 
                };
                var sqltype = CommandType.Text;
                DataTable dt = Database.GetDataTable(sqlSelect, sqlParameters, sqltype);
                string status = Convert.ToString(dt.Rows[0]["status_name"]);
                if (status != "Allow")
                {
                    Response.Redirect("View_File_Status.aspx?msg=invalid");
                }
                else
                {
                    var chars = "QWERTYUIOPLKJHGFDASZXCVBNMqwertyuioplkjhgfdsazxcvbnm1234567890";
                    var stringargs = new char[16];
                    var random = new Random();
                    for (int i = 0; i < stringargs.Length; i++)
                    {
                        stringargs[i] = chars[random.Next(stringargs.Length)];

                    }
                    string Key = new String(stringargs);

                    SqlCommand File_Update = new SqlCommand("update File_Master set otp=@otp where file_id=@file_id");
                    SqlParameter[] sqlpara =
                    {
                        new SqlParameter("@otp",Key), 
                        new SqlParameter("@file_id",file_id), 
                    };
                    Database.InsertData(File_Update, sqlpara, sqltype);

                    string selectEmail = "select email_id from User_Master where user_id='"+Session["user_id"]+"'";
                    DataTable emailAdd = Database.Getdata(selectEmail);
                    string emailId = Convert.ToString(emailAdd.Rows[0]["email_id"]);

                    try
                    {
                        SmtpClient SmtpServer = new SmtpClient();
                        MailMessage mail = new MailMessage();
                        SmtpServer.Credentials = new System.Net.NetworkCredential("catch.me.if.you.misbehave@gmail.com", "C@tchMeif123");
                        SmtpServer.Port = 587;
                        SmtpServer.EnableSsl = true;
                        SmtpServer.Host = "smtp.gmail.com";
                        mail = new MailMessage();
                        mail.From = new MailAddress("catch.me.if.you.misbehave@gmail.com");

                        mail.To.Add(emailId);
                        mail.Subject = "OTP for File Access";
                        mail.Body = "This is to inform you that system send you a OTP for File Access. OTP is '" + Key + "' ";
                        SmtpServer.Send(mail);
                        Alert.Show("Please Check your Mail For OTP");

                    }
                    catch (Exception ex)
                    {
                        Alert.Show("mail Sending fail");

                    }


                }
            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            string selectFile= "select * from File_Master where file_id='"+Session["file_id"]+"'";
            DataTable fileInfo = Database.Getdata(selectFile);
            string otp = Convert.ToString(fileInfo.Rows[0]["otp"]);

            if (otp == txtotp.Text)
            {
                string filePath = Convert.ToString(fileInfo.Rows[0]["file_path"]);
                string key = Convert.ToString(fileInfo.Rows[0]["encrypt_key"]);
                string output = Convert.ToString(fileInfo.Rows[0]["file_name"]);

                string inputFile = Server.MapPath("~/Files/") + filePath;
                string outputFile = Server.MapPath("~/Files/") + output;

                this.Decrypt(key, inputFile, outputFile);
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(outputFile));
                Response.WriteFile(outputFile);
                Response.Flush();
                Alert.Show("File Downloaded Successfully");
                txtotp.Text = string.Empty;

            }
            else
            {
                Alert.Show("Please Enter Correct OTP");
                txtotp.Text = string.Empty;
            }
        }

        private void Decrypt(string key, string inputFilePath, string outputfilePath)
        {
            string EncryptionKey = key;
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (FileStream fsInput = new FileStream(inputFilePath, FileMode.Open))
                {
                    using (CryptoStream cs = new CryptoStream(fsInput, encryptor.CreateDecryptor(), CryptoStreamMode.Read))
                    {
                        using (FileStream fsOutput = new FileStream(outputfilePath, FileMode.Create))
                        {
                            int data;
                            while ((data = cs.ReadByte()) != -1)
                            {
                                fsOutput.WriteByte((byte)data);
                            }
                        }
                    }
                }
            }
        }
    }
}