<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Managment_Office.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css"/>
    
    <style>
        @media print {
            #t td:last-child a {
                 display: none;
            }
            /* #t td:first-child  {
                 display: none;
            }*/

            body {
            background-color:black;}
           #t td a[href]:after {
            content: none !important;
            display:none;visibility:hidden;
             width:100%;height:100%
              }
         
        }
          .s2 {
      float:left
  ;  margin:10px 0;
    font-size: 18px;
    border-radius: 0%;
    width: 150px;
    padding-top: 10px !important;
	padding-bottom: 10px !important;
	background: #3d3c90;
    border: 1px solid #3d3c90; }
        #myBtn {
        text-align:left}
        .modal-content{
		   margin: 10% auto;
		  border: 1px solid #888;
		  width: 450px;
          font-size:20px; 
		}
         .modal-content p {
            text-align:center}
            .modal-body .btn {
            text-align:center
                ;width:47% !important;
            }
        .close {
        font-size:22px;color:darkgrey;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <section class="search">
            <div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-info wow bounceInDown"  data-wow-duration="2s" data-wow-offset="200">
                            <div class="panel-heading">
                                <h1 style="text-align:center">البحث</h1>
                            </div>
							<div class="panel-body">
                                    <div class="col-xs-12 col-md-6">
                                        <label class="col-form-label" for="exportno">رقم الصادر من:</label>
                                            <asp:DropDownList ID="exportnofrom" runat="server" cssClass="form-control " style="padding:0px" >   </asp:DropDownList>
                                     
                                    </div> 
                                
                                    <div class="col-xs-12 col-md-6">
                                        <label class="col-form-label" for="exportno">رقم الصادر إلي:</label>
                                            <asp:DropDownList ID="exportnoto" runat="server" cssClass="form-control " style="padding:0px" >   </asp:DropDownList>
                                      
                                    </div>

                                    <div class="form-group">							 
                                        <div class="col-xs-12 col-md-6">
                                            <label class="col-form-label" for="num">التاريخ من</label>
                                            <input type="date" class="form-control" id="date" runat="server" />
                                        </div>
                                        <div class="col-xs-12 col-md-6">
                                            <label class="col-form-label" for="num">التاريخ الي</label>
                                            <input type="date" class="form-control" id="date1" runat="server" />
                                        </div>
                                        
                                    
                                    
                                    <div class="col-xs-12 col-md-6">
                                        <label class="col-form-label" for="exportddl">جهة الصادر</label>
                                        <asp:DropDownList runat="server" cssClass="form-control " style="padding:0px" ID="exportddl" >
                                         </asp:DropDownList>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <label class="col-form-label" for="imddl">جهة الوارد</label>
                                       <asp:DropDownList runat="server" cssClass="form-control " style="padding:0px" ID="imddl"  >
                                        </asp:DropDownList>
                                    </div>
                                   
									
                                        <div class="col-xs-12 col-md-6">
                                             <label class="col-form-label" for="byantxt">البيان</label>
                                            <input class="form-control" runat="server" id="byantxt" placeholder="بحث بكلمة او اكثر في البيان"/>

                                        </div>

                                      <div class="col-xs-12 col-md-6">   
                                              <label class="col-form-label" for="Closed"> اسم القطاع  </label>
									          <asp:DropDownList runat="server" ID="qta3List" cssClass="form-control " style="padding:0px"></asp:DropDownList>	
                                         </div> 
                                       <div class="col-xs-12 col-md-6">
                                             <label class="col-form-label" for="TextBox1">اسم المجلد</label>
                                             <asp:DropDownList runat="server" cssClass="form-control " style="padding:0px;border: 1px solid #980000;" ID="DropDownList1"  >
                                        </asp:DropDownList>
                                         </div>

                                        <div class="col-xs-12 col-md-6">
                                            <br />
                                            <div class="row">
                                                <div class="col-md-12 col-xs-12">
                                              <label class="col-form-label" for="Closed">الموضوع منتهى  </label>
									          <input type="radio"   runat="server" style="margin-left: 30px" id="Closedr" />	
                                                    
                                            <label class="col-form-label" for="Closed">الموضوع غير منتهي  </label>
									          <input type="radio"   runat="server" style="margin-left: 30px" id="unclose" />

                                                    <label class="col-form-label" for="Closed">منتهي أو غير منتهي  </label>
									          <input type="radio"   runat="server"  id="ClUnClosed" />
                                                    </div>
                                                </div>
                                             </div>
									          <div class="col-xs-12 col-md-12">
                                        <asp:Button  ID="btnsearch" cssClass=" s2 btn btn-primary" runat="server" Text="بحث" OnClick="btnsearch_Click"></asp:Button>	 		
                                     </div>
									</div>
								  </div>
				    		</div>
                        </div>                          
						<div class="panel panel-info  wow bounceInUp" style="margin-top: 50px;" data-wow-duration="2s" data-wow-offset="200">
							<div class="panel-body">
                                    <div class="form-group text-center">
                                        <div class="col-md-12">
                                            <button type="button" id="btnprint" class="s2 btn btn-primary" onclick="printr();" >طباعه</button>
                                        </div>
                                        <div class="table-responsive col-sm-12" id="printedtable" style="margin-top: 20px;">
                                        <table class="table table-border" id="t"  border="1"  style="border:2px solid rgb(226, 226, 226);color: rgb(85, 84, 84);">
                                            <thead>
                                                <tr>
                                                    <th>رقم الصادر</th>
                                                    <th>جهة الصادر</th>
                                                    <th>جهة الوارد</th>
                                                   <th>البيان</th>
                                                    <th>تاريخ الصادر </th>
                                                    <th>تاريخ الوارد </th>
                                                    <th>الملاحظات</th>
                                                   
                                                    <th>اسم القطاع</th>
                                                     <th>اسم مقدم الطلب</th>
                                                    
                                                    <th>حالة الانتهاء</th>
                                                     <th>اسم المجلد</th>
                                                    <th>الاسم</th>
                                                    <th>صورة </th>
                                                    <th></th>
                                                </tr>
                                             </thead>
                                           <% if (list != null)
                                              {
                                                   int i = 1;
                                                   foreach (var r in list)
                                                   {
                                                       DateTime d1 = Convert.ToDateTime(r.DateExport);
                                                       DateTime d2 = Convert.ToDateTime(r.DateImport);
                                                       string fname = "";
                                                       if (r.folder_id != 0 && !string.IsNullOrEmpty(r.folder_id.ToString()) && r.folder_id != null)
                                                       {
                                                           var foldname = db.folders_table.Where(a => a.id == r.folder_id).FirstOrDefault();
                                                           fname = foldname.folder_Name;
                                                       }%>
                                               <tbody>
                                               <tr>
                                                    <td style="width:6% ;text-align:right"><%=r.ID %></td> 
                                                    <td style="width:10%;text-align:right"><%=r.ExportPlace %></td>
                                                    <td style="width:10%"><%=r.ImportPlace %></td>
                                        
                                                    <td style="width:12%;text-align:right"><%=r.byanData %></td>
                                                    <td style="width:7%;text-align:right"><%=d1.ToShortDateString()%></td>
                                                    <td style="width:7%;text-align:right"><% if (!string.IsNullOrEmpty(r.DateImport.ToString())) {Response.Write( d2.ToShortDateString()); } else { } %></td>
                                                    <td style="width:7%;text-align:right"><%=r.notices%></td>
                                                    <td><%=r.qta3Name %></td>
                                                    <td style="width:10%"><%=r.name_applicant %></td>
                                                    <td style="width:7%;text-align:right"><%
                                                                                             if (r.IsClosed == true) Response.Write("منتهي");
                                                                                             else Response.Write("غير منتهي"); %></td>
                                                    <td style="width:7%;text-align:right">
                                                       <%=fname %>
                                                    </td>
                                                    <td style="width:8%;text-align:right"><%=r.user_name %></td>
                                                    <td style="width:12%;text-align:right">
                                                           <%if (r.file_type == "img")
                                                             {%>
                                                                <a href="images/<%=r.imageSrc %>" target="_blank">
                                                                <img src="images/<%=r.imageSrc %>" alt="" style="width: 50px;height: 50px" /></a> 										
                                                           <%}
                                                             else if (r.file_type == "pdf")
                                                             {%>
                                                                <p>file Name:<a  target="_blank" href="images/<%=r.imageSrc%>">PDF File</a>
                                                                </p>
                                                           <%}
                                                             else {%><p></p><% } %>
                                                    </td>
                                                   
                                                    <td style="width:10%" >
                                                       <a  id='<%=r.ID %>' data-id='<%=r.ID %>'  title="مسح" class="delete"
                                                                  data-placement="top"><img src="img/remove.jpg"  alt="pic" width="20" height="20"/></a>
                                                       <a  href="EditPage.aspx?editId=<%=r.ID%>"  data-toggle="tooltip" title="تعديل"
                                                                  data-placement="top"><img src="img/edit.jpg"  alt="pic" width="30" height="35"/></a>
                                                    </td>
                                                </tr>                                               
                                               </tbody>
                                                    <%i++;
                                                   }
                                              }%>
                                        </table>
                                       </div>
                                   </div>
				    		</div>
                        </div> 
        			<div>
      			</div>
    		</div>
                    
        </div>
        </section>

 <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
           
             <div class="modal-body">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
             <p>هل انت متأكد من الحذف ؟</p>
           <button class="btn btn-danger del" id="confirm" >نعم</button>
            <button class="btn btn-primary" id="cancel"  runat="server">لا</button>
     </div>
    </div>

  </div>
</div>
      <div id="successModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
            <div class="modal-body">
            <button type="button" class="close" >&times;</button>
             <p>  تم الحذف بنجاح </p>
     </div>
    </div>

  </div>
</div>
   
    
     </asp:Content>
<asp:Content ID="scripts" ContentPlaceHolderID="script" runat="server">
     <script src="js/jquery3.5.1.min.js"></script>
   <script src="js/jquery1.12.1-ui.js"></script>
    <script src="js/bootstrap3.4.1.min.js"></script>
    
    <script>
       
         $(document).ready(function (){
            
             $('.delete').click(function(e){
                 var el = this;
                 e.preventDefault();
                 var delid = $(this).attr('id');
               
                 $('#myModal').modal('show') ;
                 $('#confirm').click(function(){
                    
                     $.ajax({
                                             type: 'POST',
                                             url: 'Reports.aspx/delfunctionconfirm',
                                             contentType: "application/json; charset=utf-8",
                                             data: '{delid:' + delid + '}',
                                             dataType: 'json',
                                             success: function (data) {
                                                 $(this).remove();
                                                 //location.href = location.href;
                                                 $('#myModal').modal('hide');
                                                
                                                 $('#successModal').modal('show')
                                             }
                        , faild: function () {
                            alert('لم يتم الحذف');
                        }
                                         });
                                  
                                    });
                 
                             });
          
         });
       
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];
 function  fun() {
    modal.style.display = "none";
 }
 window.onclick = function (event) {
     if (event.target == modal) {
         modal.style.display = "none";
     }
 }
 function printr()
 {
     var css = '@page { size: landscape; }',
    head = document.head || document.getElementsByTagName('head')[0],
    style = document.createElement('style');

     style.type = 'text/css';
     style.media = 'print';
     var restorebody = document.body.innerHTML;
     var printedcontent = document.getElementById("printedtable").innerHTML;
     document.body.innerHTML = printedcontent;
     document.body.style.backgroundColor = "white";
    //if (style.styleSheet) {
    //    style.styleSheet.cssText = css;
    // } else {
    //    style.appendChild(document.createTextNode(css));
    // }

    // head.appendChild(style);
     window.print();
     document.body.innerHTML = restorebody;
     document.body.style.backgroundColor = "#eae8e8";
     location.href = location.href;

 }
    </script>
   
</asp:Content>