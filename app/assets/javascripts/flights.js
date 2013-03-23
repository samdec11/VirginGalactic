function show_search_form(){
  $('#search_form').removeClass('hide');
  $('#searchbtn').addClass('hide');
}
function cancel_search(){
  $('.airports').val('');
  $('#search_form').addClass('hide');
  $('#searchbtn').removeClass('hide');
}