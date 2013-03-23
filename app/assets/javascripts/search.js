$(function(){
  availableTags=[];
  $( ".airports" ).autocomplete({
      source: availableTags
    });
});