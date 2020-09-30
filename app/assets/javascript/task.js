var elem2_1 = document.getElementById("options");
var elem2_2 = document.getElementById("link_view");
var elem2_3 = document.getElementById("link_hidden");
function toggle_view() {
  elem2_1.style.display = "";
  elem2_2.style.display = "none";
  elem2_3.style.display = "";
}
function toggle_hidden() {
  elem2_1.style.display = "none";
  elem2_2.style.display = "";
  elem2_3.style.display = "none";
}

const today = new Date(new Date().setHours(0, 0, 0, 0))
const a_month_ago = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate())

// 選択できない日付データ（自由に変更していただいてOKです）
const disable_dates = ['2019-12-10', '2019-12-20', '2019-12-30', '2020-01-10', '2020-1-20', '2020-01-30']

// カレンダーの日本語化
flatpickr.localize(flatpickr.l10ns.ja);

// カレンダーの表示
flatpickr('#date-form', {
    // スマートフォンでもカレンダーに「flatpickr」を使用
    disableMobile: true,
    // 1ヶ月前から本日まで選択可
    minDate: a_month_ago,
    maxDate: today,
    // 選択できない日付
    disable: disable_dates
});
