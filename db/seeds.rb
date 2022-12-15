# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  Admin.create!(email: "admin@test.com", password: "password")
  
  (1..2).each do |n|
    User.create!(email: "test#{n}@testt.com", password: "password", name: "test#{n}", introduction: "test", country_code: "JP", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.png"), filename: "sample-user1.png"),)
    Post.create!(title: "title", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"),filename: "sample-post1.jpg"), explaination:"今日は勉強をしました" , user_id: n, is_draft: 1)
    Tag.create!(name: "タグ名")
    PostTag.create!(tag_id: n, post_id: n)
  end

    # フォローフォロワーの作成
  Relationship.create!(
    [
      { follower_id: 1,
        followed_id: 2
      },
      { follower_id: 2,
        followed_id: 1
      }
    ]
  )

    # お気に入りの作成
  Like.create!(
    [
      { user_id: 2,
        post_id: 1
      }

    ]
  )

    # コメントの作成
  PostComment.create!(
    [
      { user_id: 1,
        post_id: 2,
        comment: "コメント",

      },
      { user_id: 2,
        post_id: 1,
        comment: "コメント",

      }
    ]
  )


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

  Chat.create!(
  [
    { user_id: 2,
      room_id: 1,
      message: "よろしくお願いいたします"
    },
    { user_id: 1,
      room_id: 1,
      message: "よろしくお願いいたします"
    }
  ]
)

Notification.create!(
  [
    { visiter_id: 2,
      visited_id: 1,
      post_id: 1,
      post_comment_id: 1,
      action: "comment",
      checked: false,
    }
  ]
)



end

puts "seeds completed!!"