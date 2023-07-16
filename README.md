# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

has_many :blogs
has_many :comments, dependent: :destroy

## blogs テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| title        | string |  
| description  | text   |
| movie        | string |  
| published_at | date   |
| user         | references | null: false, foreign_key: true |

### Association

mount_uploader :movie, MovieUploader
belongs_to :user
has_many :comments

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| blog   | references | null: false, foreign_key: true |
| text   | text       |  
### Association

belongs_to :blog 
belongs_to :user
