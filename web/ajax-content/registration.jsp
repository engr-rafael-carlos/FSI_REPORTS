<!--
Project Title: FSI Reports
Company: Agile Solution Partners International Corporation
Front-End by: "engr-rafael-carlos"
Back-End by: "michaelyabut"
Date: August 5, 2015
Time: 10:48 PM
FileName: ajax-content/registration.jsp
Description: Registration Form
Version: 1.0.1

Last Update: August 7, 2015
-->

<div class="container-fluid">
    <div class="row">

        <div class="col-sm-6 col-sm-offset-3 col-lg-4 col-lg-offset-4">
            <div class="padding mt20">

                <form id="sign-in-form" action="FSIServlet">
                    <input type="hidden" name="method" value="create_inspector">

                    <!--Input User-->
                    <div class="form-group">
                        <input class="form-control" maxlength="255" placeholder="Inspector ID" name="inspectorid" required>
                    </div>

                    <!--Input Password-->
                    <div class="form-group">
                        <input class="form-control" placeholder="Inspector Name" name="inspectorname" required>
                    </div>

                    <!--Input Password-->
                    <div class="form-group">
                        <input class="form-control" placeholder="Inspector Address" name="inspectoraddress" required>
                    </div>

                    <!--Input Password-->
                    <div class="form-group">
                        <input class="form-control" placeholder="Inspector Contact" name="inspectorcontact" required>
                    </div>

                    <!--Input Password-->
                    <div class="form-group">
                        <input class="form-control" placeholder="Inspector Username" name="inspectorusername" required>
                    </div>

                    <!--Input Password-->
                    <div class="form-group">
                        <input class="form-control" placeholder="Inspector Password" type="password" name="inspectorpassword" required>
                    </div>

                    <!--Input Password-->
                    <div class="form-group">
                        <input class="form-control" placeholder="Confirm Password" type="password" name="inspectorconfirm" required>
                    </div>

                    <!--Sign In Button-->
                    <div class="form-group">
                        <button class="btn btn-success btn-block" type="submit" id="create_btn">Create</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

