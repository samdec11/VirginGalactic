class Plane
  @document_ready: ->
    $('#form').on('click', 'a[data-clear-form]', Plane.clear_form)

  @clear_form: (e) ->
    e.preventDefault()
    $('#create_plane').show();
    $('#form').empty()

$(document).ready(Plane.document_ready)