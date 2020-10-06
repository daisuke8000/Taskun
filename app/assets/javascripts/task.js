
$(document).on('keyup', '#search', function(e){
  e.preventDefault();
  var input = $.trim($(this).val());
  console.log(input)
  $.ajax({
    url: '/tasks/search',
    type: 'GET',
    data: ('keyword=' + input),
    processData: false,
    contentType: false,
    dataType: 'json'
  })
  .done(function(data){
    $('tr.tasks_column-data').remove();
    $(data).each(function(index, task){
      console.log(task)
    $('#result').append(
        `<tr class="tasks_column-data">
          <td>
            <div class="td-border-div mytask-priority-5">
              <a href="/tasks/${task.task_name}" %>${task.task_name}</a>
            </div>
          </td>
          <td>
            <img src="#" class="plofile-icon ml-1 mr-1">
            <span class="plofile-name-cover">sample name</span>
          </td>
          <td>
            <div class="sub-project-name">
              <p>${ task.created_at.slice(0,10) }に開始</p>
            </div>
          </td>
          <td class="text-nowrap">
            <a class="btn btn-primary ajax-link tip" href="/tasks/${task.id}/edit">
              <i class="fa fa-fw fa-edit"></i>
            </a>
            <a data-confirm="削除してよいですか <br> <strong>${ task.task_name }</strong>" data-cancel="キャンセル" data-commit="削除" title="削除の確認"  class="btn btn-danger tip" rel="nofollow" data-method="delete"  href="/tasks/${ task.task_users_id}">
              <i class="fa fa-fw fa-trash"></i>
            </a>
            <a href="#" class="btn btn-primary ajax-link tip-right" data-title="記録">記録</a>
          </td>
        </tr>`
      )
    });
  })
});

$(document).on("click", "#other-form", function(e){
  $(".hidden-btn").on("click")
    $(".hidden-form").toggle();
});
