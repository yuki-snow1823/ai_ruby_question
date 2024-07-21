# ユーザー作成API

問題：
あなたは、新しいWebサービスのバックエンドAPIを開発しています。ユーザー登録機能を実装する必要があり、以下の要件が与えられています。

1. ユーザーモデルには以下のフィールドがあります：
    - username（ユーザー名）
    - email（メールアドレス）
    - password（パスワード）
    - birth_date（生年月日）
2. 各フィールドには以下のバリデーションルールを適用してください：
    - username:
        - 3文字以上20文字以下
        - 半角英数字とアンダースコアのみ使用可能
        - 先頭は必ず英字から始まる
    - email:
        - 有効なメールアドレス形式
        - 大学のドメイン（.edu）のみ許可
    - password:
        - 8文字以上30文字以下
        - 少なくとも1つの大文字、1つの小文字、1つの数字、1つの特殊文字（!@#$%^&*）を含む
    - birth_date:
        - 有効な日付形式（YYYY-MM-DD）
        - ユーザーは18歳以上でなければならない
3. ユーザー作成のためのAPIエンドポイント（POST /api/v1/users）を実装してください。
4. バリデーションエラーが発生した場合、適切なエラーメッセージを返してください。
5. ユーザーが正常に作成された場合、ステータスコード201とともにユーザー情報（パスワードを除く）を返してください。

これらの要件を満たすように、必要なモデル、コントローラー、およびルーティングを実装してください。