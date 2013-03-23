$(function(){
  $("body").on("click", ".panel_button", bounce_down);
  $("body").on("click", "#hide_button", bounce_hide);
  $('#create_account').click(slide_form_left);
  $('#login').click(slide_form_right);
});

function clear_form() {
  $('#form').empty();
}

function bounce_down(e){
  e.preventDefault();
  $("div#panel").animate({ height: "500px" }).animate({height: "400px" }, "fast");
  $("div.panel_button").toggle();
}

function bounce_hide(e){
  e.preventDefault();
  $("div#panel").animate({height: "0px"}, "fast");
}

function slide_form_left(e){
  e.preventDefault();
  $('#form_slider').animate({ left: "-775px"});
}
function slide_form_right(e){
  e.preventDefault();
  $('#form_slider').animate({ left: "0"});
}