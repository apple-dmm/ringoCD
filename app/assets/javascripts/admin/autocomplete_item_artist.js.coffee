$ ->
  $("#item_artist_field").autocomplete
    source: (req, res) ->
      $.ajax
        url: "/admin/items/autocomplete_artist/" + encodeURIComponent(req.term) + ".json",
        dataType: "json",
        success: (data) ->
          res(data)
    ,
    autoFocus: true,
    delay: 300,
    minLength: 2