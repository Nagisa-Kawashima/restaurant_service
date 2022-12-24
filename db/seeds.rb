# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  Admin.create!(
    email: ENV['SECRET_EMAIL'],
    password: ENV['SECRET_KEY'],
  )


  # #ユーザの作成
  users = User.create!(
    [
      { email: "test@test1.com",
        name: "Oliver",
        password: "password",
        profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"),
        filename: "sample-user1.jpg"),
        country_code: "US",
        introduction: "はじめまして！日本料理が好きです。日本酒に詳しい方教えてください。よろしくお願いします。"},

      { email: "test@test2.com",
        name: "田中",
        password: "password",
        profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"),
        filename: "sample-user2.jpg"),
        country_code: "JP",
        introduction: "はじめまして！サービス技術の試験に向けて現在練習をしているサービスマンです。よろしくお願いいたします！" },

      { email: "test@test3.com",
        name: "Noah",
        password: "password",
        profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"),
        filename: "sample-user3.jpg"),
        country_code: "CL",
        introduction: "チリワインは美味しいのでいつも飲んでます！よろしくお願い致します。"},
      { email: "test@test4.com",
        name: "Ava",
        password: "password",
        profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"),
        filename: "sample-user4.jpg"),
        country_code: "AU",
        introduction: "オーストラリアのビストロで最近働いているの。好きなものはラム肉のステーキよ。よろしくお願いします。"},
      { email: "test@test5.com",
        name: "Albert",
        password: "password",
        profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"),
        filename: "sample-user5.jpg"),
        country_code: "DE",
        introduction: "初めまして。甘口ワインが好きだといいたいところだけど、実はビールが好きです。Hellesが一番好きだよ！"},
      { email: "test@test6.com",
        name: "Harvey",
        password: "password",
        profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"),
        filename: "sample-user6.jpg"),
        country_code: "GU",
        introduction: "好きな料理はアメリカ料理です。ラウンジバーで働いています。フローズンカクテルを作るのが得意です。"},
      { email: "test@test7.com",
        name: "Madison",
        password: "password",
        profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"),
        filename: "sample-user7.jpg"),
        country_code: "FR",
        introduction: "趣味は世界遺産巡りです。登録したばかりですが、よろしくお願いします！"}
    ]
  )

  posts_attributes = [
      {
        title: "今日のワイン",
        explaination: "今日はSanford Wineryのピノノワールを飲んでみたよ。\r\n\r\nサンタバーバラのピノのパイオニアとも言える、実にエレガントな味わいだったよ！\r\n\r\n#SanfordWinery#Pinotnoir#カリフォルニアワイン#おしゃれ",
        user_id: users[0].id,
        is_draft: 1
      },

      {
        title: "今日のデクパージュ練習",
        explaination: "今日はオレンジのデクパージュを練習したよ。\r\n\r\nもっと上手く素早く出来るようになりたいな！練習時間もっと取らなきゃ！\r\n\r\n#フルーツデクパージュ#サービス技術#勉強",
        user_id: users[1].id,
        is_draft: 1,
      },
      {
        title: "高級フレンチで堪能",
        explaination: "ずっと行ってみたかった日本のフレンチレストランに行ったよ。\r\n\r\nチーズの種類が沢山あって料理もすごく繊細で美味しかった！\r\n\r\n#東京フレンチ#gastronomy#チーズ",
        user_id: users[2].id,
        is_draft: 1
      },



      {
        title: "ソムリエナイフ欲しい",
        explaination: "ソムリエナイフ壊れたから新しいものを買おうと思ってるんだ。\r\n\r\n候補はエリック・ボーマール氏のモデルのソムリエナイフだよ！！",
        user_id: users[0].id,
        is_draft: 0
      },
      # ---------------------------------------------------------------
      {
        title: "休憩中のご飯",
        explaination: "今日はシーフードにDormilonaのChenin Blancを合わせてみたわ。\r\n\r\nこないだお客様から貰ったの。\r\n\r\nおやつは勿論ミートパイ！！\r\n\r\n#AustralieSwanValley#CheninBlanc#BourkeStreetBakery",
        user_id: users[3].id,
        is_draft: 1
      },
      {
        title: "今日のビール",
        explaination: "私の好きなビールの一つです。いつかお店に世界のビールを並べてみたいですね。\r\n\r\nそして私の大好きな朝ごはんを載せます。\r\n\r\n#ErdingerWeibier#GermanBeer#GermanPretzels",
        user_id: users[4].id,
        is_draft: 1
      },
      {
        title: "とっても嬉しい",
        explaination: "お客さんがスタッフがカクテル作ってる時の写真をSNSに挙げてくれてたんだ。\r\n\r\n(勿論この写真は許可貰ってる！)私も頑張るぞ！\r\n\r\n#cocktail#bar#preparingCocktail",
        user_id: users[5].id,
        is_draft: 1
      },
      {
        title: "今日の散歩",
        explaination: "今日はお城巡りをしてみたわ。\r\n\r\n近くにワイナリーがあったから今度寄ってみる予定です。\r\n\r\n#castle#bar#France#Winery",
        user_id: users[6].id,
        is_draft: 1
      },
      # --------------------------------------------------------------

      {
        title: "ワイナリー見学",
        explaination: "ミネソタ州の蒸留所を訪ねたよ。\r\n\r\n設備がしっかりとしていてよかったよ！今度このワインを仕入れてみようかと思ってるんだ。\r\n\r\n#ChankaskaCreekRanch#Winery",
        user_id: users[0].id,
        is_draft: 1
      },
      {
        title: "いつかの思い出",
        explaination: "２年前にスイスのリームワイナリーに行った時の写真だよ。\r\n\r\n何もかも新鮮でマダムがとにかく優しい人だった！\r\n\r\n#weinkellereiriem#bar#Switzerland#Winery",
        user_id: users[0].id,
        is_draft: 1
      },
      {
        title: "celebration!!",
        explaination: "今日は私の働いているレストランでレセプションパーティーがあったんだ。\r\n\r\n見ての通りの大量のchampagneさ！\r\n\r\n準備が大変だったけど、お客さんがとても喜んでくれて、苦労が報われたよ！\r\n\r\n#champagne#celebration",
        user_id: users[0].id,
        is_draft: 1
      },
      {
        title: "勉強",
        explaination: "最近ドイツ語を勉強したいと思っているんだ。\r\n\r\nそしていつかドイツでビールの飲み友達を作るんだ！\r\n\r\n#German#language#Beer",
        user_id: users[0].id,
        is_draft: 1
      },
      # -------------------------------------------------------------------

      {
        title: "家をリメイクしてみた",
        explaination: "休日はゆっくり休みたいから、快適に過ごしたいと思って、模様替えしてみた。",
        user_id: users[0].id,
        is_draft: 0
      },
      {
        title: "クリスマス",
        explaination: "他の国ではクリスマスにも働いているところがあるらしいね。\r\n\r\n皆お疲れ様！！良い祝日を！",
        user_id: users[0].id,
        is_draft: 0
      },
      {
        title: "デクパージュの練習",
        explaination: "このまま食べたいけど、しっかり練習するよ！\r\n\r\n#DekPage",
        user_id: users[0].id,
        is_draft: 0
      },
      {
        title: "筋肉痛",
        explaination: "皆わかると思うんだけど、腰と肩の筋肉痛がひどいんだよね。\r\n\r\n皆は日ごろどうやってケアしているのかな。教えてほしい。\r\n\r\n#musclepain#筋肉痛",
        user_id: users[0].id,
        is_draft: 0
      },
      {
        title: "相談",
        explaination: "今年はソムリエコンクールに出たいと思っているんだけど、誰か出る予定の人いないかな？\r\n\r\n#Sommelier",
        user_id: users[0].id,
        is_draft: 0
      },
      {
        title: "チーズの熟成庫",
        explaination: "ラクレットチーズの熟成庫を見学したよ！\r\n\r\n皆のお店はチーズの管理で工夫してることある？\r\n\r\n#Cheese",
        user_id: users[0].id,
        is_draft: 0
      }

    ]

  ranges = [
      [*1..1],
      [*2..2],
      [*3..3],
      [*4..4],
      [*5..7],
      [*8..9],
      [*10..10],
      [*11..11],
      # -------------------------#[画像のID、差分の投稿の枚数]　これだと各投稿は一人1枚ずつ
      [*12..13],

      [*14..14],
      [*15..15],
      [*16..16],
      # -----------------------------
      # -------------------------#[画像のID、差分の投稿の枚数]　これだと各投稿は一人1枚ずつ
      [*17..17],
      [*18..18],
      [*19..19],
      [],
      [],
      []
    ]

  posts_attributes.each_with_index do |post_attributes, index|
    post = Post.create!(post_attributes)
    if ranges[index].size != 0
      file_names = ranges[index].map{|i| "sample-post#{i}.jpg"}
      file_names.each{|file_name| post.images.attach(io: File.open("#{Rails.root}/db/fixtures/#{file_name}"), filename: file_name); sleep(2)}
    end
  end


    # タグ作成
  Tag.create!([
    { name: "RIEDEL" },
    { name: "ブルゴーニュ" },
    { name: "イタリアン" },
    { name: "フレンチ" },
    { name: "ソムリエナイフ" },
    { name: "サービス技能" },
    { name: "デクパージュ" }
  ])



  #   # フォローフォロワーの作成
  Relationship.create!(
    [
      { follower_id: 1,
        followed_id: 2
      },
      { follower_id: 2,
        followed_id: 1
      },
      { follower_id: 2,
        followed_id: 3
      },
      { follower_id: 3,
        followed_id: 1
      },
      { follower_id: 1,
        followed_id: 4
      },
      { follower_id: 1,
        followed_id: 5
      },
      { follower_id: 1,
        followed_id: 6
      },
      { follower_id: 1,
        followed_id: 7
      },
      { follower_id: 1,
        followed_id: 3
      },
      { follower_id: 4,
        followed_id: 5
      },
      { follower_id: 5,
        followed_id: 2
      },
      { follower_id: 6,
        followed_id: 3
      },


      { follower_id: 4,
        followed_id: 1
      },
      { follower_id: 5,
        followed_id: 1
      },
      { follower_id: 6,
        followed_id: 1
      },
      { follower_id: 7,
        followed_id: 1
      }
    ]
  )

  #   # お気に入りの作成
  Like.create!(
    [
      { user_id: 2,
        post_id: 1
      },
      { user_id: 3,
        post_id: 1
      },
      { user_id: 2,
        post_id: 3
      },
      { user_id: 1,
        post_id: 3
      },
      { user_id: 1,
        post_id: 2
      },
      { user_id: 1,
        post_id: 4
      },
      { user_id: 1,
        post_id: 5
      },
      { user_id: 1,
        post_id: 6
      },
      { user_id: 1,
        post_id: 7
      },
      { user_id: 4,
        post_id: 5
      },
      { user_id: 5,
        post_id: 6
      },
      { user_id: 6,
        post_id: 7
      },
      { user_id: 4,
        post_id: 9
      },
      { user_id: 4,
        post_id: 10
      },
      { user_id: 4,
        post_id: 10
      },
      { user_id: 3,
        post_id: 12
      }
    ]
  )
  #   # コメントの作成
  PostComment.create!(
    [
      { user_id: 1,
        post_id: 3,
        comment: "いいですね！私はモンドールが好きなんですよ！冬にオーブンで焼いたフォンデュは最高ですよ！",
      },
      { user_id: 2,
        post_id: 1,
        comment: "いいですね！お勧めのカリフォルニアワインありませんか？",
      },
      { user_id: 3,
        post_id: 1,
        comment: "こんにちは！おすすめのシャルドネあったら教えてください！",
      },
      { user_id: 1,
        post_id: 2,
        comment: "日々の努力素敵です！いつかきっと報われる時が来ますよ！楽しみですね！",
      },
      { user_id: 1,
        post_id: 5,
        comment: "Harbour Cityに行きたくなりました！牡蠣のマリアージュを堪能したいです！",
      },
      { user_id: 1,
        post_id: 6,
        comment: "ドイツのビールはあまり飲んだことがないので、教えてほしいです！",
      },
      { user_id: 1,
        post_id: 7,
        comment: "ちなみに私の好きなフローズンカクテルはBloodhoundです！いつか作ってください！",
      },
      { user_id: 1,
        post_id: 7,
        comment: "アメリカに来る機会ありますか？",
      },
      # ----------------------------------------------------------
      { user_id: 6,
        post_id: 10,
        comment: "樽がインパクトありますね！スイスはまだ行ったことなかったです～",
      },
      { user_id: 5,
        post_id: 11,
        comment: "凄い量のchampagneですね！さぞ賑やかだったでしょうね！",
      }
    ]
  )

# -----------------------------------------------------------------------------------------
  # ルーム作成
  Room.create!(

    [
      {

      },
      # ---------------------
      {

      },
      {

      },
      # -------------------------
      {

      },
      {

      },
      # -------------------------------
      {

      },

    ]

  )

  UserRoom.create!(
    [
      { user_id: 1,
        room_id: 1
      },
      { user_id: 2,
        room_id: 1
      },
      # ---------------------
      { user_id: 1,
        room_id: 2
      },
      { user_id: 3,
        room_id: 2
      },
      # -------------------------
      { user_id: 1,
        room_id: 3
      },
      { user_id: 4,
        room_id: 3
      },
      # -------------------------------
      { user_id: 1,
        room_id: 4
      },
      { user_id: 5,
        room_id: 4
      },
      # ---------------------------------
      { user_id: 1,
        room_id: 5
      },
      { user_id: 6,
        room_id: 5
        # ----------------------------
      },
      { user_id: 1,
        room_id: 6
      },
      { user_id: 7,
        room_id: 6
      }
    ]
  )


    # ユーザ1と2のチャット
  Chat.create!(
    [
      { user_id: 2,
        room_id: 1,
        message: "Oliverさんはじめまして！フォローありがとうございます！よろしくお願いします！"
      },
      { user_id: 1,
        room_id: 1,
        message: "田中さんはじめまして！！よろしくお願いします！"
      },
      { user_id: 1,
        room_id: 1,
        message: "田中さんはいつもどんな勉強をされてますか？\r\n私は最近イタリアのお菓子にはまってて、作る練習してます！"
      },
      { user_id: 1,
        room_id: 1,
        message: "最近はカンノーリ作ってみました！"
      },
      { user_id: 2,
        room_id: 1,
        message: "カンノーリですか！\r\n本場のカンノーリは食べたことないです！"
      },
      { user_id: 2,
        room_id: 1,
        message: "レシピ教えてくれませんか？"
      },
      { user_id: 1,
        room_id: 1,
        message: "私でよければ教えますよ！"
      },
      { user_id: 1,
        room_id: 1,
        message: "後でメッセージ送りますね！"
      },
      { user_id: 2,
        room_id: 1,
        message: "ありがとうございます！"
      },
      { user_id: 1,
        room_id: 1,
        message: "いえいえ！\r\nそれでは一度仕事に戻ります！"
      },
      { user_id: 2,
        room_id: 1,
        message: "いってらっしゃい！！"
      }
    ]
  )


  #   #通知
  Notification.create!(
    [
      { visiter_id: 2,
        visited_id: 1,
        post_id: 1,
        action: "like",
        checked: false,
      },
      { visiter_id: 3,
        visited_id: 1,
        post_id: 1,
        post_comment_id: 3,
        action: "comment",
        checked: false,
      },
      { visiter_id: 2,
        visited_id: 1,
        action: "follow",
        checked: false,
      }
    ]
  )
puts "seeds completed!!"
