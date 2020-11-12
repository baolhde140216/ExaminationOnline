<!--<!DOCTYPE html>-->
<!--<html>-->
<!--<head>-->
<!--    <title></title>-->
<!--    <link rel="stylesheet" type="text/css" href="style.css">-->
<!--</head>-->
<!--<body>-->
<!--<center>-->
<!--    <div class="central-div" style="top:10%">-->
<!--        <form action="controller.jsp">-->
<!--            <input type="hidden" name="page" value="register">-->
<!--            <table>-->
<!--                <tr>-->
<!--                    <td colspan="2">-->
<!--                        <center><h2>Register New User</h2></center>-->
<!--                    </td>-->
<!--                </tr>-->
<!--                <tr>-->
<!--                    <td>-->
<!--                        <label>First Name</label>-->
<!--                    </td>-->
<!--                    <td>-->
<!--                        <input type="text" name="fname" class="text" placeholder="First Name">-->
<!--                    </td>-->
<!--                </tr>-->
<!--                <tr>-->
<!--                    <td>-->
<!--                        <label>Last Name</label>-->
<!--                    </td>-->
<!--                    <td>-->
<!--                        <input type="text" name="lname" class="text" placeholder="Last Name">-->
<!--                    </td>-->
<!--                </tr>-->

<!--                <tr>-->
<!--                    <td>-->
<!--                        <label>User Name</label>-->
<!--                    </td>-->
<!--                    <td>-->
<!--                        <input type="text" name="uname" class="text" placeholder="User Name">-->
<!--                    </td>-->
<!--                </tr>-->
<!--                <tr>-->
<!--                    <td>-->
<!--                        <label>Email</label>-->
<!--                    </td>-->
<!--                    <td>-->
<!--                        <input type="email" name="email" class="text" placeholder="Email">-->
<!--                    </td>-->
<!--                </tr>-->

<!--                <tr>-->
<!--                    <td>-->
<!--                        <label>Password</label>-->
<!--                    </td>-->
<!--                    <td>-->
<!--                        <input type="password" name="pass" class="text" placeholder="Password">-->
<!--                    </td>-->
<!--                </tr>-->
<!--                <tr>-->
<!--                    <td>-->
<!--                        <label>Contact No</label>-->
<!--                    </td>-->
<!--                    <td>-->
<!--                        <input type="text" name="contactno" class="text" placeholder="Contact No">-->
<!--                    </td>-->
<!--                </tr>-->
<!--                <tr>-->
<!--                    <td>-->
<!--                        <label>City</label>-->
<!--                    </td>-->
<!--                    <td>-->
<!--                        <input type="text" name="city" class="text" placeholder="City">-->
<!--                    </td>-->
<!--                </tr>-->
<!--                <tr>-->
<!--                    <td>-->
<!--                        <label>Address</label>-->
<!--                    </td>-->
<!--                    <td>-->
<!--                        <input type="text" name="address" class="text" placeholder="Address">-->
<!--                    </td>-->
<!--                </tr>-->
<!--                <tr>-->
<!--                    <td>-->
<!--                    </td>-->
<!--                    <td>-->
<!--                        <center>-->

<!--                            <input type="submit" value="Register Now" class="button">-->
<!--                        </center>-->
<!--                    </td>-->
<!--                </tr>-->
<!--            </table>-->
<!--        </form>-->
<!--    </div>-->
<!--</center>-->
<!--</body>-->
<!--</html>-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>
    <link href="Common/register/fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="Common/register/css/style.css">
</head>
<body>

<div class="main">
    <section class="signup">
        <div class="container">
            <div class="signup-content">
                <form method="POST" action="UserController" id="signup-form" class="signup-form">
                    <h2 class="form-title">Reset password</h2>
                    <div class="form-group">
                        <input type="text" class="form-input" name="code" id="email" placeholder="Enter code to reset password"/>
                    </div>

                    <div class="form-group">
                        <input type="text" class="form-input" name="password" id="code" placeholder="Enter new password"/>
                    </div>
                    <div class="form-group">
                        <input type="submit" style="cursor: pointer;" name="submit" id="submit" class="form-submit" value="Reset password"/>
                    </div>
                    <input type="hidden" name="action" value="reset">
                </form>
            </div>
        </div>
    </section>

</div>

<!-- JS -->
<script src="Common/register/vendor/jquery/jquery.min.js"></script>
<script src="Common/register/js/main.js"></script>
<script>
    document.getElementById("submit")
</script>
</body>
</html>