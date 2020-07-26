# README

This README would normally document whatever steps are necessary to get the
application up and running.

## 共同開発企画App｜Taskun
>チームでのタスク管理アプリ

※作成後、ここにgifを貼る

## 使用言語、FW

- Ruby
- Rails（5系）

## 使用技術（随時更新）

- MySQL（5.7）
- 

## URL（随時更新）

- 
-

## 機能一覧（随時更新）

- 
-
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|image|string|null: false|
|password|string|null: false|
|belong|string|

### Association
- has_many :members
- has_many :groups through: members
- has_many :comments
- has_many :tasks through: comments
- has_many :officers
- has_many :tasks turough: officers

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|group_name|string|null: false|

### Association
- has_many :members
- has_many :users through: members


## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## tasksテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|deadline|string|null: false|
|startdate|string|null: false|
|status|integer|null: false|
|member_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|ancestry|string|null: false|

### Association
- belongs_to :category
- has_many :officers
- has_many :users through: officers


## officersテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|task|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :task


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|task|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :task

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|

### Association
- has_many :tasks 