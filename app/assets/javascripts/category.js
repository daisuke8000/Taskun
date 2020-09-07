$(document).on('keyup', '#form', function(e){
  e.preventDefault();
  var input = $.trim($(this).val());
  $.ajax({
    url: '/categories/search',
    type: 'GET',
    data: ('keyword=' + input),
    processData: false,
    contentType: false,
    dataType: 'json'
  })
  .done(function(data){
    $('tr.column-data').remove();
    $(data).each(function(index, category){
      console.log(data);
      console.log(category.id);
      $('#result').append(
        `<tr  class="column-data">
          <td>
            <a class="ajax-link" href="/categories/new.${ category.category_name}">${ category.category_name}</a>
          </td>
          <td>
             <a class="btn btn-primary ajax-link tip" href="/categories/${ category.id}/edit">
              <i class="fa fa-fw fa-edit"></i>
            </a>
            <a data-confirm="削除してよいですか <br> <strong>${ category.category_name}</strong>" data-cancel="キャンセル" data-commit="削除" title="削除の確認"  class="btn btn-danger tip" rel="nofollow" data-method="delete"  href="/categories/${ category.id}">
              <i class="fa fa-fw fa-trash"></i>
            </a>
          </td>
        </tr>`
      )
    });
  })
});