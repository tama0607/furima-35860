# Furima 
フリーマーケットアプリ


# App URL
https://furima-35860.herokuapp.com/



## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false              |
| email              | string  | null:false,unique: true  |
| encrypted_password | string  | null: false              |
| first_name         | string  | null: false              |
| last_name          | string  | null: false              |
| first_name_kana    | string  | null: false              |
| last_name_kana     | string  | null: false              |
| birthday           | date    | null: false              |

- has_many :products
- has_many :histories

## products テーブル


| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| p_name             | string     | null: false                    |
| description        | text       | null: false                    |
| category_id           | integer    | null: false                    |
| status_id             | integer    | null: false                    |
| obligation_id         | integer    | null: false                    |
| prefecture_id               | integer    | null: false                    |
| date_id               | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :history

## histories テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :product
- has_one :customer

## customers テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| history          | references | null: false, foreign_key: true |

- belongs_to :history