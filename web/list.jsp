<!--
Project Title: FSI Reports
Company: Agile Solution Partners International Corporation
Front-End by: "engr-rafael-carlos"
Back-End by: "michaelyabut"
Date: August 5, 2015
Time: 10:48 PM
FileName: list.html
Description: List Form
Version: 1.0.0

Last Update: August 26, 2015
-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FSI | List</title>

    <!-- Mobile Specific Meta Tag -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <!-- =====================================
    Cascading Stylesheet Libraries and Plugins
    ===================================== -->

    <link href="css/design.css" rel="stylesheet" />

    <!-- =====================================
     Javascript Libraries and Plugins
    ===================================== -->
    <!-- JQuery -->
    <script type="text/javascript" src="js/lib/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="js/lib/jquery-2.1.4.js"></script>

    <!-- Bootstrap Javascript -->
    <script type="text/javascript" src="js/lib/bootstrap.js"></script>

    <!-- Easing -->
    <script src="js/plugins/jquery.easing.min.js"></script>

    <!-- Zozo -->
    <script src="js/plugins/zozo.tabs.js"></script>

    <!-- dataTables -->
    <script src="js/plugins/dataTables.js"></script>
    <script src="js/plugins/dataTables-responsive.js"></script>
    
    <!-- DateTimePicker -->
    <script src="js/plugins/moment.js"></script>
    <script src="js/plugins/bootstrap-datetimepicker.js"></script>
    
    <script src="js/application.js"></script>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-default navbar-fixed-top" id="navfsi">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#fsir" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand exo-m" href="#"><em>FSI Reports</em></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="fsir">
                <ul class="nav navbar-nav navbar-right open-sans">
                    <li><a href="#">Profile</a></li>
                    <li><a href="LogoutServlet">Log Out</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <!-- End Navigation Bar -->

    <!-- Tabs -->
    <div class="container mt100 mb70">
        <!-- Zozo Tabs Start-->
        <div id="tabbed-nav">

            <!-- Tab Navigation Menu -->
            <ul>
                <%--<li><a><h4 class="exo-m">Registration</h4><span class="exo-m">For Inspector</span></a></li>--%>
                <li><a><h4 class="exo-m">List</h4><span class="exo-m">Inspectors and Buildings</span></a></li>
            </ul>

            <!-- Content container -->
            <div>
                <!-- List -->
                <div class="z-content-pad">
                    <!-- Zozo Tabs 2 (nested) Start-->
                    <div class="nested-tabs">

                        <!-- Nested Tab Navigation Menu -->
                        <ul>
                            <li><a class="exo-m">Inspector</a></li>
                            <li><a class="exo-m">Buildings</a></li>
                        </ul>

                        <!-- Nested Content container -->
                        <div>
                            <!-- Inspector -->
                            <div data-content-url="ajax-content/inspector.jsp"></div>
                            <!-- End of Inspector -->
                            <!-- Buildings -->
                            <div data-content-url="ajax-content/buildings.jsp"></div>
                            <!-- End of Buildings -->
                        </div>
                    </div>
                    <!-- Zozo Tabs 2 (nested) End-->
                </div>
            </div>

        </div>
        <!-- Zozo Tabs End-->
    </div>
    <!-- End Tabs -->

    
    <!-- ================================= -->
    <!--             Modals                -->
    <!-- ================================= -->
    <!--For Inspector-->
    <!-- +++++++ Modal Edit +++++++ -->
    <div class="modal fade modal-success" id="i_modal_update">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title modal_title open-sans">Edit Inspector</h4>
                </div>
                <div class="modal-body modal_body">
                    <form id="sign-in-form" action="InspectorServlet">
                        <input type="hidden" name="i_method" id="i_hid_update">
                        <div class="form-group">
                            <input class="form-control" maxlength="255" id="i_update_id" name="i_update_id" readonly />
                        </div>
                        <div class="form-group">
                            <input class="form-control" maxlength="255" id="i_update_email" name="i_update_email" readonly />
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Name" maxlength="255" id="i_update_name" name="i_update_name" required />
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Address" maxlength="255" id="i_update_address" name="i_update_address" required />
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Contact No." maxlength="255" id="i_update_contact" name="i_update_contact" required />
                        </div>
                        <div class="form-group">
                            <button id="Update" class="btn btn-success btn-block i_update_btn" type="submit">Update</button>
                        </div>
                    </form>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!-- +++++++ End Modal Edit +++++++ -->

    <!-- +++++++ Modal Create +++++++ -->
    <div class="modal fade modal-success" id="i_modal_create">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title modal_title open-sans">Add Inspector</h4>
                </div>
                <div class="modal-body modal_body">
                    <form id="sign-in-form" action="InspectorServlet">
                        <input type="hidden" name="i_method" id="i_hid_create">
                        <div class="form-group">
                            <input class="form-control" placeholder="Inspector ID" maxlength="255" name="i_create_id" required />
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Name" maxlength="255" name="i_create_name" required />
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Address" maxlength="255" name="i_create_address" required />
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Contact No." maxlength="255" name="i_create_contact" required />
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Email" maxlength="255" name="i_create_email" required />
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Password" maxlength="255" name="i_password" required />
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Confirm Password" maxlength="255" name="i_confirm_password" required />
                        </div>
                        <div class="form-group">
                            <button id="Create" class="btn btn-success btn-block i_create_btn" type="submit">Create</button>
                        </div>
                    </form>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!-- +++++++ End Modal Create +++++++ -->
    
    <!--For Buildings-->
    <!-- +++++++ Modal Edit +++++++ -->
    <div class="modal fade modal-success" id="b_modal_update">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title modal_title open-sans">Edit Building</h4>
                </div>
                <div class="modal-body modal_body">
                    <form id="sign-in-form" action="BuildingServlet">
                        <input type="hidden" name="b_method" id="b_hid_update">

                        <div class="form-group">
                            <input class="form-control" maxlength="255" id="b_update_id" name="b_update_id" readonly />
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Admin" maxlength="255" id="b_update_admin" name="b_update_admin" required/>
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Address" maxlength="255" id="b_update_address" name="b_update_address" required />
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Contact No." maxlength="255" id="b_update_contact" name="b_update_contact" required />
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Inspector ID" maxlength="255" id="b_update_iid" name="b_update_iid" />
<!--                            <select class="form-control" id="b_update_iid" name="b_update_iid">
                                <c:forEach items="<%//=fsi.classes.Variables.getInstance().getList_of_inspector()%>" var="d">
                                <option value="">yep</option>
                                </c:forEach> 
                            </select> -->
                        </div>
                        <div class="form-group">

                            <input class="form-control" placeholder="Date of Inspection" maxlength="255" id="b_update_doi" name="b_update_doi" />
                        </div>
                        
                        <!--DateTime Picker-->
                        <div class="form-group">
                            <input class="form-control" placeholder="Date Inspected" maxlength="255" id="b_update_di" name="b_update_di" />
                        </div>
                                
                        <div class="form-group">

                            <input class="form-control" placeholder="Comment" maxlength="255" id="b_update_comm" name="b_update_comm" />
                        </div>
                        <div class="form-group">
                            <select class="form-control" name="b_update_stat" id="b_update_stat">
                                <option value="Pending" selected>Pending</option>
                                <option value="Urgent">Urgent</option>
                                <option value="Done">Done</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <button id="Update" class="btn btn-success btn-block b_update_btn" type="submit">Update</button>
                        </div>
                    </form>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!-- +++++++ End Modal Edit +++++++ -->

    <!-- +++++++ Modal Create +++++++ -->
    <div class="modal fade modal-success" id="b_modal_create">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title modal_title open-sans">Add Building</h4>
                </div>
                <div class="modal-body modal_body">
                    <form id="sign-in-form" action="BuildingServlet">
                        <input type="hidden" name="b_method" id="b_hid_create">
                        <div class="form-group">
                            <input class="form-control"  placeholder="Building ID" maxlength="255" name="b_create_id" required />
                        </div>
                        <div class="form-group">
                            <input class="form-control"  placeholder="Admin" maxlength="255" name="b_create_admin" required />
                        </div>
                        <div class="form-group">
                            <input class="form-control"  placeholder="Address" maxlength="255" name="b_create_address" required />
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Contact No." maxlength="255" name="b_create_contact" required />
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Inspector ID" maxlength="255" name="b_create_iid" />
                        </div>
                        <div class="form-group"> <!--DateTime Picker-->                          
                            <div class='input-group date' id='datetimepicker1'>
                                <input type='text' class="form-control" placeholder="Date of Inspection" maxlength="255" name="b_create_doi"/>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>                       
                        <div class="form-group">
                            <input class="form-control" placeholder="Comment" maxlength="255" name="b_create_comm" />
                        </div>
                        <div class="form-group">
                            <select class="form-control" name="b_create_stat" id="b_create_stat">
                                <option value="Pending" selected>Pending</option>
                                <option value="Urgent">Urgent</option>
                                <option value="Done">Done</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <button id="Create" class="btn btn-success btn-block b_create_btn" type="submit">Create</button>
                        </div>
                    </form>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!-- +++++++ End Modal Create +++++++ -->
    
    <!-- Footer -->
    <footer class="navbar-fixed-bottom">
        <div class="container">
            <h6 class="exo-l">Copyright 2015. FSI Reports. All Rights Reserved</h6>
        </div>
    </footer>
    <!-- End Footer -->


    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            /* jQuery activation and setting options for parent tabs with id selector*/
            $("#tabbed-nav").zozoTabs({
                position: "top-left",
                rounded: false,
                multiline: true,
                theme: "white",
                size: "medium",
                responsive: true,
                animation: {
                    effects: "slideH",
                    easing: "easeInOutExpo",
                    type: "jquery"
                },
                defaultTab: "tab1"
            });

            /* jQuery activation and setting options for nested tabs with class selector*/
            $(".nested-tabs").zozoTabs({
                position: "top-left",
                theme: "red",
                style: "underlined",
                rounded: false,
                shadows: false,
                defaultTab: "tab1",
                animation: {
                    easing: "easeInOutExpo",
                    effects: "slideH",
                    type: "jquery"
                },
                size: "xlarge"
            });
        });   
    </script>
</body>
</html>
