<%@page import="java.util.ArrayList" %>
<%@ page import="myPackage.classes.Courses" %>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>




<link rel="stylesheet" href="Common/test/css/styleAccount.css">
<link rel="stylesheet" href="Common/test/fonts/font-awesome-4.7.0/css/font-awesome.css">

<style>


    /* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding-top: 100px; /* Location of the box */
        left: 163px;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0, 0, 0); /* Fallback color */
        background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
    }

    /* Modal Content */
    .modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 50%;
    }

    /* The Close Button */
    .close {
        color: #aaaaaa;

        font-size: 28px;
        float: right;
        font-weight: bold;
        position: relative;
        left: 688px;
        top: -10px;
    }



    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }
</style>
<!-- SIDEBAR -->
<div class="sidebar" style="background-image: url(Common/Manual/sidebar-1.jpg)">
    <div class="sidebar-background">
        <h2 class="logo-text">
            Online Examination System
        </h2>

        <div class="left-menu">
            <a href="adm-page.jsp?pgprt=0"><h2>Profile</h2></a>
            <a href="adm-page.jsp?pgprt=2"><h2>Courses</h2></a>
            <a class="active" href="adm-page.jsp?pgprt=3"><h2>Questions</h2></a>
            <a href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
        </div>
    </div>
</div>
<!-- CONTENT AREA -->
<div class="content-area" style="display: flex;flex-direction: row-reverse">
    <div class="panel form-style-6" style="min-width: 300px;max-width: 390px">
        <form action="adm-page.jsp">
            <div class="title">Show All Questions for</div>
            <a id="myBtn" class="button" style="text-decoration: none!important;"><span class="add-btn" style="margin-left: 80px;">Add New Question</span></a>
            <br><br>
            <label>Select Course</label>
            <input type="hidden" name="pgprt" value="4">
            <select name="coursename" class="text">
                <%
                    ArrayList<Courses> list1 = pDAO.getAllCourses();

                    for (int i = 0; i < list1.size(); i++) {
                %>
                <option value="<%=list1.get(i).getcCode()%>"><%=list1.get(i).getcName()%>
                </option>
                <%
                    }
                %>
            </select>
            <input type="submit" value="Show" class="form-button">
        </form>
    </div>






    <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="panel form-style-6" style="max-width: 700px!important;">
            <form action="QuestionController" method="post">
                <div class="title">Add New Question</div>
                <span style="position: relative;left: 3px;font-size: 20px;" class="close">x</span>
                <table>
                    <tr>
                        <td><label>Course Name</label></td>
                        <td colspan="3">
                            <select name="coursename" class="text">
                                <%
                                    ArrayList<Courses> list = pDAO.getAllCourses();

                                    for (int i = 0; i < list.size(); i = i + 2) {
                                %>
                                <option value="<%=list.get(i).getcCode()%>"><%=list.get(i).getcName()%>
                                </option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label>Your Question:</label></td>
                        <td colspan="4"><input type="text" name="question" class="text"
                                               placeholder="Type your question here" style="width: 420px;"></td>
                        <br>
                    </tr>
                    <tr>
                        <td><label>Options</label></td>
                        <td><input type="text" name="opt1" class="text" placeholder="First Option" style="width: 130px;"><br>
                        </td>
                        <td><input type="text" name="opt2" class="text" placeholder="Second Option" style="width: 130px;"><br>
                        </td>
                        <td><input type="text" name="opt3" class="text" placeholder="Third Option" style="width: 130px;"><br>
                        </td>
                        <td><input type="text" name="opt4" class="text" placeholder="Fourth Option" style="width: 130px;">
                        </td>
                    </tr>
                    <tr>
                        <td><label>Correct Answer</label></td>
                        <td colspan="4">
                            <center><input type="text" name="correct" class="text" placeholder="Correct Answer"
                                           style="width: 130px;"></center>
                        </td>
                    <tr>


                        <input type="hidden" name="action" value="add">
                    </tr>
                </table>
                <input type="submit" class="form-button" value="Add" name="submit">
            </form>


        </div>

    </div>



</div>




<script>


    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal
    btn.onclick = function () {
        modal.style.display = "block";
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

    function closeForm() {
        modal.style.display = "none";

    }
</script>


<%--    <div class="panel form-style-6" style="max-width: 700px!important;">--%>
<%--        <form action="QuestionController" method="post">--%>
<%--            <div class="title">Add New Question</div>--%>
<%--            <table>--%>
<%--                <tr>--%>
<%--                    <td><label>Course Name</label></td>--%>
<%--                    <td colspan="3">--%>
<%--                        <select name="coursename" class="text">--%>
<%--                            <%--%>
<%--                                ArrayList<Courses> list = pDAO.getAllCourses();--%>

<%--                                for (int i = 0; i < list.size(); i = i + 2) {--%>
<%--                            %>--%>
<%--                            <option value="<%=list.get(i).getcCode()%>"><%=list.get(i).getcName()%>--%>
<%--                            </option>--%>
<%--                            <%--%>
<%--                                }--%>
<%--                            %>--%>
<%--                        </select>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td><label>Your Question:</label></td>--%>
<%--                    <td colspan="4"><input type="text" name="question" class="text"--%>
<%--                                           placeholder="Type your question here" style="width: 420px;"></td>--%>
<%--                    <br>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td><label>Options</label></td>--%>
<%--                    <td><input type="text" name="opt1" class="text" placeholder="First Option" style="width: 130px;"><br>--%>
<%--                    </td>--%>
<%--                    <td><input type="text" name="opt2" class="text" placeholder="Second Option" style="width: 130px;"><br>--%>
<%--                    </td>--%>
<%--                    <td><input type="text" name="opt3" class="text" placeholder="Third Option" style="width: 130px;"><br>--%>
<%--                    </td>--%>
<%--                    <td><input type="text" name="opt4" class="text" placeholder="Fourth Option" style="width: 130px;">--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td><label>Correct Answer</label></td>--%>
<%--                    <td colspan="4">--%>
<%--                        <center><input type="text" name="correct" class="text" placeholder="Correct Answer"--%>
<%--                                       style="width: 130px;"></center>--%>
<%--                    </td>--%>
<%--                <tr>--%>


<%--                <input type="hidden" name="action" value="add">--%>
<%--                </tr>--%>
<%--            </table>--%>
<%--            <input type="submit" class="form-button" value="Add" name="submit">--%>
<%--        </form>--%>


<%--    </div>--%>
</div>