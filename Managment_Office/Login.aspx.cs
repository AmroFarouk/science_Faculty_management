using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Managment_Office
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["user"] = null;

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            sciencedbEntities db = new sciencedbEntities();
            var user = db.usersses.Where(a => a.user_name == username.Value).FirstOrDefault();
            if (user != null)
            {
                if (password.Value == user.password)
                {
                    Session["user"] = user.name;
                    Session["role"] = user.Role;
                   
                    Response.Redirect("MainPage.aspx");
                }
                else { Response.Write("<script>alert('كلمة المرور غير صحيحة')</script>"); password.Value = ""; }
            }
            else { Response.Write("<script>alert('اسم المستخدم غير صحيح')</script>"); username.Value = ""; }

            //if (username.Value == "PU_user1")
            //{
            //    if (password.Value == "user1_123")
            //    {
            //        Session["user"] = username.Value;
            //        Session["role"] = ;
            //        Response.Redirect("MainPage.aspx");
            //    }
            //    else { Response.Write("<script>alert('كلمة المرور غير صحيحة')</script>"); password.Value = ""; }

            //}
            //else { Response.Write("<script>alert('اسم المستخدم غير صحيح')</script>"); username.Value = ""; }
        }
    }
}