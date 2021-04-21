# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -------------------------|
| nickname           | string | null: false              |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_reading  | string | null: false              |
| first_name_reading | string | null: false              |
| birth              | date   | null: false              |

### Association

- has_many : items
- has_many : orders

## items テーブル

| Column           | Type       | Options         |
| ---------------- | ---------- |-----------------|
| name             | string     | null: false     |
| description      | text       | null: false     |
| type_id          | integer    | null: false     |
| condition_id     | integer    | null: false     |
| shipping_cost_id | integer    | null: false     |
| prefecture_id    | integer    | null: false     |
| shipdate_id      | integer    | null: false     |
| price            | integer    | null: false     |
| user             | references | foreign_key:true|


### Association

- belongs_to : user
- has_one : order

## Orders テーブル

| Column          | Type       | Options                      |
| ----------------| -----------| -----------------------------|
| user            | references |null: false, foreign_key:true |
| item            | references |null: false, foreign_key:true |

### Association

- belongs_to : user
- belongs_to : item
- has_one : address_book

## Address_books テーブル

| Column          | Type       |Options                     |
| ----------------| ---------- |----------------------------|
| postal_code     | string     | null: false                |
| prefecture_id   | integer    | null: false                |
| city            | string     | null: false                |
| house_number    | string     | null: false                |
| building_name   | string     |                            |
| order_id        | references | NOT NULL, foreign_key:true |

### Association

- belongs_to : order