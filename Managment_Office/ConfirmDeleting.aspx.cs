using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Managment_Office
{
    public partial class ConfirmDeleting : System.Web.UI.Page
    {
        public sciencedbEntities db = new sciencedbEntities();
        public List<managementByan> lists = new List<managementByan>();
        public static string userRole = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            lists = db.managementByans.Where(a=>a.Isdeleted==true).ToList();
            if (Session["role"] != null)
            { userRole = Session["role"].ToString();
            }
            
            }
        [WebMethod]
        public static void delfunctionconfirm(int? delid)
        {
            if (delid != null)
            {
                sciencedbEntities dbs = new sciencedbEntities();
                var d = dbs.managementByans.Where(a => a.ID == delid).FirstOrDefault();
                if (d != null)
                { dbs.managementByans.Remove(d);
                        dbs.SaveChanges();
                 
                }
            }
        }
[WebMethod]
        public static void recyclefun(int? delid)
        {
            if (delid != null)
            {
                sciencedbEntities dbs = new sciencedbEntities();
                var d = dbs.managementByans.Where(a => a.ID == delid).FirstOrDefault();
                if (d != null)
                {
                    d.Isdeleted = false;
                    dbs.SaveChanges();
                }
            }
        }

    }
}