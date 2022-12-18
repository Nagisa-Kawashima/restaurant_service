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


  #ユーザの作成
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
        introduction: "チリワインは美味しいのでいつも飲んでます！よろしくお願い致します。"}
    ]
  )

    #投稿の作成
  Post.create!(
    [
      # ユーザ1の投稿
      { title: "今日のワイン",
        image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"),
        filename: "sample-post1.jpg"),
        explaination: "今日はSanford Wineryのピノノワールを飲んでみたよ。\r\n\r\nサンタバーバラのピノのパイオニアとも言える、実にエレガントな味わいだったよ！\r\n\r\n#SanfordWinery#Pinotnoir#カリフォルニアワイン#おしゃれ",
        user_id: users[0].id,
        is_draft: 1,
      },

      # ユーザ2の投稿
      { title: "今日のデクパージュ練習",
        image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"),
        filename: "sample-post2.jpg"),
        explaination: "今日はオレンジのデクパージュを練習したよ。\r\n\r\nもっと上手く素早く出来るようになりたいな！練習時間もっと取らなきゃ！\r\n\r\n#フルーツデクパージュ#サービス技術#勉強",
        user_id: users[1].id,
        is_draft: 1,
      },

      # ユーザ3の投稿
      { title: "高級フレンチで堪能",
        image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"),
        filename: "sample-post3.jpg"),
        explaination: "ずっと行ってみたかった日本のフレンチレストランに行ったよ。\r\n\r\nチーズの種類が沢山あって料理もすごく繊細で美味しかった！\r\n\r\n#東京フレンチ#gastronomy#チーズ",
        user_id: users[2].id,
        is_draft: 1,
      },

      # ユーザ1の非公開投稿
      { title: "ソムリエナイフ欲しい",
        image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.png"),
        filename: "sample-post4.png"),
        explaination: "ソムリエナイフ壊れたから新しいものを買おうと思ってるんだ。\r\n\r\n候補はエリック・ボーマール氏のモデルのソムリエナイフだよ！！",
        user_id: users[0].id,
        is_draft: 0
      }
    ]
  )



    #タグ作成
  Tag.create!([
    { name: "RIEDEL" },
    { name: "ブルゴーニュ" },
    { name: "イタリアン" },
    { name: "フレンチ" },
    { name: "ソムリエ" },
    { name: "ソムリエナイフ" },
    { name: "サービス技能" },
    { name: "デクパージュ" }
  ])



    # フォローフォロワーの作成
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
      }
    ]
  )

    # お気に入りの作成
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
      }
    ]
  )
    # コメントの作成
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
      }
    ]
  )


  # ユーザ1と2のチャットルーム作成
  Room.create!()

  UserRoom.create!(
    [
      { user_id: 1,
        room_id: 1
      },
      { user_id: 2,
        room_id: 1
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
      }
    ]
  )


    #通知
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