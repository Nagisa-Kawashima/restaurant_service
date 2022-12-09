class Notification < ApplicationRecord
  #スコープ(新着順に並べる)default_scopeでデフォルトの並び順を作成日時の降順で指定する
  default_scope -> { order(created_at: :desc) }
  # optional: trueでnilを許可する
  belongs_to :visiter, class_name: "User", foreign_key: :visiter_id, optional: true
  belongs_to :visited, class_name: "User", foreign_key: :visited_id, optional: true
  belongs_to :post, optional: true
  belongs_to :post_comment, optional: true
  validates :visiter_id, presence: true
  validates :visited_id, presence: true
  # 定数ACTION_VALUESを定義する、属性は配列で記述する
  ACTION_VALUES = ["like", "follow", "comment"]
  # actionカラムに入れられる値を制限する,nオプションと一緒に使用
  validates :action,  presence: true, inclusion: { in:ACTION_VALUES }
  # trueとfalseしか入れられないようにする,nオプションと一緒に使用
  validates :checked, inclusion: {in: [true, false] }
end
