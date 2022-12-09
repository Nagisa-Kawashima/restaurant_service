// preview.jsを新規投稿ページでしか発火しないようにif文を作成
// DOMContentLoaded イベントは、 HTML の初期文書が完全に読み込まれ解釈された時点で発生
if (document.URL.match(/new/)){
  document.addEventListener('DOMContentLoaded', () => {
    const createImageHTML = (blob) => {
      const imageElement = document.getElementById('new-image');
      const blobImage = document.createElement('img');
      // 要素.setAttribute("データ名",データ);
      blobImage.setAttribute('class', 'new-img');
      blobImage.setAttribute('src', blob);
      // 親要素.appendChild(追加する子要素);
      imageElement.appendChild(blobImage);
    };
    // 投稿フォームのファイル選択ボックスに変化（change）が起こったときに行われる処理
    document.getElementById('post_image').addEventListener('change', (e) => {
      // img要素がない場合は実行されない
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
    // e.target.files[0]で取得したファイルの情報を定数fileに格納し、
    // URL.createObjectURL(file)で取得した情報を文字列に変換し、定数blobに格納
    // blobを引数にcreateImageHTML( )という関数を呼び出すす
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    });
  });
}