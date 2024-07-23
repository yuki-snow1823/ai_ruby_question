# frozen_string_literal: true

class ArticlesController < ApplicationController
  # - クエリパラメータ `query` を使用して、タイトルまたは内容に指定されたキーワードが含まれる記事を検索する。
  # - クエリパラメータ `page` と `per_page` を使用してページネーションを実装する。`page` はデフォルトで `1`、`per_page` はデフォルトで `10` とする。

  MAX_LENGTH = 50

  def index
    query = params[:query]
    page = params[:page] || DEFAULT_PAGE
    per_page = params[:per_page] || DEFAULT_PER_PAGE

    return render json: { error: 'Query is too long' }, status: :bad_request if query.present? && query.length > MAX_LENGTH

    if query.present?
      Article.search(query)
    else
      Article.all
    end.page(page).per(per_page)

    articles = Article.search(params[:query]).page(params[:page]).per(10)
    render json: { articles:, total_pages: articles.total_pages, current_page: articles.current_page }
  end
end
