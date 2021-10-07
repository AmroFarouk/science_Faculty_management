<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ConfirmDeleting.aspx.cs" Inherits="Managment_Office.ConfirmDeleting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
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
    .footer {
    margin-top:140px !important}
    
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <section class="search">
            <div class="container">
				<div class="row">
					<div class="col-sm-12">
        			<div class="panel panel-info  wow bounceInUp" style="margin-top: 50px;" data-wow-duration="2s" data-wow-offset="200">
							<div class="panel-body">
                                   
                                 <div class="form-group text-center">
                                       <div >
                                           <h1 style="text-align:center">تأكيد الحذف</h1>
                                       </div>
                                        <div class="table-responsive col-sm-12" id="printedtable" style="margin-top: 20px;">
                                        <table class="table table-border" id="t"  border="1"  style="border:2px solid rgb(226, 226, 226);color: rgb(85, 84, 84);">
                                            <thead>
                                                <tr>
                                                    <th>م</th>
                                                    <th>جهة الصادر</th>
                                                    <th>جهة الوارد</th>
                                                   <th>البيان</th>
                                                    <th>تاريخ الصادر </th>
                                                    <th>تاريخ الوارد </th>
                                                    <th>الملاحظات</th>
                                                    <th>حالة الانتهاء</th>
                                                    <th>الاسم</th>
                                                    <th>صورة </th>
                                               
                                                </tr>
                                             </thead>
                                           <% if (lists != null)
                                               {
                                                   int i = 1;
                                                   foreach (var r in lists)
                                                   {
                                                       DateTime d1 = Convert.ToDateTime(r.DateExport);
                                                        DateTime d2 = Convert.ToDateTime(r.DateImport);
                                               %>
                                             <tbody>
                                               <tr>
                                                    <td style="width:6% ;text-align:right"><%=i %></td> 
                                                    <td style="width:10%;text-align:right"><%=r.ExportPlace %></td>
                                                    <td style="width:10%"><%=r.ImportPlace %></td>
                                                  
                                                    <td style="width:12%;text-align:right"><%=r.byanData %></td>
                                                    <td style="width:7%;text-align:right"><%=d1.ToShortDateString() %></td>
                                                   <td style="width:7%;text-align:right"><%if(!string.IsNullOrEmpty(r.DateImport.ToString())) {Response.Write( d2.ToShortDateString()); } else { } %></td>
                                                   <td style="width:7%;text-align:right"><%=r.notices%></td>
                                                
                                                   <td style="width:7%;text-align:right"><%
                                                                                             if (r.IsClosed == true) Response.Write("منتهي");
                                                                                             else Response.Write("غير منتهي"); %></td>
                                                   <td style="width:8%;text-align:right"><%=r.user_name %></td>
                                                    <td style="width:12%;text-align:right">
                                                           <%if (r.file_type == "img")
                                                               { %>
                                                            <a href="images/<%=r.imageSrc %>" target="_blank">
                                                              <img src="images/<%=r.imageSrc %>" alt="" style="width: 50px;height: 50px" /></a> 										
                                                             <%}else if(r.file_type=="pdf"){%>
                                                                      <p>file Name:<a  target="_blank" href="images/<%=r.imageSrc%> %>">PDF File</a>
                                                                        </p>
                                                                <% } %>
                                                       
                                                    </td>
                                                   <td style="width:10%" >
                                                        <a  id="r+<%=r.ID %>" data-id="<%=r.ID %>" data-toggle="tooltip" title="أعادة تدوير" class="recycle"
                                                                  data-placement="top"><img src="img/recycle-sign.png"  alt="pic" width="30" height="35"/></a>
                                                 
                                                       <a  id='<%=r.ID %>' data-id='<%=r.ID %>'  title="مسح" class="delete"
                                                                  data-placement="top"><img src="img/error.png"  alt="pic" width="20" height="20"/></a>
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
                        </div>
                    </div>
                </div>
        
         </section>

     <div id="rec" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
           
             <div class="modal-body">
            <button type="button" class="close" data-dismiss="modal" >&times;</button>
             <p> تم اعادة البيان بنجاح</p>
     </div>
    </div>

  </div>
</div>
     <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
           
             <div class="modal-body">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
             <p> سوف يتم الحذف نهائيا:هل انت متأكد من الحذف ؟</p>
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
            <button type="button" class="close"  onclick="location.href=location.href">&times;</button>
             <p>  تم الحذف  نهائيا بنجاح </p>
     </div>
    </div>

  </div>
</div>
    
</asp:Content>
<asp:Content ID="scripts" ContentPlaceHolderID="script" runat="server">
    
    <script src="js/jquery3.5.1.min.js"></script>
    <script src="js/bootstrap3.4.1.min.js"></script>
      <%--<script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>
    <script src="js/wow.min.js"></script>
    <script>new WOW().init();</script>--%>
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
                                             url: 'ConfirmDeleting.aspx/delfunctionconfirm',
                                             contentType: "application/json; charset=utf-8",
                                             data: '{delid:' + delid + '}',
                                             dataType: 'json',
                                             success: function (data) {
                                                 $(this).remove();
                                                 //location.href = location.href;
                                                 $('#myModal').modal('hide');
                                                 $('#successModal').modal('show');
                                                
                                             }
                        , faild: function () {
                            alert('لم يتم الحذف');
                        }
                                         });
                                  
                                    });
                 
                             });
            

             $('.recycle').click(function (e) {
                 var el = this;
                 e.preventDefault();
                 var delid = $(this).attr('data-id');

                     $.ajax({
                         type: 'POST',
                         url: 'ConfirmDeleting.aspx/recyclefun',
                         contentType: "application/json; charset=utf-8",
                         data: '{delid:' + delid + '}',
                         dataType: 'json',
                         success: function (data) {
                            $('#rec').modal('show');
                             setInterval(fun(), 9000);
                         }
                        , faild: function () {
                            alert('لم يتم أعادة البيان');
                        }
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
    location.href = location.href;
 }
 window.onclick = function (event) {
     if (event.target == modal) {
         modal.style.display = "none";
     }
 }
         
 </script>
</asp:Content>
