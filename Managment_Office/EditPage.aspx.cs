using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Managment_Office
{
    public partial class EditPage : System.Web.UI.Page
    {
        public sciencedbEntities db = new sciencedbEntities();
        protected string username = "";
        protected string exportchoose = "", importchoose = "";
        protected int importId = 0, exportId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                username = Session["user"].ToString();
            }
            else Response.Redirect("Login.aspx");
           
            if (!IsPostBack)
            { if (!string.IsNullOrEmpty(Request.QueryString["editId"]))
                {
                    int editid = int.Parse(Request.QueryString["editId"]);
                    var d = db.managementByans.Where(a => a.ID == editid).FirstOrDefault();
                    if (d != null)
                    {
                        textbyan.Value = d.byanData;
                        txtSearch.Text = d.ExportPlace;
                        textsearch2.Text = d.ImportPlace;
                        name_applicant.Text = d.name_applicant;
                        if (!string.IsNullOrEmpty(d.DateImport.ToString()))
                        {  impDate.Value = (Convert.ToDateTime(d.DateImport)).ToString("yyyy-MM-dd"); }
                        if (d.DateExport != null)
                        { exdate.Value = (Convert.ToDateTime(d.DateExport)).ToString("yyyy-MM-dd"); }
                            //exdate.Value = d.DateExport.Value.ToShortDateString();
                        notices.Value = d.notices;
                        if (d.IsClosed == true) rblFruits.SelectedValue="1";
                        else rblFruits.SelectedValue = "2";
                        qta3Listtxt.Text = d.qta3Name;
                        if (!string.IsNullOrEmpty(d.folder_id.ToString()) && d.folder_id != 0)
                        {
                            var foldn = db.folders_table.Where(a => a.id == d.folder_id).FirstOrDefault().folder_Name;
                            fold.Text = foldn;
                        }
                    }
                }
            }
        }

        #region validationidsid

        public int GetIDExists(string text)
        {
            int id = 0;
            var er = (from b in db.exports where b.exportPlaceName == text select b).FirstOrDefault();
            if (er != null)
                id = er.id;
            return id;
        }
        public int GetimIDExists(string text)
        {
            int id = 0;
            var er = (from b in db.imports where b.importname == text select b).FirstOrDefault();
            if (er != null)
                id = er.id;
            return id;
        }
        public int GetfoldIDExists(string text)
        {
            int id = 0;
            var er = (from b in db.folders_table where b.folder_Name == text select b).FirstOrDefault();
            if (er != null)
                id = er.id;
            return id;
        }
        public bool ifExists(string name, string text)
        {
            bool scheck = false;
            if (name == "exports")
            {
                var er = (from b in db.exports where b.exportPlaceName == text select b).FirstOrDefault();
                if (er == null)
                    scheck = true;
            }
            else if (name == "import")
            {
                var er = db.imports.Where(a => a.importname == text).FirstOrDefault();
                if (er == null)
                    scheck = true;
            }
            else if (name == "qt3at")
            {
                var er = db.qt3at.Where(a => a.name == text).FirstOrDefault();
                if (er == null)
                    scheck = true;
            }
            return scheck;
        }
        #endregion

        public bool ifExist(string text)
        {
            bool scheck = false;
           var er = (from b in db.folders_table where b.folder_Name == text select b).FirstOrDefault();
                if (er == null)
                    scheck = true;
            return scheck;
        }
        protected void myBtn1_Click(object sender, EventArgs e)
        {
            DateTime? exdatevalue = DateTime.Now;
            DateTime? imdatevalue = DateTime.Now;
            string fileName = "", fileType = "",qta3_name="";
            int fold_id = 0, qta3_id = 0 ;

            #region validation
            //export validation 
            string text = txtSearch.Text, tableName = "exports";
            bool check = ifExists(tableName, text);
            exportchoose = text;

            if (check == true)//not exists in exports table
            {
                export exp = new export
                {
                    exportPlaceName = exportchoose,
                };
                db.exports.Add(exp);
                db.SaveChanges();
                exportId = exp.id;
            }
            else exportId = GetIDExists(text);//Exists and get id of choosen

            if (exdate.Value != null&&exdate.Value!="")
            {
                try
                {
                    if (Convert.ToDateTime(exdate.Value) > DateTime.Now)
                    { Response.Write("<script>alert('برجاء ادخال تاريخ  للصادر صحيح')</script>");exdate.Focus();r.Visible = false;/*exdate. = System.Drawing.Color.Red*/; return; }
                    else
                        exdatevalue = Convert.ToDateTime(exdate.Value);
                }
                catch { Response.Write("<script>alert('برجاء ادخال تاريخ  للصادر صحيح')</script>");exdate.Focus();r.Visible = false; return; }
            }
            if (impDate.Value != null && impDate.Value != "")
            {
                try
                {
                    if (Convert.ToDateTime(impDate.Value) > DateTime.Now)
                    { empdatalert.Visible = true;impDate.Focus(); r.Visible = false; return; }
                    else
                    { imdatevalue = Convert.ToDateTime(impDate.Value); empdatalert.Visible = false; }
                }
                catch { empdatalert.Visible = true; return; }
            }

            else imdatevalue = null;
            if (photoo.HasFile)
            {
                fileName = photoo.FileName;
                string path = Server.MapPath("~/images/" + fileName);
                string extentions = Path.GetExtension(fileName);
                if (extentions == ".pdf")
                { fileType = "pdf"; }
                else { fileType = "img"; }
                photoo.SaveAs(Server.MapPath("~/images/" + fileName));
            }
            //import insert
            if (textsearch2.Text != "")
            {
                text = textsearch2.Text; tableName = "import";
                check = ifExists(tableName, text);
                importchoose = textsearch2.Text;
                if (check == true)//not exists in import table
                {
                    import im = new import
                    {
                        importname = importchoose,
                    };
                    db.imports.Add(im);
                    db.SaveChanges();
                    importId = im.id;
                }
                else importId = GetimIDExists(text);//Exists and get id of choosen
            }
            if (qta3Listtxt.Text != "")
            {
                qta3_id = funcAddNew("qt3at", qta3Listtxt.Text);
                qta3_name = qta3Listtxt.Text;
            }
            bool closedvalue;
            if (rblFruits.SelectedValue == "1")
            { closedvalue = true; }
            else { closedvalue = false; }

            //if has folder or not 
            if (fold.Text != "")
            {
              bool checkr=  ifExist(fold.Text);
                if (checkr == true)//if not exist
                {
                    folders_table f = new folders_table
                    { folder_Name = fold.Text };
                    db.folders_table.Add(f);
                    db.SaveChanges();
                    fold_id = f.id;
                }
                else fold_id = GetfoldIDExists(fold.Text);//Exists and get id of choosen
             }
             
            #endregion
            if (!string.IsNullOrEmpty(Request.QueryString["editId"]))
            {
                int editid = int.Parse(Request.QueryString["editId"]);
                var d = db.managementByans.Where(a => a.ID == editid).FirstOrDefault();
                d.byanData = textbyan.Value;
                d.exportId = exportId;
                d.ExportPlace = txtSearch.Text;
                d.DateExport = Convert.ToDateTime(exdatevalue);
                d.impoertId = importId;
                d.ImportPlace = textsearch2.Text;
                d.name_applicant = name_applicant.Text; 
                    if (impDate.Value != "" && impDate.Value != null)
                        d.DateImport = Convert.ToDateTime(imdatevalue);
                    else d.DateImport = null;
                    d.notices = notices.Value;
                    d.IsClosed = closedvalue;
                    d.qta3Name = qta3_name;
                d.folder_id = fold_id;
                    if (photoo.HasFiles)
                    {
                    Random r = new Random();
                    int rand = r.Next(1, 100000);
                    string ra = rand.ToString() + exportId + importId;
                    fileName = ra+photoo.FileName;
                    string path = Server.MapPath("~/images/" + fileName);
                    string extentions = Path.GetExtension(fileName);
                        if (extentions == ".pdf")
                        { fileType = "pdf"; }
                        else { fileType = "img"; }
                        photoo.SaveAs(path);
                   // photoo.PostedFile.SaveAs(path);
                    d.file_type = fileType;
                        d.imageSrc = fileName;  
                    }
                d.qta3_ID = qta3_id;

                }
                db.SaveChanges();
            r.Visible = true;   
           
        }

        public int funcAddNew(string tableName, string qta3_Name)
        {
            bool check = ifExists(tableName, qta3_Name);
            int id = 0;
            if (check == true)//not exists in qta3 table
            {
                qt3at q = new qt3at
                {
                    name = qta3_Name,
                };
                db.qt3at.Add(q);
                db.SaveChanges();
                id = q.id;
            }
            else { id = (from n in db.qt3at where n.name == qta3_Name select n.id).FirstOrDefault(); }//Exists and get id of choosen
            return id;
        }


        protected void del_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["editId"]))
            {
                int editid = int.Parse(Request.QueryString["editId"].ToString());
                var s = (from m in db.managementByans where m.ID == editid select m).FirstOrDefault();
                if (s.imageSrc != null)
                { s.imageSrc = ""; s.file_type=""; db.SaveChanges(); }
            }
        }
        
        [WebMethod]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<string> GetCountryNames(string prefix)
        {
            sciencedbEntities dbs = new sciencedbEntities();
            List<String> listCountryName = new List<String>();
            var listequal = dbs.exports.Where(a => a.exportPlaceName.Contains(prefix)).ToList();
            int i = 0;
            foreach (var item in listequal)
            {
                i += 1;
                if (i < 11)
                {
                    listCountryName.Add(item.exportPlaceName);
                }
            }
            return listCountryName;
        }
        [WebMethod]
        // [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<String> GetDDL(string prefix)
        {
            sciencedbEntities dbs = new sciencedbEntities();
            List<String> list1 = new List<String>();
            var listequal = dbs.imports.Where(a => a.importname.Contains(prefix)).ToList();
            int i = 0;
            foreach (var item in listequal)
            {
                i += 1;
                if (i < 11)
                {
                    list1.Add(item.importname);
                }

            }
            return list1;
        }
        //adding folder name
        [WebMethod]
        public static List<String> GetDDL2(string prefix)
        {
            sciencedbEntities dbs = new sciencedbEntities();
            List<String> list1 = new List<String>();
            var listequal = dbs.folders_table.Where(a => a.folder_Name.Contains(prefix)).ToList();
            int i = 0;
            foreach (var item in listequal)
            {
                i += 1;
                if (i < 11)
                {
                    list1.Add(item.folder_Name);
                }

            }
            return list1;
        }
    }
}