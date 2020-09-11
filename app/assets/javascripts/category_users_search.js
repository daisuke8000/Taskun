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
    $(data).each(function(index, user){
      console.log(data);
      $('#result').append(
        `<select multiple="multiple" name="user_id[]_helper1" id="bootstrap-duallistbox-nonselected-list_user_id[]"  class="categories-new_multiple column-data">
          <option value=""> ${user.name} </option>
         </select>`
      )
    });
  })
});