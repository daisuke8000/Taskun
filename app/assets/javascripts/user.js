$(document).on('keyup', '#filter', function(e){
  e.preventDefault();
  var input = $.trim($(this).val());
  $.ajax({
    url: '/users/search',
    type: 'GET',
    data: ('keyword=' + input),
    processData: false,
    contentType: false,
    dataType: 'json'
  })
  .done(function(data){
    $('select.categories-new_multiple').remove();
    $(data).each(function(index, users){
      console.log(data);
      $('#result').append(
        `<select>`
      )
    });
  })
});