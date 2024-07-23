class ArticlesController < ApplicationController
  # - クエリパラメータ `query` を使用して、タイトルまたは内容に指定されたキーワードが含まれる記事を検索する。
  # - クエリパラメータ `page` と `per_page` を使用してページネーションを実装する。`page` はデフォルトで `1`、`per_page` はデフォルトで `10` とする。

  MAX_LENGTH = 50

  def index
    return if params[:query].length > MAX_LENGTH

    articles = Article.search(params[:query]).page(params[:page]).per(10)
    render json: { articles:, total_pages: articles.total_pages, current_page: articles.current_page }
  end
end
