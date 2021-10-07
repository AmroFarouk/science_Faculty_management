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
    public partial class MainPage : System.Web.UI.Page
    {
      public sciencedbEntities db = new sciencedbEntities();
        protected string username = "";
        protected string exportchoose = "", importchoose = "";
        protected int importId = 0,exportId=0;
         protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                username = Session["user"].ToString();
                
            }
           else Response.Redirect("Login.aspx");
          
        }
        #region validationidsid
        public int GetIDOfqta3( string qta3_Name)
        {
            int id = 0;
            var er = (from b in db.qt3at where b.name == qta3_Name select b).FirstOrDefault();
            if (er != null)
                id = er.id;
            return id;
        }

        public int GetIDExists(string text)
        {
            int id = 0;
            var er = (from b in db.exports where b.exportPlaceName == text select b).FirstOrDefault();
            if(er!=null)
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
            else if(name=="qt3at"){
                var er = db.qt3at.Where(a => a.name == text).FirstOrDefault();
                if (er == null)
                    scheck = true;
            }
            return scheck;
        }
        public bool ifExist(string text)
        {
            bool scheck = false;
            var er = (from b in db.folders_table where b.folder_Name == text select b).FirstOrDefault();
            if (er == null)
                scheck = true;
            return scheck;
        }
        public int GetfoldIDExists(string text)
        {
            int id = 0;
            var er = (from b in db.folders_table where b.folder_Name == text select b).FirstOrDefault();
            if (er != null)
                id = er.id;
            return id;
        }
        #endregion

        protected void myBtn1_Click(object sender,EventArgs e)
        { DateTime? exdatevalue=DateTime.Now;
          DateTime? imdatevalue = DateTime.Now;
            string fileName = "",fileType="",qta3_name="";
            int folderid = 0,qta3_id=0;
            #region validation
            string text = txtSearch.Text, tableName="exports";
            bool check = ifExists(tableName,text );
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
            
              if (Exportdate.Text != null)
            {
                try
                {
                    if (Convert.ToDateTime(Exportdate.Text) > DateTime.Now)
                    { Response.Write("<script>alert('برجاء ادخال تاريخ  للصادر صحيح')</script>"); Exportdate.Focus(); Exportdate.BorderColor = System.Drawing.Color.Red; r.Visible = false; return; }
                    else
                        exdatevalue = Convert.ToDateTime(Exportdate.Text);
                }
                catch { Response.Write("<script>alert('برجاء ادخال تاريخ  للصادر صحيح')</script>"); Exportdate.Focus(); Exportdate.BorderColor = System.Drawing.Color.Red; r.Visible = false; return; }
            }
            if (importDate.Text != null && importDate.Text != "")
            {
                try
                {
                    if (Convert.ToDateTime(importDate.Text) > DateTime.Now)
                    { empdatalert.Visible = true; importDate.Focus(); importDate.BorderColor = System.Drawing.Color.Red;r.Visible = false; Exportdate.BorderColor = System.Drawing.Color.LightGray; return; }
                    else
                    { imdatevalue = Convert.ToDateTime(importDate.Text); empdatalert.Visible = false; }
                }
                catch { /*Response.Write("<script>alert('برجاء ادخال تاريخ  للوارد صحيح')</script>");*/empdatalert.Visible = true; r.Visible = false; importDate.Focus(); importDate.BorderColor = System.Drawing.Color.Red; return;  }
            }

            else imdatevalue = null;
            if (photoo.HasFile)
            {
                Random r = new Random();
                int rand = r.Next(1, 100000);
                string ra = rand.ToString() + exportId + importId;
                fileName =ra+ photoo.FileName ;
                string path = Server.MapPath("~/images/" + fileName);
                string extentions = Path.GetExtension(fileName);
                if (extentions == ".pdf")
                { fileType = "pdf"; }
                else { fileType = "img"; }
                photoo.SaveAs(Server.MapPath("~/images/" + fileName));
            }
           
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
                qta3_id= funcAddNew("qt3at", qta3Listtxt.Text);
                qta3_name = qta3Listtxt.Text;
            }

           
            bool closedvalue;
             if (rblFruits.SelectedValue=="1")
                { closedvalue = true; }
                else { closedvalue = false; }

            //if has folder or not 
            if (fold.Text != "")
            {
                bool checkr = ifExist(fold.Text);
                if (checkr == true)//if not exist
                {
                    folders_table f = new folders_table
                    { folder_Name = fold.Text };
                    db.folders_table.Add(f);
                    db.SaveChanges();
                    folderid = f.id;
                }
                else folderid = GetfoldIDExists(fold.Text);//Exists and get id of choosen
            }

            #endregion

            managementByan dd = new managementByan
                    {
                        DateExport = exdatevalue,
                        notices=notices.Value,
                        DateImport=imdatevalue,
                        IsClosed= closedvalue,
                        Isdeleted=false,
                        byanData = textbyan.Value,
                        user_name = username,
                        ExportPlace = exportchoose,
                        exportId = exportId,
                        impoertId = importId,
                        ImportPlace = importchoose,
                        imageSrc = fileName,
                        file_type=fileType,
                        qta3Name=qta3_name
                        ,folder_id=folderid,
                        qta3_ID=qta3_id,
                        name_applicant=name_applicant.Text
                    };
                    db.managementByans.Add(dd);
                    db.SaveChanges();
            Exportdate.BorderColor = System.Drawing.Color.LightGray;
            importDate.BorderColor = System.Drawing.Color.LightGray;
            empdatalert.Visible = false;
            r.Visible = true;
        }

        public int funcAddNew(string tableName,string qta3_Name)
        {       bool check = ifExists(tableName, qta3_Name);
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
            else { id = (from n in db.qt3at where n.name==qta3_Name select n.id).FirstOrDefault(); }//Exists and get id of choosen
            return id;
          }
        

        [WebMethod]
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
       public static List<String> GetDDL(string prefix)
        {
            sciencedbEntities dbs = new sciencedbEntities();
            List<String> list1 = new List<String>();
            var listequal = dbs.imports.Where(a => a.importname.Contains(prefix)).ToList();
            int i = 0;
            foreach (var item in listequal)
            { i += 1;
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

        [WebMethod]
        public static List<String> Getqta3(string prefix)
        {
            sciencedbEntities dbs = new sciencedbEntities();
            List<String> list1 = new List<String>();
            var listequal = dbs.qt3at.Where(a => a.name.Contains(prefix)).ToList();
            int i = 0;
            foreach (var item in listequal)
            {
                i += 1;
                if (i < 11)
                {
                    list1.Add(item.name);
                }

            }
            return list1;
        }
    }
}