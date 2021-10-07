<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Home.Master"   CodeBehind="AddUser.aspx.cs" Inherits="Managment_Office.AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>
       
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
        .stark {
      color:red;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <section class="search">
            <div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-info wow bounceInDown"  data-wow-duration="2s" data-wow-offset="200">
                            <div class="panel-heading">
                                <h1 style="text-align:center">اضافة مستخدم</h1>
                            </div>
							<div class="panel-body">
                                    <div class="form-group">							 
                                        <div class="col-xs-12 col-md-3">
                                            <label class="col-form-label" for="num">  الاسم <span class="stark">*</span></label>
                                            <input type="text" class="form-control" id="name" required="required"  runat="server" oninvalid="this.setCustomValidity('هذا البيان مطلوب')" oninput="setCustomValidity('')"/>
                                        </div>
                                        <div class="col-xs-12 col-md-3">
                                            <label class="col-form-label" for="username">  اسم المستخدم <span class="stark">*</span></label>
                                            <input type="text" class="form-control" id="username" required="required" runat="server" oninvalid="this.setCustomValidity('هذا البيان مطلوب')" oninput="setCustomValidity('')"/>
                                        </div>
                                        <div class="col-xs-12 col-md-3">
                                            <label class="col-form-label" for="password">كلمة المرور <span class="stark">*</span></label>
                                            <input type="text" class="form-control" id="password" required="required" runat="server" oninvalid="this.setCustomValidity('هذا البيان مطلوب')" oninput="setCustomValidity('')"/>
                                        </div>
                                        <div class="col-xs-12 col-md-3">
                                        <label class="col-form-label" for="ddl"> الصلاحيات  <span class="stark">*</span></label>
                                        <asp:DropDownList runat="server" cssClass="form-control " style="padding:0px" ID="ddl" >
                                           <asp:ListItem value="Admin">ادمن</asp:ListItem>
                                           <asp:ListItem value="user">مستخدم</asp:ListItem>
                                         </asp:DropDownList>
                                    </div>
                                    </div>
                                     <div class="col-xs-12 col-md-12">
                                        <asp:Button  ID="btnsearch" cssClass=" s2 btn btn-primary" runat="server" Text="حفظ" OnClick="btnsearch_Click"></asp:Button>	 		
                                      </div>
									
								
				    		</div>
                        </div>                        
						<div class="panel panel-info  wow bounceInUp" style="margin-top: 50px;" data-wow-duration="2s" data-wow-offset="200">
							<div class="panel-body">
                                    <div class="form-group text-center">
                                        <div class="table-responsive col-sm-12" id="printedtable" style="margin-top: 20px;">
                                        <table class="table table-border" border="1"  style="border:2px solid rgb(226, 226, 226);color: rgb(85, 84, 84);">
                                            <thead>
                                                <tr>
                                                    <th>م</th>
                                                    <th>اسم المستخدم</th>
                                                    <th>كلمة المرور</th>
                                                   <th>الاسم</th>
                                                    <th>الصلاحيات</th>
                                                </tr>
                                             </thead>
                                           <%  Managment_Office.sciencedbEntities db = new Managment_Office.sciencedbEntities();
                                               var userslist = db.usersses.ToList();
                                               if (userslist != null)
                                               {
                                                   int i = 1;
                                                   foreach (var r in userslist)
                                                   {
                                               %>
                                             <tbody>
                                               <tr>
                                                    <td style="width:6% ;text-align:right"><%=i %></td> 
                                                    <td style="width:10%;text-align:right"><%=r.user_name %></td>
                                                    <td style="width:10%"><%=r.password %></td>
                                                  <td style="width:10%"><%=r.name %></td>
                                                    <td style="width:10%"><%=r.Role %></td>
                                                   <td style="width:10%" >
                                                       <a  id='<%=r.id %>' data-id='<%=r.id %>'  title="مسح" class="delete"
                                                                  data-placement="top"><img src="img/remove.jpg"  alt="pic" width="20" height="20"/></a>
                                                       <a  href="AddUser.aspx?editid=<%=r.id%>"  data-toggle="tooltip" title="تعديل"
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
                </div>
        </section>

 <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
           
             <div class="modal-body">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
             <p>هل انت متأكد من الحذف ؟</p>
           <button class="btn btn-danger del" id="confirm" type="button" >نعم</button>
            <button class="btn btn-primary" id="cancel" type="button"  onclick="refreshPage();">لا</button>
     </div>
    </div>

  </div>
</div>
 <div id="successModal" class="modal">
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
     <div id="successModal2" class="modal">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
            <div class="modal-body">
            <button type="button" class="close" >&times;</button>
             <p>  تم الحفظ بنجاح </p>
     </div>
    </div>

  </div>
</div>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
                                             url: 'AddUser.aspx/delfunctionconfirm',
                                             contentType: "application/json; charset=utf-8",
                                             data: '{delid:' + delid + '}',
                                             dataType: 'json',
                                             success: function (data) {
                                                
                                                 $(this).remove();
                                                 $('#myModal').modal('hide');
                                                 $('#successModal').modal('show');
                                                 refreshPage();
                                             }
                        , faild: function () {
                            alert('لم يتم الحذف');
                        }
                                         });
                                  
                                    });
                 
                             });
            
                        });
       
// Get the modal
var modal = document.getElementById("successModal2");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

 function s() {
    
      modal.style.display = 'block';
     refreshPage();
 }
 function refreshPage()
 {
     var url = location.href;//=location.href;
     var urlparts = url.split('?');
     if (urlparts.length >= 2) {

         location.href = urlparts[0];
     }
     else { location.href = location.href; }
 }
 span.onclick = function () {
     
     document.getElementById("successModal2").style.display = "none";
     document.getElementById("successModal").style.display = "none";
     var url = location.href;//=location.href;
     var urlparts = url.split('?');
     if (urlparts.length >= 2) {

         location.href = urlparts[0];
     }
     else { location.href = location.href; }

 }
         </script>
   
     </asp:Content>