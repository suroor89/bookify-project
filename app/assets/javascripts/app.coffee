$(document).on "ajax:error", "form", (evt, xhr, status, error) ->
   errors = xhr.responseJSON.error
   for message of errors
      $('#comment-errors').append '<li>' + errors[message] + '</li>'
