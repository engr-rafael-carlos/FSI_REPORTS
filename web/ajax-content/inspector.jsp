<!--
Project Title: FSI Reports
Company: Agile Solution Partners International Corporation
Front-End by: "engr-rafael-carlos"
Back-End by: "michaelyabut"
Date: August 5, 2015
Time: 10:48 PM
FileName: ajax-content/inspector.jsp
Description: List of Inspector Form
Version: 1.0.0

Last Update: August 26, 2015
-->
<script src="js/application.js"></script>

<%fsi.classes.ListData.list_cinspectors();%>
<div class="container-fluid">
    <div class="row">
        <button class="btn btn-warning" data-toggle="modal" data-target="#i_modal_create" style="margin-bottom:7px">Add Inspector</button><!-- edit -->
        <table class="table hover exo-l" cellspacing="0" id="list-inspector" width="100%">
            <thead>
                <tr>
                    <th>Inspector ID</th>
                    <th>Username</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Contact No.</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <td>Inspector ID</td>
                    <td>Username</td>
                    <td>Name</td>
                    <td>Address</td>
                    <td>Contact No.</td>
                    <td>Action</td>
                </tr>
            </tfoot>
            <tbody>
            <%java.util.Vector<java.util.ArrayList<String>> data = fsi.classes.Variables.getInstance().getList_of_cinspector();
                if(data != null) {
                    for( int ctr = 0; ctr < data.size(); ctr++ ) {%>
                        <tr>
                            <td class="insp_id_<%=data.get(ctr).get(0)%>"><%=data.get(ctr).get(0)%></td> <!-- inspector id -->
                            <td class="insp_uname_<%=data.get(ctr).get(0)%>"><%=data.get(ctr).get(1)%></td> <!-- inspector username -->
                            <td class="insp_name_<%=data.get(ctr).get(0)%>"><%=data.get(ctr).get(2)%></td> <!-- inspector name -->
                            <td class="insp_add_<%=data.get(ctr).get(0)%>"><%=data.get(ctr).get(3)%></td> <!-- inspector address -->
                            <td class="insp_cont_<%=data.get(ctr).get(0)%>"><%=data.get(ctr).get(4)%></td> <!-- inspector contact no. -->
                            <td class="text-center">
                                <button id="<%=data.get(ctr).get(0)%>" class="btn btn-primary btn-sm insp_update_btn">Edit</button><!-- edit -->
                            </td>
                        </tr>
                    <%}%>
                <%}%>
            </tbody>
        </table>
    </div>
</div>

<script>
    // ------- dataTable
    $(document).ready(function() {
        $('#list-inspector').dataTable({
            ordering: true,
            searching: true,
            paging: true,
            lengthChange: true,
            responsive: true
        });
    });
</script>