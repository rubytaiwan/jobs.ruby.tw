//= require rails

$(document).bind("mobileinit", function() {
  $.mobile.ajaxLinksEnabled = false;
  $.mobile.ajaxFormsEnabled = false;
} );

$(document).ready(function() {
  $("a.jobpreview").live("click.preview", function(event) {
    var $this = $(this);
    var jobform = {
      url: "/jobs/preview",
      data: $(this).parents("form").serialize(),
      type: "post"
    };
    var back = $this.data("back"),
        transition = $this.data("transition");
    console.debug(jobform);
    $.mobile.changePage(jobform, undefined, undefined, true);
    event.preventDefault();
  } );
} );
