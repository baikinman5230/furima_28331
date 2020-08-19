# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_one  :transaction

## items テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| title     | string     | null: false                    |
| text      | string     | null: false                    |
| price     | integer    | null: false                    |
| category  | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |

### association

- has_one    :transactions
- belongs_to :users

## transactions テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| title     | string     | null:false                     |
| text      | string     | null: false                    |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- has_one    :addresses
- belongs_to :users
- belongs_to :items

## addresses テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| postal_cord   | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | integer    | null: false                    |
| building_name | string     |
| transaction   | references | null: false, foreign_key: true |

### Association

- belongs_to :transactions