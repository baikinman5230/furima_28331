# テーブル設計

## users テーブル

| Column    | Type    | Options     |
| --------  | ------  | ----------- |
| nickname  | string  | null: false |
| email     | string  | null: false |
| password  | string  | null: false |
| name      | string  | null: false |
| name_kana | string  | null: false |
| birthday  | integer | null: false |

### Association

- has_many :items
- has_one  :transaction

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product             | string     | null: false                    |
| product_description | string     | null: false                    |
| price               | integer    | null: false                    |
| category            | integer    | null: false                    |
| product_condition   | integer    | null: false                    |
| shipping_fee_burden | integer    | null: false                    |
| shipping_region     | integer    | null: false                    |
| days_until_shipping | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### association

- has_one    :transactions
- belongs_to :user

## transactions テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- has_one    :addresses
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| postal_cord   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | integer    | null: false                    |
| building_name | string     |
| phone_number  | integer    | null: false                    |
| transaction   | references | null: false, foreign_key: true |

### Association

- belongs_to :transaction