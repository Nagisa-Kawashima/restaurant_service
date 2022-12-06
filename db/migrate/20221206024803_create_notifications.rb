class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visiter_id, null: false, foreign_key: true
      t.integer :visited_id, null: false, foreign_key: true
      # reference型を使い、外部キーの制約も付ける
      t.references :post, foreign_key: true
      t.references :comment, foreign_key: true
      t.string :action, null: false
      t.boolean :checked, null: false, default: false
      # 通知を確認したかどうかの初期値は、false（通知未確認）とする
      t.timestamps
    end
  end
end
