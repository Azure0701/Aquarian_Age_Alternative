$(function() {
  $("#snowfall").snowfall({
    // minSize  : 1,    // 雪の最小サイズ
    // maxSize  : 5,    // 雪の最大サイズ
    // minSpeed : 1,    // 雪の最低速度
    // maxSpeed : 8,    // 雪の最高速度
    // round    : true, // 雪の形を丸くする
    // shadow   : true, // 雪に影をつける
    // flakeColor : "#fff", // 雪の色を指定
    round:true,
    shadow:false,
    minSize:2,
    maxSize:12,
    flakeCount:55,
    minspeed:1,
    maxSpeed:3
  });
});
