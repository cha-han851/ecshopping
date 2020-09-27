


$(function() {
  // 追加するDOMノード（HTMLデータ）を生成する関数
  function createHTML(gallery) {
    let html = `<div class="gallery" id="gallery">
                  ${gallery.caption}
                </div>`
    return html;
  }
  // メモ投稿(POSTメソッド)の処理
  $("#submit").on("submit", function(e) {
    e.preventDefault();  // デフォルトのイベント(HTMLデータ送信など)を無効にする
    let image = $("#image_upload").val(); 
    let caption = $("#gallery_caption").val();  // textareaの入力値を取得
    let url = $(this).attr("action");  // action属性のurlを抽出
    $.ajax({
      url: url,  // リクエストを送信するURLを指定
      type: "POST",  // HTTPメソッドを指定（デフォルトはGET）
      data: {  // 送信するデータをハッシュ形式で指定
        gallery: {caption: caption, image: image}
      },
      dataType: "json"  // レスポンスデータをjson形式と指定する
    })
    .done(function(data) {
      let html = createHTML(data);  // 受信したデータ(data)を元に追加するURLを生成(createHTML関数は冒頭で定義)
      $(".gallery").append(html);  // 生成したHTMLをappendメソッドでドキュメントに追加
      $("#gallery_caption").val("");  // textareaを空にする
    })
    .fail(function() {
      alert("error!");  // 通信に失敗した場合はアラートを表示
    })
    .always(function() {
      $("#submit").prop("disabled", false);  // submitボタンのdisableを解除
      $("#subnit").removeAttr("data-disable-with");  // submitボタンのdisableを解除(Rails5.0以降はこちらも必要)
    });
  });
});
