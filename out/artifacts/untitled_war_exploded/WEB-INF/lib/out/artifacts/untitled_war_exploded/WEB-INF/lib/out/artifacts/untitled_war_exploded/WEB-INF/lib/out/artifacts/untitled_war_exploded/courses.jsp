<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="myPackage.classes.Courses" %>
<%@ page import="myPackage.DatabaseClass" %>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<%
    ArrayList<Courses> courses;
    courses = new DatabaseClass().getAllCourses();
    session.setAttribute("listcourses", courses);


%>
<link rel="stylesheet" href="Common/test/css/styleAccount.css">
<link rel="stylesheet" href="Common/test/fonts/font-awesome-4.7.0/css/font-awesome.css">


<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
    <div class="sidebar-background">
        <h2 class="logo-text">
            Online Examination System
        </h2>

        <div class="left-menu">
            <a href="adm-page.jsp?pgprt=0"><h2>Profile</h2></a>
            <a class="active" href="adm-page.jsp?pgprt=2"><h2>Courses</h2></a>
            <a href="adm-page.jsp?pgprt=3"><h2>Questions</h2></a>
            <a href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
        </div>
    </div>
</div>
<!-- CONTENT AREA -->
<div class="content-area" style="display: flex">

    <div class="panel" style="max-width: 640px;float:right;right: 30%;">
        <div class="title">
            All Courses
        </div>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" id="myBtnReg">Open Modal</button>
        <table id="one-column-emphasis" style="min-width: 400px;margin: 5px; margin-top: 35px">
            <colgroup>
                <col class="oce-first"/>
            </colgroup>
            <thead>
            <tr>
                <th scope="col">Course Code</th>
                <th scope="col">Courses</th>
                <th scope="col">T.Marks</th>
                <th scope="col">Time</th>
                <th scope="col">Update</th>
                <th scope="col">Action</th>

            </tr>
            </thead>

            <c:forEach var="item" items="${sessionScope.listcourses}">

                <tr>
                    <td style="padding: 12px 15px;">${item.cCode}</td>
                    <td style="padding: 12px 15px;">${item.cName}</td>
                    <td style="padding: 12px 15px;">${item.tMarks}</td>
                    <td style="padding: 12px 15px;">${item.time}</td>


                    <td style="padding: 20px 15px;">
                        <a href="CourseController?action=update&fCourseID=${item.cCode}"
                           type="submit" class="btn btn-primary" id="myBtn"><i class="fas fa-edit"></i>
                        </a>
                    </td>


                    <td style="padding: 12px 15px;">
                        <a type="submit" class="btn btn-danger" href="CourseController?action=delete&fCourseID=${item.cCode}"
                           onclick="return confirm('Are you sure you want to delete this ?');">
                            <i class="fas fa-trash-alt"></i>
                        </a>
                    </td>
                </tr>
            </c:forEach>


            <div id="myModal" class="modal">

                <!-- Modal content -->
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <form action="CourseController" method="POST">
                        <div class="modal-body">
                            <h2>Update Info</h2>
                            <input type="hidden" name="fCourseID" id="edit_courseid" value="${sessionScope.courseUpdate.cCode}">
                            <div class="form-group">
                                <label>Courses</label>
                                <input type="text" name="fCourseName" id="edit_coursefname" class="form-control"
                                       value="${sessionScope.courseUpdate==null ? "":sessionScope.courseUpdate.cName}">
                            </div>
                            <div class="form-group">
                                <label>T.Marks</label>
                                <input type="text" name="fMark" id="edit_coursemark" class="form-control"
                                       value="${sessionScope.courseUpdate==null ? "":sessionScope.courseUpdate.tMarks}">
                            </div>
                            <div class="form-group">
                                <label>Time</label>
                                <input type="text" name="ftime" id="edit_coursetime" class="form-control"
                                       value="${sessionScope.courseUpdate==null ? "":sessionScope.courseUpdate.time}">
                            </div>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeForm()">
                                Close
                            </button>
                            <input type="hidden" name="action" value="update">
                            <input type="submit" name="update_question" class="btn btn-primary" value="Update">
                        </div>
                    </form>
                </div>

            </div>


        </table>
    </div>

    <!-- The Modal -->
    <div id="myModalReg" class="modal">

        <!-- Modal content -->

        <div class="panel form-style-6" style="right:5%;max-width: 450px">

            <div class="title">
                Add New Course
            </div>

            <span style="position: relative;left: 190px;font-size: 28px;" class="closeReg">X</span>
            <center>
                <form action="CourseController?action=add" method="post">
                    <br>
                    <table>
                        <tr>
                            <td><label>Course Code</label></td>
                            <td><input type="text" name="courseCode" class="text" placeholder="Course Name"
                                       style="width: 230px;"></td>
                        </tr>
                        <tr>
                            <td><label>Course Name</label></td>
                            <td><input type="text" name="coursename" class="text" placeholder="Course Name"
                                       style="width: 230px;"></td>
                        </tr>
                        <tr>
                            <td><label>Total Marks</label></td>
                            <td><input type="text" name="totalmarks" class="text" placeholder="Total Marks"
                                       style="width: 230px;"></td>
                        </tr>
                        <tr>
                            <td><label>Exam Time</label></td>
                            <td>
                                <input type="text" name="time" class="text" placeholder="MM" style="width: 230px;">
                            </td>

                        </tr>

                        <tr>
                            <td colspan="2"><input type="hidden" name="page" value="courses">
                                <input type="hidden" name="operation" value="addnew">



                                    <input type="submit" class="form-button" value="Add" name="submit">
                            </td>
                        </tr>
                    </table>

                </form>


            </center>

        </div>

    </div>
    </div>


    <%
        if(session.getAttribute("isUpdate")!=null) {
            out.println("<script>var modal = document.getElementById(\"myModal\");" +
                    "modal.style.display = \"block\";</script>");
        }
    %>
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
            <%
                session.removeAttribute("isUpdate");
                session.removeAttribute("courseUpdate");
            %>
        }
    </script>

<script>


    // Get the modal
    var modalReg = document.getElementById("myModalReg");

    // Get the button that opens the modal
    var btnReg = document.getElementById("myBtnReg");

    // Get the <span> element that closes the modal
    var spanReg = document.getElementsByClassName("closeReg")[0];

    // When the user clicks the button, open the modal
    btnReg.onclick = function () {
        modalReg.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    spanReg.onclick = function () {
        modalReg.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modalReg) {
            modalReg.style.display = "none";
        }
    }


</script>
</div>
                       