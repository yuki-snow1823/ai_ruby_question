# 書籍検索システムの実装（Ruby on Rails）

## 問題概要
あなたは書籍検索システムを実装する必要があります。
このシステムは書籍情報を保存し、カテゴリ、キーワード、出版日を使って書籍を検索するAPIエンドポイントを提供します。

## 要件
1. 書籍（Book）モデルを作成する。
2. 書籍をカテゴリ（Category）で分類する。
3. 書籍のタイトルおよび著者名に基づいてキーワード検索ができる。
4. 書籍の出版日でフィルタリングができる。
5. JSON形式で検索結果を返す。
6. 適切なエラーハンドリングを行う。

## 手順

### ステップ1: プロジェクトのセットアップ
1. 新しいRailsプロジェクトを作成してください。
    ```bash
    rails new book_search_system --api
    cd book_search_system
    ```

2. 必要なgemを追加し、インストールしてください。
    ```ruby
    # Gemfile
    gem 'pg'
    gem 'faker'
    ```

    ```bash
    bundle install
    ```

3. データベースを作成してください。
    ```bash
    rails db:create
    ```

### ステップ2: モデルの作成
1. `Book`モデルを生成してください。
    ```bash
    rails generate model Book title:string author:string published_date:date category:references
    ```

2. `Category`モデルを生成してください。
    ```bash
    rails generate model Category name:string
    ```

3. マイグレーションを実行してデータベースにテーブルを作成してください。
    ```bash
    rails db:migrate
    ```

### ステップ3: サンプルデータの作成
1. `db/seeds.rb`にサンプルデータを追加してください。
    ```ruby
    # db/seeds.rb
    Category.create([{ name: 'Fiction' }, { name: 'Non-fiction' }, { name: 'Science' }, { name: 'History' }])

    10.times do
        Book.create(
            title: Faker::Book.title,
            author: Faker::Book.author,
            published_date: Faker::Date.between(from: '1900-01-01', to: '2023-12-31'),
            category: Category.order('RANDOM()').first
        )
    end
    ```

2. サンプルデータをデータベースに投入してください。
    ```bash
    rails db:seed
    ```

### ステップ4: コントローラーの作成
1. `BooksController`を作成し、検索エンドポイントを実装してください。
    ```bash
    rails generate controller Books
    ```

2. `app/controllers/books_controller.rb`を編集して検索ロジックを追加してください。
    ```ruby
    # app/controllers/books_controller.rb
    class BooksController < ApplicationController
        def index
            books = Book.all

            if params[:category].present?
                books = books.joins(:category).where(categories: { name: params[:category] })
            end

            if params[:keyword].present?
                books = books.where('title LIKE ? OR author LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%")
            end

            if params[:published_date].present?
                books = books.where(published_date: params[:published_date])
            end

            render json: books, include: :category
        rescue => e
            render json: { error: e.message }, status: :unprocessable_entity
        end
    end
    ```

### ステップ5: ルーティングの設定
1. `config/routes.rb`を編集してルーティングを追加してください。
    ```ruby
    # config/routes.rb
    Rails.application.routes.draw do
        resources :books, only: [:index]
    end
    ```

### ステップ6: テスト
1. 実装が完了したら、以下のコマンドでサーバーを起動し、動作を確認してください。
    ```bash
    rails server
    ```

2. ブラウザまたはAPIクライアント（例: Postman）を使用して、以下のエンドポイントにGETリクエストを送信し、検索機能が動作することを確認してください。
    - `http://localhost:3000/books`
    - `http://localhost:3000/books?category=Fiction`
    - `http://localhost:3000/books?keyword=Harry`
    - `http://localhost:3000/books?published_date=2023-01-01`

以上で、書籍検索システムの実装は完了です。適切なエラーハンドリングやレスポンスフォーマットが機能していることを確認してください。

メモ
modelにsearchなんてあったら肥大化するから、メソッドの中で条件分けて、その条件でモデルは返すみたいにするのがいいと思う