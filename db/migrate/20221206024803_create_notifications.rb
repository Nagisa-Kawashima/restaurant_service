class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visiter_id, null: false
      t.integer :visited_id, null: false
      # reference型を使い、外部キーの制約も付ける
      # t.references :post, foreign_key: true
      # t.references :comment, foreign_key: { to_table: :post_comments }
      t.integer :post_id
      t.integer :post_comment_id
      t.string :action, null: false, default: ''
      t.boolean :checked, null: false, default: false
      # 通知を確認したかどうかの初期値は、false（通知未確認）とする
      t.timestamps
    end
    add_index :notifications, :visiter_id
    add_index :notifications, :visited_id
    add_index :notifications, :post_id
    add_index :notifications, :post_comment_id
  end
end


