using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Managment_Office
{
    public partial class Reports : System.Web.UI.Page
    {
      public sciencedbEntities db = new sciencedbEntities();
        public List<managementByan> list=new List<managementByan>();
        public DateTime? From,To;
        public static string userRole="";
        protected void Page_Load(object sender, EventArgs e)
        {
            //get all byan from current month
            list = null;
            //list = db.managmentByans.Where(a => a.Isdeleted == false&&(a.DateExport.Value.Month==currentmonth||a.DateImport.Value.Month==currentmonth)).OrderByDescending(a=>a.ID).ToList();

            if (Session["role"] != null)
            { userRole = Session["role"].ToString(); }

            if (!IsPostBack)
            {

                var importsplaces = db.imports.ToList();
                imddl.DataSource = importsplaces;
                imddl.DataTextField = "importname";
                imddl.DataValueField = "id";
                imddl.DataBind();
                imddl.Items.Insert(0, string.Empty);
                

                var exportsplaces = db.exports.ToList();
                exportddl.DataSource = exportsplaces;
                exportddl.DataTextField = "exportPlaceName";
                exportddl.DataValueField = "id";
                 exportddl.DataBind();
                exportddl.Items.Insert(0, string.Empty);

                var folds = db.folders_table.ToList();
                DropDownList1.DataSource = folds;
                DropDownList1.DataTextField = "folder_Name";
                DropDownList1.DataValueField = "id";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, string.Empty);

                var qta3 = db.qt3at.ToList();
                qta3List.DataSource = qta3;
                qta3List.DataTextField = "name";
                qta3List.DataValueField = "id";
                qta3List.DataBind();
                qta3List.Items.Insert(0, string.Empty);
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
                {
                    if (userRole == "Admin")
                    {
                        dbs.managementByans.Remove(d);
                        dbs.SaveChanges();
                    }
                    else {
                        d.Isdeleted = true;
                        dbs.SaveChanges();
                }
                   
                }
            }
        }

      
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            try
            {
                bool isclosed = false;
                if (Closedr.Checked == true) isclosed = true;
                else if (unclose.Checked == true) isclosed = false;
                if (exportddl.SelectedValue != "")
                {
                    int s = int.Parse(exportddl.SelectedValue);
                    list = (from f in db.managementByans where f.exportId == s && f.Isdeleted == false select f).ToList();
                    if (imddl.SelectedValue != "")
                    {
                        int import = int.Parse(imddl.SelectedValue);
                        list = (from f in db.managementByans where f.exportId == s && f.impoertId == import && f.Isdeleted == false select f).ToList();
                        if (date.Value != "" && date1.Value != "")
                        {
                            From = Convert.ToDateTime(date.Value);
                            To = Convert.ToDateTime(date1.Value);
                            list = (from f in db.managementByans where ((f.DateExport >= From && f.DateExport <= To) || (f.DateImport >= From && f.DateImport <= To)) && f.exportId == s && f.impoertId == import && f.Isdeleted == false select f).ToList();
                        }
                    }
                    else if (date.Value != "" && date1.Value != "")
                    {
                        From = Convert.ToDateTime(date.Value);
                        To = Convert.ToDateTime(date1.Value);
                        list = (from f in db.managementByans where ((f.DateExport >= From && f.DateExport <= To) || (f.DateImport >= From && f.DateImport <= To)) && f.exportId == s && f.Isdeleted == false select f).ToList();
                    }
                }
                else if (imddl.SelectedValue != "")
                {
                    int import = int.Parse(imddl.SelectedValue);
                    list = (from f in db.managementByans where f.impoertId == import select f).ToList();
                    if (date.Value != "" && date1.Value != "")
                    {
                        From = Convert.ToDateTime(date.Value);
                        To = Convert.ToDateTime(date1.Value);
                        list = (from f in db.managementByans where ((f.DateExport >= From && f.DateExport <= To) || (f.DateImport >= From && f.DateImport <= To)) && f.impoertId == import && f.Isdeleted == false select f).ToList();
                    }
                }


                else if (exportddl.SelectedValue == "" && imddl.SelectedValue == "" && date.Value != "" && date1.Value != "")
                {
                    From = Convert.ToDateTime(date.Value);
                    To = Convert.ToDateTime(date1.Value);
                    list = (from f in db.managementByans where ((f.DateExport >= From && f.DateExport <= To) || (f.DateImport >= From && f.DateImport <= To)) && f.Isdeleted == false select f).ToList();

                }
            else list = db.managementByans.Where(a => a.Isdeleted == false).ToList();
            if (Closedr.Checked || unclose.Checked)
                {
                    list = list.Where(a => a.IsClosed == isclosed).ToList();
                }
                if (byantxt.Value != "")
                { list = list.Where(a => a.byanData.Contains(byantxt.Value)&&a.Isdeleted==false).ToList(); }
                if (qta3List.SelectedValue !="")
                {
                    string qta3_name = qta3func(qta3List.SelectedValue);
                    list = list.Where(a => a.qta3Name == (qta3_name)&&a.Isdeleted==false).ToList();
                }
                if (DropDownList1.SelectedValue != "")
                {
                    string items = DropDownList1.SelectedItem.ToString();
                    //var t = db.folders_table.Where(a => a.folder_Name.Contains(items)).ToList();
                    //if (t != null)
                    //{
                    //    foreach (var item in t)
                        { list = list.Where(a => a.folder_id == (int.Parse(DropDownList1.SelectedValue))&&a.Isdeleted==false).ToList(); }
                    //}
                }

            }
            catch { }
        }

        public string qta3func(string selected)
        {
            string d = ""; int se = int.Parse(selected);
            try { var name = (from m in db.qt3at where m.id == se select m.name).FirstOrDefault(); d = name; }
            catch { Response.Write("<script>alert('an error occured please refresh the page and try again!')</script>"); }
            return d;

        }
        //adding folder name
       

    }
}