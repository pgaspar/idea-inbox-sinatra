jQuery(function ($) {

  $(document).on("click", "#bt-dw, #bt-up", function(event) {
    event.preventDefault();
    const vote_page = $(this).closest(".entry-votes").data("vote-page");
    const id = $(this).closest(".btn-group").data("entry-id");
    const up = $(this).attr("value");

    $.post(`/entry/${id}/vote`, { up: up }, function(response){
      if (!vote_page) {
        $("#entry-" + id + " .entry-votes").html(response);
      } else {
        $(".entry-votes").html(response);
      }
    });
  });

});
