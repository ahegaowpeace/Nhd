<<<<<<< HEAD
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
=======
## Memo
- シンボリックリンク
	- ```rails server -b 0.0.0.0```
	- ```ln -s /Nhentai/imaegs/contents/ /rails_work/labo/app/assets/images/contents```
この順番でやらないと無限ローディングになる。(毎回リンクの付け外しをする必要がある。)
よく分からんがシンボリックリンクを張る時は絶対リンクじゃなくて、/rails_work/labo/app/assets/images/に移動して
```
ln -s /Nhentai/imaegs/contents/
```
しないといけない。
- 上記の補足
	- 一旦コンパイラを動かして、画像がありません状態にしてから↑を実行する必要がある。コンパイル後にシンボリックリンクでパスを教えてあげないと、エンコードされたパスを読みに行くため。

- jQuery導入
	- Webpackでの管理方法に変更された
	- https://qiita.com/whitia/items/34de15b72946f7f3b773
	- 諸々インストール
		- ```yarn add bootstrap jquery popper.js```
	- `app/javascript/packs/application.js`に追記
		- ```require("jquery")```
	- `config/webpack/environment.js`に追記
```
const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)
```
- Bootstrap4導入
	- `app/javascript/src/application.scss`に追記。なければ作成。
		- ```@import '~bootstrap/scss/bootstrap';```
	- `app/javascript/packs/application.js`に追記。
```
import 'bootstrap'
import '../src/application.scss'
```
>>>>>>> 93d60989ef7faf66cc89d2f92de027a2f9465358
