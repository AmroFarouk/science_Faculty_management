<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Managment_Office.MainPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
        
    <style>
               .modal-confirm {		
	color: #434e65;
	width: 525px;
}
.modal-confirm .modal-content {
	padding: 20px;
	font-size: 16px;
	border-radius: 5px;
	border: none;
}
.modal-confirm .modal-header {
	background: #47c9a2;
	border-bottom: none;   
	position: relative;
	text-align: center;
	margin: -20px -20px 0;
	border-radius: 5px 5px 0 0;
	padding: 35px;
}
.modal-confirm h4 {
	text-align: center;
	font-size: 36px;
	margin: 10px 0;
}
.modal-confirm .form-control, .modal-confirm .btn {
	min-height: 40px;
	border-radius: 3px; 
    width:50%;text-align:center;
}
.modal-confirm .close {
	position: absolute;
	top: 15px;
	right: 15px;
	color: #fff;
	text-shadow: none;
	opacity: 0.5;
}
.modal-confirm .close:hover {
	opacity: 0.8;
}
.modal-confirm .icon-box {
	color: #fff;		
	width: 95px;
	height: 95px;
	display: inline-block;
	border-radius: 50%;
	z-index: 9;
	border: 5px solid #fff;
	padding: 15px;
	text-align: center;
}
.modal-confirm .icon-box i {
	font-size: 64px;
	margin: -4px 0 0 -4px;
}
.modal-confirm.modal-dialog {
	margin-top: 80px;
}
.modal-confirm .btn, .modal-confirm .btn:active {
	color: #fff;
	border-radius: 4px;
	background: #eeb711 !important;
	text-decoration: none;
	transition: all 0.4s;
	line-height: normal;
	border-radius: 30px;
	margin-top: 10px;
	padding: 0px 20px !important;
	border: none;
    padding-bottom:0px !important;
}
.modal-confirm .btn:hover, .modal-confirm .btn:focus {
	background: #eda645 !important;
	outline: none;
    border:none !important
}
.modal-confirm .btn span {
	margin: 1px 1px 0;
    
	
}
.modal-confirm .btn i {
	margin-left: 1px;
	font-size: 20px;
	float: right;
}
.trigger-btn {
	display: inline-block;
	margin: 100px auto;
}

        .nonpadding {
        padding:0px;}
        #success {
       width: 100%;
    padding: 27px;
 
    margin-bottom: -1px;
     opacity: 1;
  transition: opacity 0.6s;
        }
        .ch {width:25%;height:25px;margin:6px 4px 0 0;
        }
        .newlabel {font-size:13px;
        }
        .stark {
        color:red;}
        #rblFruits input {
            /*margin-left:20px;*/
             /*width:32px;height:20px*/
             }
        #rblFruits  { /*margin-right:35px;*/

        }
        /* The search field */
#myInput {
  
    
      background-image: url('img/searchicon.png');
       background-position: 14px 12px;
  background-repeat: no-repeat;
    font-size: 14px;
    padding: 10px 56px;
    border: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
}

/* The search field when it gets focus/clicked on */
#myInput:focus {outline: 3px solid #ddd;}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
 
  position: absolute;
  background-color: #f6f6f6;
  min-width: 230px;
  border: 1px solid #ddd;
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {display:block;}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="form">
	<img class="img-responsive" src="img/xu.jpg" alt="images"/>	
	</section>
<section class="forms">
    		
		<div class="container">
            		
				<div class="row">
                   <div class="col-sm-12">
                      
						<div class="panel wow bounceInDown"  data-wow-duration="2s" data-wow-offset="200">
							
                            <div class="panel-body">
                                 <div class="alert alert-success" id="r" runat="server" style="width:100%;text-align: center;font-weight:bold" visible="false">تم الادخال بنجاح <span style="font-size:20px;" onclick="fun();"> 
                                     <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-repeat" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z"/>
                                      <path fill-rule="evenodd" d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z"/>
                                    </svg>
                                  </span>

                                 </div>
                                   
	                             
								<h2>التحويل الرقمي  لكلية العلوم</h2>
								
									<div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="col-xs-12 col-sm-1 col-form-label">اهلا بك </label>
                                                <label class="col-xs-12 col-sm-2 col-form-label"> <%=Session["user"].ToString() %></label>
                                            </div>
                                        </div>
                                        <br/>

										<div class="col-md-6">
                                          <%--  ---------------folder name-------------%>
                                           

											<div class="form-group">
                                                <label class="col-xs-12 col-sm-3 col-form-label" for="export" style="margin-top:20px">جهة الصادر <span class="stark">*</span></label>
												<div class="col-xs-12 col-sm-8">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtSearch" SetFocusOnError="true" runat="server" ForeColor="Red" ErrorMessage=" برجاء ادخال / اختيار جهة الصادر"></asp:RequiredFieldValidator>
                                                     <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"   AccessKey="8" ClientIDMode="Static"></asp:TextBox>
                                                       <asp:HiddenField ID="hfCustomerId" runat="server" />
                                                 </div>
											</div>
                                         
                                            <div class="form-group">
                                                <label class="col-xs-12 col-sm-3 col-form-label" for="Exportdate" style="margin-top:20px">  تاريخ الصادر <span class="stark">*</span></label>
                                                <div class="col-xs-12 col-sm-8">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Exportdate" SetFocusOnError="true" ClientIDMode="Static" runat="server" ForeColor="Red" ErrorMessage="برجاء ادخال التاريخ"></asp:RequiredFieldValidator>
                                                    <asp:TextBox TextMode="Date" ID="Exportdate" runat="server" CssClass="form-control"  />
												</div>
                                            </div>

											<div class="form-group">
												<label class="col-xs-12 col-sm-3 col-form-label" for="import" style="margin-bottom:4px">جهة الوارد</label>
												<div class="col-xs-12 col-sm-8">
													  <asp:TextBox ID="textsearch2" runat="server" CssClass="form-control" AccessKey="1"  ClientIDMode="Static"></asp:TextBox>
                                               </div>
											</div>
											<div class="form-group">
												<label class="col-xs-12 col-sm-3 col-form-label" for="date" style="margin-bottom:4px">تاريخ الوارد</label>
												<div class="col-xs-12 col-sm-8">
                                                    <span runat="server" id="empdatalert" class="stark" visible="false">برجاء ادخال تاريخ  للوارد صحيح</span>
                                                    <asp:TextBox TextMode="Date"  ID="importDate" runat="server" CssClass="form-control" />
												</div>
											</div>
                                           <div class="form-group">
                                               <label class="col-xs-12 col-sm-3 col-form-label" for="qta3" style="margin-top:20px">اسم القطاع <span class="stark">*</span> </label>
												<div class="col-xs-12 col-sm-8">
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="qta3Listtxt" SetFocusOnError="true" ClientIDMode="Static" runat="server" ForeColor="Red" ErrorMessage="برجاء ادخال اسم القطاع"></asp:RequiredFieldValidator>
                                                   <asp:TextBox ID="qta3Listtxt" runat="server" AutoCompleteType="FirstName"  CssClass="form-control"  ClientIDMode="Static"></asp:TextBox>
                                                   
                                                </div>
                                           </div>
                                             <div class="form-group">
												<label class="col-xs-12 col-sm-3 col-form-label" for="name_applicant" style="margin-top:8px;font-size:15px"> اسم مقدم الطلب </label>
												<div class="col-xs-12 col-sm-8">
                                                     <asp:TextBox ID="name_applicant" runat="server" CssClass="form-control" AccessKey="1"  ClientIDMode="Static"></asp:TextBox>
                                                </div>
											</div>
											<div class="form-group">
												<label class="col-xs-12 col-sm-3 col-form-label" for="textbyan" style="margin-top:25px"> البيان <span class="stark">*</span></label>
												<div class="col-xs-12 col-sm-8">
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="textbyan" SetFocusOnError="true" ClientIDMode="Static" runat="server" ForeColor="Red" ErrorMessage="برجاء ادخال البيان"></asp:RequiredFieldValidator>
                                                     <textarea cols="10" rows="3" class="form-control" id="textbyan" runat="server" placeholder="البيان" ></textarea>
												</div>
											</div>
                                            <div class="form-group">
												<label class="col-xs-12 col-sm-3 col-form-label" for="notices">الملاحظات</label>
												<div class="col-xs-12 col-sm-8">
													<textarea class="form-control" placeholder="الملاحظات"  runat="server" id="notices" cols="10" rows="3" ></textarea>
												</div>
											</div>
											 <div class="form-group">
												<label class="col-xs-12 col-sm-3 col-form-label" for="fold" style="color:#980000 !important;margin-top:9px">اسم المجلد</label>
												<div class="col-xs-12 col-sm-8">
													 <asp:TextBox ID="fold" runat="server" CssClass="form-control" AccessKey="1"  ClientIDMode="Static"></asp:TextBox>
                                               </div>
											</div>
											
											   <div>
                                                 <label class="col-xs-12 col-sm-12 col-form-label"> حالة الانتهاء <span class="stark" id="ss">*</span></label>
											   </div>
                                           
                                            <div class="form-group">
                                                 <asp:RadioButtonList CssClass="col-xs-12 col-sm-7" style="margin-right:35px;" ID="rblFruits" runat="server" >
                                               <asp:ListItem Text="منتهي" Value="1" />
                                               <asp:ListItem Text="غير منتهي" Value="2" />
                                              </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator CssClass="col-xs-12 col-sm-5" ID="RequiredFieldValidator3" SetFocusOnError="true" ErrorMessage="برجاء اختيار حالة الانتهاء"
                                                  ControlToValidate="rblFruits" runat="server" ForeColor="Red" Display="Dynamic" />
                                            
                                            </div>
                                          
										</div>
										<div class="col-md-6" style="text-align: center;" >
											<%if (!string.IsNullOrEmpty(Request.QueryString["editId"]))
                                                {
                                                    int edid = int.Parse(Request.QueryString["editId"].ToString());
                                                    var editquery = (from m in db.managementByans where m.ID == edid select m).FirstOrDefault();
                                                    if (editquery != null)
                                                    {if (editquery.file_type == "img")
                                                        { %>
                                                       <img src="images/<%=editquery.imageSrc %>" id="img" alt="picture" style="width: 80%;height: 330px;margin-top: 20px;"/>
                                                   <% }
                                                     else if (editquery.file_type == "pdf")
                                                       { %><img src="img/iconpdf.png" id="pdficon" alt="picture" style="width: 20%;height:230px;"/>
                                                         <%}
            else {%> <img src="img/n.png" id="edit_image" alt="picture or PDF upload" style="width: 20%;height: 220px;margin-top: 20px;"/>
                                           <% }
        }
    }
    else
    {%>
                                            
                                            <img src="img/n.png" id="user_img" alt="picture or PDF upload" style="width: 20%;height: 220px;margin-top: 20px;"/>
                                            <%} %>
										<div class="form-group">
												<label class="col-xs-12 col-sm-3 col-form-label" for="photoo" style="margin-top:30px"> الملف: PDF/image </label>
												<div class="col-xs-12 col-sm-8">
													<asp:RegularExpressionValidator ID="regexValidateImageFil" runat="server" ControlToValidate="photoo"  ForeColor="red"  ErrorMessage="لايمكنك رفع هذا الملف ,الملفات المطلوبة من نوع .jpeg/.jpg/.png/.gif/.pdf فقط." ValidationExpression="^.*\.(PDF|pdf|jpg|JPG|jpeg|JPEG|bmp|BMP|gif|GIF|png|PNG)$"></asp:RegularExpressionValidator>  
                                                    <asp:FileUpload   cssClass="form-control" ID="photoo" name="Ipic"  runat="server" onchange="return getFileNameWithExt(this);"></asp:FileUpload> 
													<%--<input type="file" class="form-control" title="search image" runat="server"  name="IPic" id="IPic" onchange="show(this)" required="required" />--%>
												</div>
											</div>
                                            </div>
										<div class="col-xs-12 col-sm-8 col-sm-offset-3">
                                            <asp:Button ID="myBtn1"   Text="حفظ"  OnClick="myBtn1_Click"  runat="server" cssClass="btn btn-primary form-control"></asp:Button>
										</div>
                                      
									</div>
				    		</div>
          				</div>
        			<div>
      			</div>
    		</div>
                </div>
         </div>
    <div id="myModal" class="modal" role="dialog">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header justify-content-center">
				<div class="icon-box">
					<i class="fa fa-check" aria-hidden="true"></i>
				</div>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body text-center">
				<h4>تم الادخال بنجاح</h4>	
				
				<asp:Button class="btn btn-success" runat="server" ID="ok"     Text="موافق"/>
			</div>
		</div>
	</div>
        </div>
</section>
      
   <script>

         // Get the modal
        var modal = document.getElementById("myModal");

        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal 
        function s() {
            
            modal.style.display = 'block';
            
           // location.href = location.href;
        }
        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }
      
    </script>
  
    <script>
        var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif|\.pdf)$/i;;
        function getFileNameWithExt(event) {
           
            if (event.files[0])
            {
               
               const name2 = event.files[0].name;
                const lastDot = name2.lastIndexOf('.');

                const fileName = name2.substring(0, lastDot);
                const ext = name2.substring(lastDot + 1);

                var fileInput =  $('#photoo');
                var filePath = event.files[0].name;
               
                if (!allowedExtensions.exec(filePath)) {
                    alert('لايمكنك رفع هذا الملف ,الملفات المطلوبة من نوع .jpeg/.jpg/.png/.gif/.pdf only.');
                    fileInput.value = '';
                    $('#user_img').attr('src', '/img/n.png').width('20%').height('220px');
                    $('#edit_image').attr('src', '/img/n.png').width('20%').height('220px');
                    $('#img').attr('src', '/img/n.png').width('20%').height('220px');
                    $('#pdficon').attr('src', '/img/n.png').width('20%').height('220px');

                    return false;
                }
                else {
                    if (event.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                           
                            if (ext == "pdf") {
                                //document.getElementById('img').innerHTML = "<img src='img/iconpdf.png'/>";
                                $('#user_img').attr('src', 'img/iconpdf.png').width('20%').height('230px');
                                $('#edit_image').attr('src', 'img/iconpdf.png').width('20%').height('230px');
                                $('#img').attr('src', 'img/iconpdf.png').width('20%').height('230px');

                            }
                            else {
                               
                                $('#user_img').attr('src', e.target.result).width('100%').height('100%');
                                $('#img').attr('src', e.target.result).width('100%').height('100%');
                                $('#edit_image').attr('src', e.target.result).width('100%').height('100%');
                                $('#pdficon').attr('src', e.target.result).width('100%').height('100%');

                            }
                        };
                        reader.readAsDataURL(event.files[0]);
                    }
                }
               
            }
           
            return true;
        }
     
    </script>  
</asp:Content>
<asp:Content ID="sr3" runat="server" ContentPlaceHolderID="script">
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>
    <script src="js/wow.min.js"></script>
    <script>new WOW().init();</script>
        <link href="js/jquery-ui.css"
rel = "Stylesheet" type="text/css" />
   <script src="js/jquery-1.8.0.js"></script>
    <script src="js/jquery-ui.js"></script>
 <script>
         
    $(document).ready(function () {
        $("#txtSearch").autocomplete({
           
            source: function (request, response) {
                var param = { prefix: $("#txtSearch").val() };
                
                $.ajax({
                    
                    url: "MainPage.aspx/GetCountryNames",
                    
                    data: JSON.stringify(param),
                    type: "post",
                    contentType: "application/json; charset=utf-8",
                    datafilter:function(data){return data;},
                   success: function (data) {
                       
                        response($.map(data.d, function (item) {
                            return {
                                value:item
                            }
                        }))
                    },
                });
            },
           select: function (e, i) {
                $("#<%=hfCustomerId.ClientID %>").val(i.item.val);
            },
            minLength: 1
        });

        //search 2
        $("#textsearch2").autocomplete({
           
            source: function (request, response) {
                var param2 = { prefix: $("#textsearch2").val() };
                
                $.ajax({
                    
                    url: "MainPage.aspx/GetDDL",
                    
                    data: JSON.stringify(param2),
                    type: "post",
                    contentType: "application/json; charset=utf-8",
                    datafilter:function(data){return data;},
                   success: function (data) {
                       
                        response($.map(data.d, function (item) {
                            return {
                                value:item
                            }
                        }))
                    },
                });
            },
          
            minLength: 1
        });

        //search in folder
        
        $("#fold").autocomplete({

            source: function (request, response) {
                var param2 = { prefix: $("#fold").val() };

                $.ajax({

                    url: "MainPage.aspx/GetDDL2",

                    data: JSON.stringify(param2),
                    type: "post",
                    contentType: "application/json; charset=utf-8",
                    datafilter: function (data) { return data; },
                    success: function (data) {

                        response($.map(data.d, function (item) {
                            return {
                                value: item
                            }
                        }))
                    },
                });
            },

            minLength: 1
        });

        $("#qta3Listtxt").autocomplete({

            source: function (request, response) {
                var param2 = { prefix: $("#qta3Listtxt").val() };

                $.ajax({
                    url: "MainPage.aspx/Getqta3",
                    data: JSON.stringify(param2),
                    type: "post",
                    contentType: "application/json; charset=utf-8",
                    datafilter: function (data) { return data; },
                    success: function (data) {

                        response($.map(data.d, function (item) {
                            return {
                                value: item
                            }
                        }))
                    },
                });
            },

            minLength: 1
        });
       
    });
</script>
<script>
    function fun()
    {
        window.location.href = window.location.href;
    }
</script>
</asp:Content>

