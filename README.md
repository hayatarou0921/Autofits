# Autofits

自分の服の中からコーディネートを作成し、服装を自動で決められるアプリです。  
朝のお出かけ前の服装に悩む時間を減らすことができます。

***DEMO:***

![demoAutfits](https://user-images.githubusercontent.com/51501611/61927797-1a7d4400-afb1-11e9-8127-3097543ce8ea.gif)

メールアドレス = 'test@example.com'
パスワード = 'password'
で、テストユーザーとしてログインして頂けます。

### 主な使用技術
- DB
  -PostgresQL
- 画像アップロード機能
  - CarrierWave
  - MiniMagick
- ユーザー管理機能
  -devise
- ページネーション機能
  - kaminari
- 画像のストレージ管理
  - AWS S3
  - fog-aws
- フロント開発
  - slim
  - bootstrap

- Ruby 2.6.3
- Rails 5.2.3
