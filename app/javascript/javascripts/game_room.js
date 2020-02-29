$(document).on("turbolinks:load", function() {
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
  $("#tag_8").on("click", function() {
    $("#game_title").val("大乱闘スマッシュブラザーズ");
  });

  $("vc_possible").prop("checked");

  $("#vc_possible").change(function() {
    var val = $("#vc_possible").prop("checked");
    if (val) {
      $("#layout_none").fadeIn(500);
    } else {
      $("#layout_none").fadeOut(100);
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
    console.log("test");
    if (val) {
      $("#layout_none").fadeOut(100);
    }
  });

  $(".inlink")
    .parents(".testdiv")
    .removeClass("no_border")
    .addClass("ok_border");
  $(".index_show_button")
    .parents(".testdiv")
    .removeClass("no_border")
    .addClass("ok_border");

  $(".inlink")
    .parents(".testdiv")
    .children(".koko")
    .removeClass("room_game_title_no")
    .addClass("room_game_title");
  $(".index_show_button")
    .parents(".testdiv")
    .children(".koko")
    .removeClass("room_game_title_no")
    .addClass("room_game_title");
});
jQuery;
