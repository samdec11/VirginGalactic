$(function(){
  $('table').on('click','.empty',reserver);
  $('#flight_dep_time').datepicker();
});


function show_search_form(){
  $('#search_form').removeClass('hide');
  $('#searchbtn').addClass('hide');
}
function cancel_search(){
  $('.airports').val('');
  $('#search_form').addClass('hide');
  $('#searchbtn').removeClass('hide');
}
function reserver(){
var id = $(this).attr("data-id");
$.ajax({
  dataType: 'script',
  type:'post',
  url: '/seats/'+id+'/reserve/'
}).done(reserved);

}

function reserved(){
  $('table').on('click','.empty',reserver);
}