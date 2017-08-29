jQuery(function ($) {

  $("#entry-form").submit(function() {
    var len = $("#entry-input").val().length;

    if ( len < 1 || len > 300 ) {
      $("#warning").css("visibility", "visible");
      return false;
    } else {
      $("#warning").css("visibility", "hidden");
    }
  });

  $("#separator a").click(function(e) {
    $("#buried-entries").show();
    $(this).parent("#separator").remove();
  });

});
