# テーブル設計

## users テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | -------------|
| nickname           | string | NOT NULL     |
| email              | string | UNIQUE TRUE  |
| encrypted_password | string | NOT NULL     |
| last_name          | string | NOT NULL     |
| first_name         | string | NOT NULL     |
| last_name_reading  | string | NOT NULL     |
| first_name_reading | string | NOT NULL     |
| birth              | date   | NOT NULL     |

### Association

- has_many : items
- has_many : orders

## items テーブル

| Column           | Type       | Options         |
| ---------------- | ---------- |-------------- --|
| name             | string     | NOT NUL         |
| description      | text       | NOT NULL        |
| type_id          | integer    | NOT NULL        |
| condition_id     | integer    | NOT NULL        |
| shipping_cost_id | integer    | NOT NULL        |
| prefecture_id    | integer    | NOT NULL        |
| shipdate_id      | integer    | NOT NULL        |
| price            | integer    | NOT NULL        |
| user             | references | foreign_key:true|


### Association

- belongs_to : user
- has_one : order

## Orders テーブル

| Column  | Type       | Options                   |
| --------| ---------- | --------------------------|
| user_id | references |NOT NULL, foreign_key:true |
| item_id | references |NOT NULL, foreign_key:true |

### Association

- belongs_to : user
- belongs_to : item
- has_one : address_book

## Address_book テーブル

| Column          | Type       | Options                    |
| ----------------| ---------- | -------------------------- |
| postal_code_id  | string     | NOT NULL                   |
| prefecture_id   | integer    | NOT NULL                   |
| city            | string     | NOT NULL                   |
| house_number    | string     | NOT NULL                   |
| building_name   | string     |                            |
| user_id         | references | NOT NULL, foreign_key:true |
| item_id         | references | NOT NULL, foreign_key:true |

### Association

- belongs_to : order