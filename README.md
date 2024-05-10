# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| familyname         | string  | null: false |
| firstname          | string  | null: false |
| familyname_kana    | string  | null: false |
| firstname_kana     | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type        | Options                        |
| ------       | ------      | -----------                    |
| name         | string      | null: false                    |
| description  | text        | null: false                    |
| category_id  | integer     | null: false                    |
| condition_id | integer     | null: false                    |
| fee_id       | integer     | null: false                    |
| area_id      | integer     | null: false                    |
| date_id      | integer     | null: false                    |
| price        | integer     | null: false                    |
| user         | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column             | Type       | Options                         |
| ------------------ | ------     | -----------                     |
| user               | references | null: false, foreign_key: true  |
| item               | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| zipcode            | string     | null: false |
| area_id            | integer    | null: false |
| city               | string     | null: false |
| number             | string     | null: false |
| building           | string     |             |
| phone              | string     | null: false |
| purchase           | references | null: false, foreign_key: true  |

### Association

- belongs_to :purchase
