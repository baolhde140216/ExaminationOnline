<%@page import="myPackage.classes.Questions" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="myPackage.DatabaseClass" %>
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
<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
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
<div class="content-area">
    <center>
        <%


            if (request.getParameter("coursename") != null) {
                ArrayList list = pDAO.getAllQuestions(request.getParameter("coursename"));
                for (int i = 0; i < list.size(); i++) {
                    Questions question = (Questions) list.get(i);
        %>
        <div class="question-panel">
            <div class="question">
                <label class="question-label"><%=i + 1 %>
                </label>
                <%=question.getQuestion() %>
                <a href="QuestionController?action=update&fQuesionID=<%=question.getQuestionId()%>&coursename=<%=
                request.getParameter("coursename")%>"
                   type="submit">
                    <div class="btn btn-primary" id="myBtn" style="position: absolute;right: 103px;top: -20px;padding: 10px;">Update</div>
                </a>
                <a href="QuestionController?action=delete&fQuesionID=<%=question.getQuestionId()%>
                    &coursename=<%=request.getParameter("coursename")%>"
                   onclick="return confirm('Are you sure you want to delete this ?');">
                    <div class="delete-btn" style="position: absolute;right: 10px;top: -20px;">Delete</div>
                </a>
            </div>
            <div class="answer">
                <label class="show"><%=question.getOpt1() %>
                </label>
                <label class="show"><%=question.getOpt2() %>
                </label>
                <label class="show"><%=question.getOpt3() %>
                </label>
                <label class="show"><%=question.getOpt4() %>
                </label>
                <label class="show-correct"><%=question.getCorrect() %>
                </label>
            </div>

        </div>

        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <form action="QuestionController" method="POST">
                    <div class="modal-body">
                        <h2>Update Info</h2>
                        <input type="hidden" name="questionID" id="edit_questionID" value="${sessionScope.questionUpdate.questionId}">
                        <input type="hidden" name="coursename" id="edit_coursename" value="${sessionScope.questionUpdate.courseName}">
                        <div class="form-group">
                            <label>Question Name</label>
                            <input type="text" name="question" id="edit_question" class="form-control"
                                   value="${sessionScope.questionUpdate.question}">
                        </div>
                        <div class="form-group">
                            <label>Opt1</label>
                            <input type="text" name="opt1" id="edit_fopt1" class="form-control"
                                   value="${sessionScope.questionUpdate.opt1}">
                        </div>
                        <div class="form-group">
                            <label>Opt2</label>
                            <input type="text" name="opt2" id="edit_fopt2" class="form-control"
                                   value="${sessionScope.questionUpdate.opt2}">
                        </div>
                        <div class="form-group">
                            <label>Opt3</label>
                            <input type="text" name="opt3" id="edit_fopt3" class="form-control"
                                   value="${sessionScope.questionUpdate.opt3}">
                        </div>
                        <div class="form-group">
                            <label>Opt4</label>
                            <input type="text" name="opt4" id="edit_fopt4" class="form-control"
                                   value="${sessionScope.questionUpdate.opt4}">
                        </div>
                        <div class="form-group">
                            <label>Correct</label>
                            <input type="text" name="correct" id="edit_fcorrect" class="form-control"
                                   value="${sessionScope.questionUpdate.correct}">
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




        <%
                }
            } %>
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
                    session.removeAttribute("questionUpdate");
                %>
            }
        </script>
    </center>

</div>