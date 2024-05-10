# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| password           | string  | null: false |
| familyname         | string  | null: false |
| firstname          | string  | null: false |
| familyname_kana    | string  | null: false |
| firstname_kana     | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association

- has_many :items
- has_one :purchases

## items テーブル

| Column       | Type       | Options                        |
| ------       | ------     | -----------                    |
| name         | string     | null: false                    |
| description  | text       | null: false                    |
| categoly     | string     | null: false                    |
| condition    | string     | null: false                    |
| price        | string     | null: false                    |
| user_id      | references  | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchases

## purchases テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| fee                | string     | null: false |
| area               | string     | null: false, unique: true |
| date               | string     | null: false |
| item_id            | references | null: false |

### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses

## addresses テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| zipcode            | integer | null: false |
| prefecture         | string  | null: false, unique: true |
| city               | string  | null: false |
| number             | string  | null: false |
| building           | string  |             |
| phone              | integer | null: false |

### Association

- belongs_to :purchases