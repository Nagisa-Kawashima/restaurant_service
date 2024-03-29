## <アプリ名　restaurant_service>
[PFサイトはこちら](https://resutaurant-service.com)
***

## サイト概要
### サイトテーマ
レストランで働いているサービス人のためのコミュニティサイト


### テーマを選んだ理由
私は前職は飲食業でフレンチやイタリアンのレストランのサービス人（給仕人）として働いていました。
<br>テーマを選んだきっかけとして、現状、飲食業界はコロナの影響で、全体的に追い込まれており、専門学校は存在していますが飲食業界で働きたいという気持ちを持つ若者も減ってきていると感じました.
<br>なぜ、そう感じたのかというと自身が当時働いていた時は、上層部しか存在しておらず、一番の働き手の若年層が存在していなかったからです。
<br>そのような現状から、10代、20代の若者に飲食業界の魅力を伝え、さらにモチベーション維持のために頑張ってほしいという思いからこのアプリを作成致しました。
<br>コミュニティサイトを選んだのは、同業種の人間と繋がることで、勉強しているところや、働く上での悩みや楽しさを共有することが出来、それがモチベーションに繋がると考えたからです。
自身が当時を振り返るともっと同年代の人と繋がり、コミュニケーションを取るべきであったと感じています。
<br>少しでも飲食業界で働いている方々の助けになるものであれば幸いです！
### ターゲットユーザ
飲食業界で給仕人として働いている10代～50代の男女
(飲食業界で働いていない人にも魅力を伝える必要があるため、現時点でターゲットとして視野に入れている)

### 主な利用シーン
- 勉強した記録を残したい時、それを共有したい時
- 勉強のモチベーションを上げたい時
- レストランに行った記録を思い出として、また、共有したい時
- 日々の悩みを共有したい時

***

## 設計書
- [ER図](https://drive.google.com/file/d/1qhBcYBbg2VL5HToqKgyhxraMGHBZAb-Z/view?usp=sharing)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1V5CA8W0AORzSo3vp-LQErMCusKKnTp7s2P3JMIWkdi0/edit?usp=sharing)
- [アプリケーション詳細設計書](https://docs.google.com/spreadsheets/d/1lB4eQnKwceJ4Eyl6pNv6qHHu96OO47HCjrspAxYiFkk/edit?usp=sharing)
- [実装機能リスト](https://docs.google.com/spreadsheets/d/1xUfJlv5FiXKI81pIgQG2H8ZrEnq5qfRgFONGGhhbNLE/edit?usp=sharing)
- [ワイヤーフレーム](https://drive.google.com/file/d/1Izt9mRuj5k1zyguUKFRsKPVthulXuJKc/view?usp=share_link)
- [テスト仕様書](https://docs.google.com/spreadsheets/d/1hFVo70ClMzJ48r6kgk-wjqGr1gm9LQGS/edit?usp=sharing&ouid=105482165630883427988&rtpof=true&sd=true)
- [WBSスケジュール](https://docs.google.com/spreadsheets/d/1yOSA5QnGJMHSqYWwC38_M738kOg0XA6DaZMHgmQugAc/edit?usp=sharing)
- [AWS環境構築練習](https://drive.google.com/file/d/1xCc3psX-C1FSVqBXS41pCM3cMEFmMyv0/view?usp=share_link)

***

## 実装した機能
- ユーザー認証(devise)
- いいね機能の非同期通信(Ajax)
- フォロー機能の非同期通信(Ajax)
- 画像アップロード機能(Refile)
- コメント機能
- 通知機能
- 管理者機能
- チャット機能
- お問い合わせ機能
- 検索機能
- ハッシュタグ機能
- 退会機能
- 複数画像投稿機能
- 下書き機能
- 投稿画像プレビュー機能
***
## 開発環境
- OS：Amazon Linux2
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

***
## 使用素材
- 画像素材[O-DAN](https://o-dan.net/ja/), [photoAC](https://www.photo-ac.com/)
- ロゴ素材[Canva](https://www.canva.com/)
- スライド用画像[unDraw](https://undraw.co/illustrations)

***
## 利用ガイド
お試しでまずはゲストユーザとしてログイン可能です。
10分後にセッションが消えるため登録しているユーザーとのチャットは出来ませんが、<br>
自由に画像の投稿や他のユーザーのフォロー、投稿にいいね、投稿の閲覧、管理者宛てに問い合わせることが出来ます。
管理者として管理者画面を閲覧する際は以下の情報でログインください。<br>
メール/admin@admin.com
パスワード/service
