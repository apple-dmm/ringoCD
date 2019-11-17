$ ->
  $("#item_label_field").autocomplete
    source: (req, res) ->
      $.ajax
        url: "/admin/items/autocomplete_label/" + encodeURIComponent(req.term) + ".json",
        dataType: "json",
        success: (data) ->
          res(data)
    ,
    autoFocus: true,
    delay: 300,
    minLength: 2