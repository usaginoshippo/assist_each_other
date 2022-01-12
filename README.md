# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| assists1           | string |             |
| assists2           | string |             |
| frequency          | text   |             |

### Association

- has_many :schedules
- has_one  :group

## groups テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- has_many :users
- has_many :schedules

## schedules テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| start_time | string     | null: false                    |
| content    | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :group
- belongs_to :user
- has_one :need_assist

## need_assists テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| schedule | references | null: false, foreign_key: true |

### Association

- belongs_to :schedule