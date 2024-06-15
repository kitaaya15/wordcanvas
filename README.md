# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |


### Association

- has_many :tweets, dependent: :destroy
- has_many :words, dependent: :destroy
- has_many :active_relationships, class_name: 'UserFollow', foreign_key: 'follower_id', dependent: :destroy
- has_many :following, through: :active_relationships, source: :followed
- has_many :passive_relationships, class_name: 'UserFollow', foreign_key: 'followed_id', dependent: :destroy
- has_many :followers, through: :passive_relationships, source: :follower
- has_many :room_users, dependent: :destroy
- has_many :rooms, through: :room_users
- has_many :messages, dependent: :destroy

## users_follows table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| follower_id                         | integer    | null: false, foreign_key: { to_table: :users } |
| followed_id                         | integer    | null: false, foreign_key: { to_table: :users } |

- belongs_to :follower, class_name: 'User'
- belongs_to :followed, class_name: 'User'

## tweets table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| content                             | string     | null: false                    |
| image                               | integer    | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :tweets_hashtags, dependent: :destroy
- has_many :hashtags, through: :tweets_hashtags

## hashtags table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| tag_name                            | string     | null: false, unique: true      |

### Association

- has_many :tweets_hashtags, dependent: :destroy
- has_many :tweets, through: :tweets_hashtags

## tweets_hashtags table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| tweet                               | references | null: false, foreign_key: true |
| hashtag                             | references | null: false, foreign_key: true |

### Association

- belongs_to :tweet
- belongs_to :hashtag

## words table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| content                             | string     | null: false                    |
| level_id                            | integer    | null: false                    |
| meaning                             | string     |                                |
| phonetic_symbol                     | string     |                                |
| parts_of_speech                     | string     |                                |
| etymology                           | text       |                                |
| example_sentence                    | text       |                                |
| other                               | text       |                                |
| image                               | string     |                                |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## rooms table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| room_name                           | string     | null: false                    |

### Association

- has_many :room_users, dependent: :destroy
- has_many :users, through: :room_users
- has_many :messages, dependent: :destroy

## RoomUsers Table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| room        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## Messages Table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| room        | references | null: false, foreign_key: true |
| content     | text       | null: false                    |
| image       | string     |                                |

### Association

- belongs_to :room
- belongs_to :user

