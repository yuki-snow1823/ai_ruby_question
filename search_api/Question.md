### コーディングテスト: ブログ記事の検索とページネーションAPI（Ruby on Rails）

#### 問題概要
Ruby on Railsを使用して、ブログ記事の検索とページネーション機能を持つAPIを開発してください。ブログ記事は、タイトルと内容を持つ単純なモデルとします。APIは、指定されたキーワードでタイトルまたは内容を検索し、結果をページネーション形式で返します。

#### 要件
1. **検索APIエンドポイント**:
   - `GET /api/v1/articles`
   - クエリパラメータ `query` を使用して、タイトルまたは内容に指定されたキーワードが含まれる記事を検索する。
   - クエリパラメータ `page` と `per_page` を使用してページネーションを実装する。`page` はデフォルトで `1`、`per_page` はデフォルトで `10` とする。

2. **レスポンス形式**:
   - レスポンスはJSON形式で、以下の情報を含む。
     - `articles`: 記事のリスト（各記事はタイトルと内容を含む）。
     - `total_pages`: 総ページ数。
     - `current_page`: 現在のページ番号。

3. **エラーハンドリング**:
   - 不正なクエリパラメータが与えられた場合、適切なエラーメッセージを返す。

### 入力例と期待するアウトプット

#### 入力例
1. **リクエスト**:
GET /api/v1/articles?query=ruby&page=2&per_page=5


2. **期待するレスポンス**:
```json
{
  "articles": [
    {
      "title": "Learning Ruby",
      "content": "This is a comprehensive guide to Ruby programming..."
    },
    {
      "title": "Ruby on Rails Basics",
      "content": "An introductory guide to Rails framework..."
    }
    // ... more articles
  ],
  "total_pages": 3,
  "current_page": 2
}

