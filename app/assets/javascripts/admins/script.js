$(document).ready(function () {
  $.ajaxSetup({
    headers: {
      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
  });

  $( "#InviteModal" ).on('show.bs.modal', function(){
      $("#inviteName").val("");
      $('#inviteResultList').empty();
  });


  $(".updateFoodBtn").on("click", function () {
    var id = $(this).val();
    $.ajax({
        url: '/admins/foods/' + id,
        type: 'GET',
        dataType: 'JSON'
    }).done(function(result) {
        $("#updateFoodModal #u_f_id").val(result.data.id);
        $("#updateFoodModal #u_f_name").val(result.data.name);
        $("#updateFoodModal #u_f_price").val(result.data.price);
        $("#updateFoodModal").modal("show");
    });
  })

  $("#updateFoodModal #u_f_btn").on("click",function () {
    var id = $("#updateFoodModal #u_f_id").val();
    var name = $("#updateFoodModal #u_f_name").val();
    var price = $("#updateFoodModal #u_f_price").val();
    $.ajax({
        url: '/admins/foods/' + id,
        type: 'PUT',
        dataType: 'JSON',
        data: {
          name : name,
          price : price
        }
    }).done(function (result) {
      $("#updateFoodModal").modal("hide");
      location.reload();
    })
  })

})
