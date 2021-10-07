using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Managment_Office
{
    public partial class AddUser : System.Web.UI.Page
    { public static string userRole = "";
        public List<userss> listUsers = new List<userss>();
        public sciencedbEntities db = new sciencedbEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null)
            {
                if (Session["role"].ToString() != "Admin")
                {
                    Response.Redirect("MainPage.aspx");
                }
            }
            else Response.Redirect("Login.aspx");
            listUsers = db.usersses.ToList();
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["editid"]))
                {
                    int id = int.Parse(Request.QueryString["editid"].ToString());
                    var r = db.usersses.Where(a => a.id == id).FirstOrDefault();
                    if (r != null)
                    {
                       // ddl.SelectedValue = r.Role;
                        if (r.Role == "Admin")
                        {
                            ddl.SelectedValue = "Admin";
                        }
                        else { ddl.SelectedValue = "user"; }
                        username.Value = r.user_name;
                        name.Value = r.name;
                        password.Value = r.password;

                    }

                }
            }
        }
        [WebMethod]
        public static void delfunctionconfirm(int? delid)
        {
            if (delid != null)
            {
                sciencedbEntities dbs = new sciencedbEntities();
                var d = dbs.usersses.Where(a => a.id == delid).FirstOrDefault();
                if (d != null)
                { dbs.usersses.Remove(d);
                  dbs.SaveChanges();
                }
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["editid"]))
            { int id = int.Parse(Request.QueryString["editid"].ToString());
                var r = db.usersses.Where(a => a.id == id).FirstOrDefault();
                if (r != null)
                {
                   r.user_name= username.Value;
                  r.name=  name.Value;
                   r.password= password.Value;
                   r.Role= ddl.SelectedValue;
                    db.SaveChanges();
                } 
                
            }
            else //add
            {
                userss i = new userss
                {
                    user_name=username.Value,
                    name = name.Value,
                    password = password.Value,
                    Role = ddl.SelectedValue

                };
                db.usersses.Add(i);
                db.SaveChanges();
            }
            Page.ClientScript.RegisterStartupScript(
           GetType(),
              "MyKey",
             "s()",
             true);
        }
    }
}