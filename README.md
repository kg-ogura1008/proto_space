Structure of DataBase

## Users table
|Column|Type|Option|
|------|----|------|
|nama|string|null: false, unique: true|
|email|string|ull: false, unique: true|
|position|string|
|profile|string|
|avatar|bynary|

### association

has_many :comments, :likes, :prototypes


## Prototype table
|Column|Type|Option|
|------|----|------|
|user_id|references|null: false,foreign_key: true, add_index|
|title|string|
|catchcopy|text|
|concept|text|
|likes_count|integer|

### association

has_many :captured_images, :comments, :likes
belongs_to :user


## CapturedImage table
|Column|Type|Option|
|------|----|------|
|proto_id|references|null: false,foreign_key: true|
|tag_id|references|null: false,foreign_key: true|

### association

belongs_to :prototype


## Likes table
|Column|Type|Option|
|------|----|------|
|user_id|references|null: false,foreign_key: true|
|prototype_id|references|null: false,foreign_key: true|

### association

belongs_to :user, 
belongs_to :prototype, counter_cache: :likes_count


## Comments table
|Column|Type|Option|
|------|----|------|
|content|text|
|user_id|references|null: false,foreign_key: true|
|prototype_id|references|null: false,foreign_key: true|

### association

belongs_to :user, :prototype

## protos-tag table
|Column|Type|Option|
|------|----|------|
|proto_id|references|null: false,foreign_key: true|
|tag_id|references|null: false,foreign_key: true|

### association

belongs_to :prototype, :tag

## tags table
|Column|Type|Option|
|------|----|------|
|lavel|string|

### association

balongs_to :proto_tag

