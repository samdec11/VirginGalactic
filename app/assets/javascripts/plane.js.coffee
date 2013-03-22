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
      dataType: 'script'
      type: "get"
      url: "/planes/" +planeid
    }).done(show_new_plane);
$(document).ready(Plane.document_ready)

