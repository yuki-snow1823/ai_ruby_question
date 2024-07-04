問題： あなたは、Ruby on Railsを使用して基本的なメールサービスのバックエンドAPIを開発しています。

以下の要件を満たすAPIエンドポイントを作成してください。
メールを分類するエンドポイント /api/v1/emails/categorize を作成してください。
このエンドポイントは、ユーザーIDを受け取り、そのユーザーのメールを以下のカテゴリに分類して返す必要があります：

受信トレイ（Inbox）
送信済み（Sent）
下書き（Draft）

アーカイブされたメールや削除されたメールは、この分類から除外してください。
レスポンスは JSON 形式で、各カテゴリごとのメールの数と、最新の5件のメールの概要（IDとサブジェクト）を含める必要があります。
以下は、すでに存在するモデルの構造です：

```ruby
class Email < ApplicationRecord
	belongs_to :user

	enum status: { active: 0, archived: 1, deleted: 2 }
	enum category: { inbox: 0, sent: 1, draft: 2 }
end

class User < ApplicationRecord
	has_many :emails
end
```

この要件を満たすコントローラーとそのアクションを実装してください。パフォーマンスと可読性を考慮してください。