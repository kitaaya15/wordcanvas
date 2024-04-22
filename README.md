# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |


### Association

* has_many :words

## words table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| content                             | string     | null: false                    |
| level_id                            | integer    | null: false                    |
| meaning                             | text       |                                |
| phonetic_symbol                     | text       |                                |
| parts_of_speech                     | text       |                                |
| etymology                           | text       |                                |
| example_sentence                    | text       |                                |
| other                               | text       |                                |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user