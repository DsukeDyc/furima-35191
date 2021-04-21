# テーブル設計

## users テーブル

| Column             | Type   | Options  |
| ------------------ | ------ | -------- |
| nickname           | string | NOT NULL |
| email              | string | NOT NULL |
| password           | string | NOT NULL |
| last_name          | string | NOT NULL |
| first_name         | string | NOT NULL |
| last_name_reading  | string | NOT NULL |
| first_name_reading | string | NOT NULL |
| birth              | date   | NOT NULL |

### Association

- has_many : items
- has_many : orders

## items テーブル

| Column         | Type       | Options  |
| -------------- | ---------- |----------|
| name           | string     | NOT NULL |
| description    | text       | NOT NULL |
| type           | string     | NOT NULL |
| condition      | text       | NOT NULL |
| shipping_cost  | string     | NOT NULL |
| ShipRegion     | string     | NOT NULL |
| ShipDate       | string     | NOT NULL |
| price          | integer    | NOT NULL |
| user           | references |          |
| saler_id       | integer    |          |

### Association

- belongs_to : users
- has_one : orders

## Orders テーブル

| Column       | Type    | Options  |
| -------------| ------- | -------- |
| name         | string  | NOT NULL |
| price        | integer | NOT NULL |
| shipping_cost| string  | NOT NULL |
| buyer_id     | integer |

### Association

- belongs_to : users
- belongs_to : items
- has_one : address_book

## Address_book テーブル

| Column       | Type    | Options     |
| -------------| ------- | ----------- |
| postal_code  | string  | NOT NULL    |
| prefecture   | integer | NOT NULL    |
| city         | string  | NOT NULL    |
| house_number | string  | NOT NULL    |
| building_name| string  | UNIQUE TRUE |
| house_number | string  | NOT NULL    |

### Association

- belongs_to : orders 