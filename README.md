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
| email               | string | null: false  |
| password            | string | null: false  |
| family-name         | string | null: false  |
| first-name          | string | null: false  |
| family-name-reading | string | null: false  |
| first-name-reading  | string | null: false  |
| birthday            | date   | null: false  |

### Association
- has_many :items
- has_many :purchases
- has_many :comments

## items テーブル                  
| Column          | Type      | Options                        |
| ------------    | --------- | ------------------------------ |
| image           | string    | null: false                    |
| name            | string    | null: false                    |
| text            | text      | null: false                    |
| condition       | string    | null: false                    |
| genre           | string    | null: false                    |
| shipping-charge | string    | null: false                    |
| shipping-place  | date      | null: false                    |
| shipping-date   | integer   | null: false                    |
| price           | integer   | null: false                    |
| user            | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchase
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

## purchase テーブル
| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| Credit-Cord  | string    | null: false                    |
| Credit-Month | integer   | null: false                    |
| Credit-Year  | integer   | null: false                    |
| Credit-CVC   | integer   | null: false                    |
| user         | reference | null: false, foreign_key: true |
| item         | reference | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one    :address
- belongs_to :comments

## Addresses テーブル
| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| portal-code      | string    | null: false                    |
| prefecture       | string    | null: false                    |
| city             | string    | null: false                    |
| house-number     | string    | null: false                    |
| building-name    | string    |                                |
| phone-number     | string    | null: false                    |
| purchase         | reference | null: false, foreign_key: true |

### Association
- belongs_to :purchase