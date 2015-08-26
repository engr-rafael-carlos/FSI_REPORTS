<!--
Project Title: FSI Reports
Company: Agile Solution Partners International Corporation
Front-End by: "engr-rafael-carlos"
Back-End by: "michaelyabut"
Date: August 5, 2015
Time: 10:48 PM
FileName: dashboard.html
Description: Dashboard
Version: 1.0.0

Last Update: August 5, 2015
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>FSI | Dashboard</title>

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

  <!-- Application -->
  <script type="text/javascript" src="js/application.js"></script>

</head>
<body>
    <%fsi.classes.ListData.list_buildings();%>
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
                    <li><a href="#"><%=fsi.classes.Variables.getInstance().getInspector_name()%></a></li>
                    <li><a href="LogoutServlet">Log Out</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <!-- End Navigation Bar -->

    <!-- Name, Search Bar -->
    <div class="container mt60">
        <div class="row">
            <%--<div class="col-xs-12 col-sm-6">--%>
                <%--<h3 class="exo-n"><%=fsi.classes.Variables.getInstance().getInspector_name()%></h3>--%>
            <%--</div>--%>

            <div class="col-xs-12 col-sm-offset-8 col-sm-4">
                <div class="input-group mt10">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="ion-ios-search-strong"></i></button>
                    </span>
                </div><!-- /input-group -->                
            </div>
        </div>
    </div>
    <!-- End Name, Search Bar -->

    <div class="container">
        <hr />
    </div>    

    <!-- Dashboard -->
    <div class="container mt15 mb50">
        <div class="row">
            <%java.util.Vector<java.util.ArrayList<String>> data = fsi.classes.Variables.getInstance().getList_of_building();
            if(data != null) {
                for( int ctr = 0; ctr < data.size(); ctr++ ) {%>
            <!--Item-->
            <div class="col-xs-12 col-sm-6">
                <%String design;
                    String text;
                    String status = data.get(ctr).get(0); // Status
                    if(status.equals("Done")) {
                        design = "panel-success";
                        text = "text-success";
                    }
                    else if(status.equals("Urgent")) {
                        design = "panel-danger";
                        text = "text-danger";
                    }
                    else {
                        design = "";
                        text = "text-muted";
                    }%>
                <div class="panel panel-default <%=design%>">
                    <div class="panel-body exo-n thmb">
                        <div class="row">
                            <!--Left Side-->
                            <div class="col-xs-12 col-sm-12 col-md-8 main_building">
                                <h3 class="bldg_name_<%=data.get(ctr).get(1)%>"><%=data.get(ctr).get(1)%></h3> <!-- building id -->
                                <h5 class="bldg_add_<%=data.get(ctr).get(1)%>"><%=data.get(ctr).get(2)%></h5> <!-- address -->
                                <h5  class="bldg_date_<%=data.get(ctr).get(1)%>"><b>Date of Inspection: </b><%=data.get(ctr).get(3)%></h5> <!-- date of inspection -->
                                <div class="mt30">
                                    <h5  class="bldg_contact_<%=data.get(ctr).get(1)%>"><b>Contact Person: </b><%=data.get(ctr).get(4)%></h5> <!--building admin -->
                                </div>
                            </div>
                            <!--End Left Side-->
                            <!--Right Side-->
                            <div class="col-xs-12 col-sm-12 col-md-4 text-right">
                                <h2 class="<%=text%> status"><%=status%></h2>
                                <div class="mt65">
                                    <button id="<%=data.get(ctr).get(1)%>" class="btn btn-primary btn-fsi">View</button>
                                </div>
                            </div>
                            <!--End Right Side-->
                        </div>
                    </div>
                </div>
            </div>
            <!--End Item-->
            <%}
            }%>
        </div>
    </div>
    <!-- End Dashboard -->

    <!-- +++++++ Modals +++++++ -->
    <div class="modal fade modal-success" id="my_modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title modal_title"></h4>
                </div>
                <div class="modal-body modal_body">
                    <%-- display building data --%>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!-- +++++++ End Modals +++++++ -->


    <!-- Footer -->
    <footer class="navbar-fixed-bottom">
        <div class="container">
            <h6 class="exo-l">Copyright 2015. FSI Reports. All Rights Reserved</h6>
        </div>        
    </footer>
    <!-- End Footer -->

</body>
</html>


<script>
    $(document).ready(function(){
       $('.btn-fsi').click(function(){
          $('#my_modal').modal('show');
          var bldg_id = $(this).attr('id');
          var bldg_add = $('.bldg_add_' + bldg_id).text();
          var bldg_date = $('.bldg_date_' + bldg_id).text();
          var bldg_contact = $('.bldg_contact_' + bldg_id).text();

//          console.log("bldg_add:"+bldg_add);
          var new_from = "<h4>"+ bldg_add +"</h4>" +
                         "<h4>"+ bldg_date +"</h4>" +
                         "<h4>"+ bldg_contact +"</h4>";
           console.log(new_from);

          $('.modal_body').html(new_from);
          $('.modal_title').html(bldg_id);
       });
    });
</script>
