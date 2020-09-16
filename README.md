# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル
| Column              | Type   | Options      |
| ------------------- | ------ |------------- |
| nickname            | string | null: false  |
| email               | string | null: false  |
| password            | string | null: false  |
| family_name         | string | null: false  |
| first_name          | string | null: false  |
| family_name_reading | string | null: false  |
| first_name_reading  | string | null: false  |
| birthday            | date   | null: false  |

### Association
- has_many :items
- has_many :order
- has_many :comments

## items テーブル                  
| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| name               | string    | null: false                    |
| text               | text      | null: false                    |
| condition_id       | integer   | null: false                    |
| genre_id           | integer   | null: false                    |
| shipping_charge_id | integer   | null: false                    |
| shipping_place_id  | integer   | null: false                    |
| shipping_date_id   | integer   | null: false                    |
| price              | integer   | null: false                    |
| user               | reference | null: false, foreign_key: true |

### Association
- belongs_to_active_hash :genre
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_charge
- belongs_to_active_hash :shipping_date
- belongs_to_active_hash :shipping_place
- has_one_attached :image
- belongs_to :user
- has_one    :order
- has_many   :comments

## comments テーブル
| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| content      | text      | null: false                    |
| user         | reference | null: false, foreign_key: true |
| item         | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## order テーブル
| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| user         | reference | null: false, foreign_key: true |
| item         | reference | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one    :address
- belongs_to :user

## Addresses テーブル
| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| portal_code      | string    | null: false                    |
| prefecture_id    | integer   | null: false                    |
| city             | string    | null: false                    |
| house_number     | string    | null: false                    |
| building_name    | string    |                                |
| phone_number     | string    | null: false                    |
| purchase         | reference | null: false, foreign_key: true |

### Association
- belongs_to :order