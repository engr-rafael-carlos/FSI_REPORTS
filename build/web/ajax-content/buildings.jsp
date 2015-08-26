<!--
Project Title: FSI Reports
Company: Agile Solution Partners International Corporation
Front-End by: "engr-rafael-carlos"
Back-End by: "michaelyabut"
Date: August 5, 2015
Time: 10:48 PM
FileName: ajax-content/buildings.jsp
Description: List of Buildings Form
Version: 1.0.0

Last Update: August 26, 2015
-->

<script src="js/application.js"></script>

<%fsi.classes.ListData.list_cbuildings();%>
<div class="container-fluid">
    <div class="row">
        <button class="btn btn-warning" data-toggle="modal" data-target="#b_modal_create">Add Building</button><!-- edit -->
        <table class="table exo-l" cellspacing="0" id="list-building" width="100%">
            <thead>
                <tr>
                    <th>Building ID</th>
                    <th>Admin</th>
                    <th>Address</th>
                    <th>Contact No.</th>
                    <th>Inspector ID</th>
                    <th>Date of Inspection</th>
                    <th>Date Inspected</th>
                    <th>Comment</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <td>Building ID</td>
                    <td>Admin</td>
                    <td>Address</td>
                    <td>Contact No.</td>
                    <td>Inspector ID</td>
                    <td>Date of Inspection</td>
                    <td>Date Inspected</td>
                    <td>Comment</td>
                    <td>Status</td>
                    <td>Action</td>
                </tr>
            </tfoot>
            <tbody>
            <%java.util.Vector<java.util.ArrayList<String>> data = fsi.classes.Variables.getInstance().getList_of_cbuilding();
                if(data != null) {
                    for( int ctr = 0; ctr < data.size(); ctr++ ) {%>
            <tr>
                <td class="bldg_id_<%=data.get(ctr).get(0)%>"><%=data.get(ctr).get(0)%></td> <!-- building_id -->
                <td class="bldg_admin_<%=data.get(ctr).get(0)%>"><%=data.get(ctr).get(1)%></td> <!-- building_admin -->
                <td class="bldg_add_<%=data.get(ctr).get(0)%>"><%=data.get(ctr).get(2)%></td> <!-- building_address -->
                <td class="bldg_cont_<%=data.get(ctr).get(0)%>"><%=data.get(ctr).get(3)%></td> <!-- building_contact -->
                <td class="bldg_iid_<%=data.get(ctr).get(0)%>"><%=data.get(ctr).get(4)%></td> <!-- inspector_id -->
                <td class="bldg_doi_<%=data.get(ctr).get(0)%>"><%=data.get(ctr).get(5)%></td> <!-- date_of_inspection -->
                <td class="bldg_di_<%=data.get(ctr).get(0)%>"><%=data.get(ctr).get(6)%></td> <!-- date_inspected -->
                <td class="bldg_comm_<%=data.get(ctr).get(0)%>"><%=data.get(ctr).get(7)%></td> <!-- comment -->
                <td class="bldg_stat_<%=data.get(ctr).get(0)%>"><%=data.get(ctr).get(8)%></td> <!-- status -->
                <td class="text-center">
                    <button id="<%=data.get(ctr).get(0)%>" class="btn btn-primary btn-sm bldg_update_btn">Edit</button><!-- edit -->
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
        $('#list-building').dataTable({
            ordering: true,
            searching: true,
            paging: true,
            lengthChange: false
        });
    });
</script>