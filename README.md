# Furima 
フリーマーケットアプリ

# App URL
https://furima-35860.herokuapp.com/


# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| birthday           | date    | null: false |

- has_many :products
- has_many :histories

## products テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| p-name             | string     | null: false                    |
| description        | text       | null: false                    |
| category           | integer    | null: false                    |
| description        | integer    | null: false                    |
| status             | integer    | null: false                    |
| obligation         | integer    | null: false                    |
| area               | integer    | null: false                    |
| date               | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :history

## histories テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :product
- has_one :costomer

## customers テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture     | integer    | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

- belongs_to :history


