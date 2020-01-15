$(document).ready(function(){

  let subject_points; //各教科の点数
  let subject_quantity; //全教科の科目数
  let ave; //全教科の平均点
  let rank; //ランク
  let result; //合格・不合格

  function score_indicate(){
    // このような記述をすることで、subject_pointsという変数の中に
    // [国語の点数,英語の点数,数学の点数,理科の点数,社会の点数]という配列を作成できる。
    subject_points = [Number($('#national_language').val()),
                          Number($('#english').val()),
                          Number($('#mathematics').val()),
                          Number($('#science').val()),
                          Number($('#society').val())
                          ];
    // さらにこのような記述をすることで、「合計点：」となっている右の部分に合計点が出力される
/*
    let sum = subject_points[0];
    sum = sum + subject_points[1];
    sum = sum + subject_points[2];
    sum = sum + subject_points[3];
    sum = sum + subject_points[4];
*/
//追加課題１
    let sum =subject_points.reduce(function(a,b){ return a + b; });
    $("#sum_indicate").text(sum);

    // ここに、上記を参考にして平均点を出力する処理を書き込む
    subject_quantity = $(".subject").length;
    ave = sum / subject_quantity;
    $("#average_indicate").text(ave)
  };

  function get_achievement(){
    // ここに、ランクの値の文字列（平均点が80点以上なら"A"、60点以上なら"B"、40点以上なら"C"、それ以下なら"D"）を出力する処理を書き込む

    if (ave >= 80) {
      rank = "A";
    }else if (ave >= 60) {
      rank = "B";
    }else if (ave >= 40) {
      rank = "C";
    }else if (ave < 40) {
      rank = "D";
    }
    return rank;
  }

  function get_pass_or_failure(){
    // ここに、全ての教科が60点以上なら"合格"の文字列、一つでも60点未満の教科があったら"不合格"の文字列を出す処理を書き込む
    result = "";
    for (var i = 0; i < subject_quantity; i++) {
      if(subject_points[i] < 60){
        result = "不合格";
      }
    }
    if (result != "不合格") {
      result = "合格";
    }
    return result;
  }

  function judgement(){
    // ここに、「最終ジャッジ」のボタンを押したら「あなたの成績はAです。合格です」といった内容を出力する処理を書き込む
    // 下記の記述をすることで、「最終ジャッジ」のボタンを押すと「あなたの成績は（ここに「ランク」の値を入れる）です。（ここに「判定」の値を入れる）です」という文字の入った水色のフキダシが出力される処理が実装される。
//追加課題２
    $('#alert-indicate').remove();
    $('#declaration').append(`<label id="alert-indicate" class="alert alert-info">あなたの成績は${rank}です。${result}です</label>`);
  };

  $('#national_language, #english, #mathematics, #science, #society').change(function() {
    score_indicate();
  });

  $('#btn-evaluation').click(function() {
    $('#evaluation').text(get_achievement());
  });

  $('#btn-judge').click(function() {
    $('#judge').text(get_pass_or_failure());
  });

  $('#btn-declaration').click(function() {
    judgement();
  });
});
// ここに書かれているjsの記述はあくまでヒントとして用意された雛形なので、書かれている記述に従わずに実装したいという場合は、自分の好きに実装して構わない。課題要件を満たし、コードの品質が一定の水準にあると判定されればどのような実装でも合格になる。
// 例ではJavaScriptとJqueryの両方の記述を使用しているが、どちらかに統一しても構わない
