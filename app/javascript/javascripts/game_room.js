(function($) {
  $(document).ready(function() {
    $("#tag_1").on("click", function() {
      $("#game_title").val("ApexLegends");
    });

    $("#tag_2").on("click", function() {
      $("#game_title").val("PUBG");
    });

    $("#tag_3").on("click", function() {
      $("#game_title").val("Fortnite");
    });

    $("#tag_4").on("click", function() {
      $("#game_title").val("FF14");
    });

    $("#tag_5").on("click", function() {
      $("#game_title").val("dead by daylight");
    });

    $("#tag_6").on("click", function() {
      $("#game_title").val("ポケモン ソード・シールド");
    });

    $("#tag_7").on("click", function() {
      $("#game_title").val("モンスターハンターworld");
    });

    $("vc_possible").prop("checked");

    $("#vc_possible").change(function() {
      var val = $("#vc_possible").prop("checked");
      if (val) {
        // $("#layout_none").removeClass("layout_none");
        // $("#layout_none").addClass("layout_block");
        $("#layout_none").fadeIn(500);
      } else {
        // $("#layout_none").removeClass("layout_block");
        $("#layout_none").fadeOut(100);
        // $("#layout_none").addClass("layout_none");
      }
    });

    $("#vc_possible_index").change(function() {
      var val = $("#vc_possible_index").prop("checked");
      if (val) {
        $("#layout_none").fadeIn(500);
      }
    });
    $("#vc_possible_index_none").change(function() {
      var val = $("#vc_possible_index_none").prop("checked");
      if (val) {
        $("#layout_none").fadeOut(100);
      }
    });
    $("#vc_possible_index_no").change(function() {
      var val = $("#vc_possible_index_no").prop("checked");
      if (val) {
        $("#layout_none").fadeOut(100);
      }
    });
  });
})(jQuery);
