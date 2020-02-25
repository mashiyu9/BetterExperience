
## README

# BetterExperience

## 概要

一緒にゲームを遊ぶプレイヤーを募集することのできるアプリ

## コンセプト

簡単に条件つけて募集を行うことができる

現状、似たようなアプリはたくさんあるのですが、問題点として
ゲーム毎にアプリを変える必要がある。
そもそも機能としてあまり充実していない。
あまり流行っていないゲームだとそもそもアプリ自体がない。

そのため、充実した機能のアプリを作り、一緒に遊ぶプレイヤーを探す人を一箇所に集めることができれば、よりよいゲーム体験をできる人が増えるのではないか

## バージョン

ruby 2.6.5
rails 5.2.4.1

## 機能一覧

* ログイン機能
* ユーザー登録機能
* facebook認証 twitter認証
* プレイヤー募集一覧機能
* 募集の絞り込み
* プレイヤーを募集をすることができる
* 募集するとき条件を設定することができる
* 募集編集機能
* 自動メール機能
### これからつけたいもの
* twitter認証
* facebook認証
* 募集取り消し機能
* ブラックリスト機能

## カタログ設計
https://docs.google.com/spreadsheets/d/15-XLGuEqWu93lxXG8fRfVomv2uYzUNcQ1HW1Ns8UN_Q/edit?usp=sharing

## テーブル定義
https://docs.google.com/spreadsheets/d/13TLXv_iWKUGne9PrUGLO7CS2Z2c4dpRPBIEnNuR-z-w/edit?usp=sharing

## 画面遷移図
https://docs.google.com/spreadsheets/d/151nHie5nyWMsEmWepeAaUbhFljGNzt4QRJ6dMkFUph8/edit?usp=sharing

## ER図
https://docs.google.com/spreadsheets/d/10ii_1vyLIu6T-s4MmfUgnrVbz7GqqUiJmSMCJXasFTE/edit?usp=sharing

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1ztr8OBD9sL7bU5GkpFUlQOFSeF0JWYLK9cPFfK5sehM/edit?usp=sharing

## 使用GEM
### ログイン関係
* device
* devise-i18n
* devise-i18n-views'
* omniauth
* omniauth-facebook
* omniauth-twitter

### フロント
* webpacker
* bootstrap
* kaminari

### デバッグ
* better_errors

### 環境変数
* dotenv-rails

### 検索
* ransack

### テスト
* rspec-rails
* spring-commands-rspec
* factory_bot_rails
* capybara
* selenium-webdriver
* launchy

### 辞書機能
* i18n

### slim記法
* slim
* html2slim