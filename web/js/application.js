// ============== Log In ============== //
//Error
function error_message() {
    btn_effect();
    $('#error-message').show();
    setTimeout(function(){
        $('#error-message').fadeOut();
    },2000);

    return false;
}


//button animation when input has an error
function btn_effect() {

    var animationName = 'animated shake';
    var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
    $('#sign_in_btn').addClass(animationName).html('Nope').one(animationEnd,
        function () {
            $(this).removeClass(animationName).html("Let's Go");
        });
}


// ============== List of Inspector ============== //
    // ------- Modal Edit per row
    $(document).ready(function(){
        $('.insp_update_btn').click(function(){
            $('#i_modal_update').modal('show');
            var insp_id = $(this).attr('id');
            var insp_email = $('.insp_email_' + insp_id).text();
            var insp_name = $('.insp_name_' + insp_id).text();
            var insp_add = $('.insp_add_' + insp_id).text();
            var insp_contact = $('.insp_cont_' + insp_id).text();

            document.getElementById('i_update_id').value = insp_id;
            document.getElementById('i_update_email').value = insp_email;
            document.getElementById('i_update_name').value = insp_name;
            document.getElementById('i_update_address').value = insp_add;
            document.getElementById('i_update_contact').value = insp_contact;
        });
    });

    $(document).ready(function(){
        $('.i_update_btn').click(function(){
            document.getElementById('i_hid_update').value = $(this).attr('id'); // set update
        });
        $('.i_create_btn').click(function(){
            document.getElementById('i_hid_create').value = $(this).attr('id'); // set create
        });

    });
    
// ============== List of Buildings ============== //
    $(document).ready(function(){
        $('.bldg_update_btn').click(function(){
            $('#b_modal_update').modal('show');
            var bldg_id = $(this).attr('id');
            var bldg_admin = $('.bldg_admin_' + bldg_id).text();
            var bldg_add = $('.bldg_add_' + bldg_id).text();
            var bldg_cont = $('.bldg_cont_' + bldg_id).text();
            var bldg_iid = $('.bldg_iid_' + bldg_id).text();
            var bldg_doi = $('.bldg_doi_' + bldg_id).text();
            var bldg_di = $('.bldg_di_' + bldg_id).text();
            var bldg_comm = $('.bldg_comm_' + bldg_id).text();
            var bldg_stat= $('.bldg_stat_' + bldg_id).text();

            document.getElementById('b_update_id').value = bldg_id;
            document.getElementById('b_update_admin').value = bldg_admin;
            document.getElementById('b_update_address').value = bldg_add;
            document.getElementById('b_update_contact').value = bldg_cont;
            document.getElementById('b_update_iid').value = bldg_iid;
            document.getElementById('b_update_doi').value = bldg_doi;
            document.getElementById('b_update_di').value = bldg_di;
            document.getElementById('b_update_comm').value = bldg_comm;
            document.getElementById('b_update_stat').value = bldg_stat;
        });
    });

    $(document).ready(function(){
        $('.b_update_btn').click(function(){
            document.getElementById('b_hid_update').value = $(this).attr('id'); // set update
        });
        $('.b_create_btn').click(function(){
            document.getElementById('b_hid_create').value = $(this).attr('id'); // set create
        });

    });
    
    
// ============== DateTime Picker ============== //

    //For Add Building
    $(function () {
        $('#datetimepicker1').datetimepicker({
            pickTime: false,
            format: 'MM/DD/YYYY'
        });
    });