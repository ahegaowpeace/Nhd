## Memo
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
