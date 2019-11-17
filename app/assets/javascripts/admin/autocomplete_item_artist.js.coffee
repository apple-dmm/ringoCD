$ ->
  $("#item_name_field").autocomplete
    source: (req, res) ->
      $.ajax
        url: "/items/autocomplete_artist/" + encodeURIComponent(req.term) + ".json",
        dataType: "json",
        success: (data) ->
          res(data)
    ,
    autoFocus: true,
    delay: 300,
    minLength: 2