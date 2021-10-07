<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Managment_Office.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/stylelogin.css"/>
    <title>تسجيل الدخول</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <div class="login" style="margin-top: 50px;">
        <h1 class="text-center head">التحويل الرقمي  لكلية علوم</h1>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 form log">
                    <h3>تسجيل الدخول</h3>
                   
                     <input class="form-control" runat="server" type="text"  required="required" id="username" placeholder="اسم المستخدم" oninvalid="this.setCustomValidity('هذا البيان مطلوب')" oninput="setCustomValidity('')" autocomplete="off"/>
                    <input class="form-control" runat="server" type="password"  id="password" placeholder="الرقم السري" required="required" oninvalid="this.setCustomValidity('هذا البيان مطلوب')" oninput="setCustomValidity('')" autocomplete="off"/>
                    <asp:Button runat="server" OnClick="Unnamed_Click" Text="تسجيل الدخول" ID="btn"></asp:Button>
                   
                </div>
            </div>
        </div>
    </div>
    </div>
    </form>
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
