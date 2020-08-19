# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null:false  |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birthday        | integer | null: false |

### Association

- has_many :items
- has_one  :item_purchase

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product             | string     | null: false                    |
| description         | string     | null: false                    |
| price               | integer    | null: false                    |
| category            | integer    | null: false                    |
| product_condition   | integer    | null: false                    |
| shipping_fee_burden | integer    | null: false                    |
| shipping_region     | integer    | null: false                    |
| days_until_shipping | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- has_one    :item_purchase
- belongs_to :user

## item_purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- has_one    :address
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column          | Type       | Options                        |
| --------------  | ---------- | ------------------------------ |
| postal_cord     | string     | null: false                    |
| prefecture      | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |
| phone_number    | string     | null: false                    |
| item_purchase   | references | null: false, foreign_key: true |

### Association

- belongs_to :item_purchase