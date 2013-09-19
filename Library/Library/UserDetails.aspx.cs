using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineDatingSystem.Data;
using OnlineDatingSystem.Models;

namespace OnlineDatingSystem
{
    public partial class UserDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            var userId = Request.Params["id"];
            if (userId == null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        public ApplicationUser UserDetailsFormView_GetUserInfo()
        {
            var userId = Request.Params["id"];
            ApplicationUser user = new ApplicationUser();
            if (userId == null)
            {
                //TODO: maybe redirect
            }
            else
            {
                ApplicationDbContext context = new ApplicationDbContext();

                user = context.Users.FirstOrDefault(x => x.Id == userId);
                if (user == null)
                {
                    throw new ArgumentException("User not in db");
                }
                else
                {
                    //
                }
            }

            return user;
        }

        public void UserDetailsFormView_UpdateUserInfo(string Id)
        {
            ApplicationDbContext context = new ApplicationDbContext();

            var user = context.Users.FirstOrDefault(x => x.Id == Id);
            if (user == null)
            {
                //TODO: User with id <edi-kakvo-si> was not found!
                return;
            }

            TryUpdateModel(user);

            if (ModelState.IsValid)
            {
                context.Entry(user).State = EntityState.Modified;
                context.SaveChanges();
            }
        }

        protected void UploadProfileImage_OnClick(object sender, EventArgs e)
        {
            ApplicationDbContext context = new ApplicationDbContext();
            var userId = Request.Params["id"];
            var user = context.Users.FirstOrDefault(x => x.Id == userId);
            if (user == null)
            {
                throw new ArgumentException("User not in db");
            }

            FileUpload upload = (FileUpload)UserDetailsFormView.FindControl("ProfilePhotoFileUpload");
            if (upload.HasFile)
            {
                user.Photo = null;
                user.Photo = this.GetUploadedFile(upload.PostedFile);
            }
            context.SaveChanges();

            Response.Redirect(Request.RawUrl);
        }

        private byte[] GetUploadedFile(HttpPostedFile postedFile)
        {
            if (postedFile != null)
            {
                //Create byte Array with file len
                byte[] data = new Byte[postedFile.ContentLength];

                //force the control to load data in array
                postedFile.InputStream.Read(data, 0, postedFile.ContentLength);

                return data;
            }

            return null;
        }
    }
}