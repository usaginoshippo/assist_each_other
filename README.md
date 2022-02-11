# テーブル設計

## users テーブル

| Column             | Type    | Options                     |
| ------------------ | ------- | --------------------------- |
| name               | string  | null: false                 |
| email              | string  | null: false                 |
| encrypted_password | string  | null: false                 |
| assists            | boolean | null: false, default: false |
| assists1           | string  |                             |
| assists2           | string  |                             |
| memo               | text    |                             |

### Association

- has_many :schedules
- has_many :need_assists
- has_many :group_users
- has_many :groups, through: :group_users

## groups テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |

### Association

- has_many :group_users
- has_many :users, through: :group_users
- has_many :schedules

## group_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| group  | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :group

## schedules テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| start_time | datetime   | null: false                    |
| content    | string     | null: false                    |
| user       | references | null: false, foreign_key: true |
| group      | references | null: false, foreign_key: true |

### Association

- belongs_to :group
- belongs_to :user
- has_one :need_assist

