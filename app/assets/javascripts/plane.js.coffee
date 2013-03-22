class Plane
  @document_ready: ->
    $('#form').on('click', 'a[data-clear-form]', Plane.clear_form)
    $('body').on('change', '#plane_select', Plane.change_plane_data)

  @clear_form: (e) ->
    e.preventDefault()
    $('#create_plane').show()
    $('#form').empty()

  @change_plane_data: ->
    planeid = $("#plane_select").val()
    $.ajax({
      dataType: 'json'
      type: "get"
      url: "/priorities/" +id + "/up"
    }).done(resort);
$(document).ready(Plane.document_ready)