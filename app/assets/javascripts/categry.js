var dualListBoxOption = {
  filterTextClear: 'すべて表示',
  nonSelectedListLabel: '閲覧できないメンバー',
  selectedListLabel: '閲覧できるメンバー',
  preserveSelectionOnMove: '移動',
  filterPlaceHolder: 'フィルター',
  infoText: '{0} 名',
  moveSelectedLabel: '追加',
  moveAllLabel: 'すべて追加',
  removeSelectedLabel: '削除',
  removeAllLabel: 'すべて削除',
  infoTextFiltered: '<span class="label label-warning">絞り込み</span> {1} 名中 {0}',
  infoTextEmpty: '空',
  btnMoveAllText: 'すべて追加',
  btnRemoveAllText: 'すべて削除',
  moveOnSelect: true
};

var dualListBoxOptionsClient = {
  filterTextClear: 'すべて表示',
  nonSelectedListLabel: '閲覧できない顧客',
  selectedListLabel: '閲覧できる顧客',
  preserveSelectionOnMove: '移動',
  filterPlaceHolder: 'フィルター',
  infoText: '{0} 名',
  moveSelectedLabel: '追加',
  moveAllLabel: 'すべて追加',
  removeSelectedLabel: '削除',
  removeAllLabel: 'すべて削除',
  infoTextFiltered: '<span class="label label-warning">絞り込み</span> {1} 名中 {0}',
  infoTextEmpty: '空',
  btnMoveAllText: 'すべて追加',
  btnRemoveAllText: 'すべて削除',
  moveOnSelect: true
};

$('.duallistbox').bootstrapDualListbox(dualListBoxOptions);
$('.duallistbox-client').bootstrapDuallListbox(dualListBoxOptionsClient);
$('.assignMenber').attr('disabled', true);
$(document).on('click','.removeall',function (e) {
  var is_client = $(this).parent().parent().parent().parent().find('#client_id\\[\\]').length;
  if(!is_client) {
    $('.assignMember').attr('disabled', true);
    viewNotMemberAlert();
  }
});

function checkDisabled(){
  if(($('#title').length && $('#title').val() && ($('#url').length && $('#url').val() || $('#name').length && $('#name').val()){
    $('.assignMember').attr('disabled', false);
  }
}

$(document).on('click','.moveall',function (e) {
  var is_client = $(this).parent().parent().parent().parent().find('#client_id\\[\\]').length;
  if(!is_client) {
    checkInMember();
    checkDisabled();
    hideNotMemberAlert();
  }
});

$(document).on('change','#bootstrap-duallistbox-selected-list_user_id\\[\\]',function (e) {
  var option = $('##bootstrap-duallistbox-selected-list_user_id\\[\\] option');
  checkInMember(option);
  if(!option.length) {
    $('.assignMember').attr('disabled', true);
  }
});

$(document).on('change','#bootstrap-duallistbox-nonselected-list_user_id\\[\\]',function (e) {
  checkInMember();
  checkDisabled();
});

$(document).on('input','#title','#url','#name','#message',function (e){
  if(($('#title').length && $('#title').val() && ($('#url').length && $('#url').val() || $('#message').length && ('#message').val())) || $('#name').length && $('#name').val()) {
    var option = $('#bootstrap-duallistbox-selected-list_user_id\\[\\] option');
    if(option.length) {
      $('.assignMember').attr('disabled', false);
    } else {
      $('.assignMember').attr('disabled', true);
    }
  } else {
    $('.assignMember').attr('disabled', true);
  }
});

$('document').on('click', '.assignMember', function (e) {
  $('document').off("input", "#title, #url, #name, #message");
});

checkDisabled();

function checkInMember(option) {
  var option = option?option:$('#bootstrap-duallistbox-selected-list_user_id\\[\\] option');
  var flag = false;
  option.each(function (idx,obj) {
    if(obj.value === "834") {
      flag = true;
    }
  });
  if(flag) {
    hideNotMemberAlert();
  } else {
    viewNotMemberAlert();
  }
}

function viewNotMemberAlert() {
  $('.not-member-alert').show();
}
function hideNotMemberAlert() {
  $('.not-member-alert').hide();
}

checkInMember();