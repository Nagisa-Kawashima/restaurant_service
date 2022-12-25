Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  # 顧客用の新規登録とログイン
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用のログイン
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # ゲストユーザ　ログイン
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end



  # ユーザ側のルーティング

  scope module: :public do
    # top ページとaboutページ
    root to:"homes#top"
    get "about" => "homes#about"
    get "confirm" => "homes#confirm"
    get "news" => "homes#news"
    resources :users, only: [:show,:index, :edit, :update] do
      # フォロー機能
      resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
      # チャット一覧ページ用
      get "chat_rooms"
      #一人のユーザーに紐づく下書き機能
      get "draft_index" => "posts#draft_index"
      member do
      get :likes
      end
    end

    # ユーザの退会確認ページ
    get "user/unsubscribe" => "users#unsubscribe"
    #ユーザ退会処理
    patch "user/withdraw" => "users#withdraw"

    # 投稿機能
    resources :posts do
      #コメント機能
      resources :post_comments, only: [:create, :destroy]
      #いいね機能
      resource :likes, only: [:create, :destroy]
    end

    #キーワード検索
    get 'search' => 'searches#search'
    # タグ検索結果ページ
    get "post/tag/:name" => "posts#tag"
    # チャット機能
    resources :chats, only: [:create, :show, :destroy]
     #通知機能
    resources :notifications, only: [:index, :destroy]
    #お問い合わせ機能
    resources :contacts, only: [:new, :create]

  end


  # 管理者側のルーティング

  namespace :admin do
    # ユーザーの管理画面
    resources :users, except: [:new, :create]do
      # 一人のユーザーに紐づく投稿
      resources :posts, only: [:index, :show, :destroy]
      # 一人のユーザーに紐づくコメント
      resources :post_comments, only: [:index, :destroy]
      #一人のユーザーに紐づくフォローページ
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
    end
    # タグ作成編集削除機能
    resources :tags, except:[:show, :index]
  end



end
