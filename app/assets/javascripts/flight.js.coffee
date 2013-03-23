class Flight
  @document_ready: ->
    $('#form').on('click', 'a[data-clear-form]', Flight.clear_form)

  @clear_form: (e) ->
    e.preventDefault()
    $('#create_flight').show()
    $('#form').empty()

$(document).ready(Flight.document_ready)

