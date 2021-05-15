jQuery ->
  subcat = $('#subcategory-select').html()
  $('#category-select').change ->
    cat = jQuery('#category-select').children('option').filter(':selected').text()
    options = $(subcat).filter("optgroup[label='#{cat}']").html()
    if options
      $('#subcategory-select').html(options)
    else
      $('#subcategory-select').empty()
