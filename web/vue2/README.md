# 入门

**记得在 `cmd` 管理员模式下使用 `npm`**

https://vuejs.org/v2/guide/

## 安装

### vue环境搭建

https://www.jianshu.com/p/cf70a7fa04c7

https://www.runoob.com/w3cnote/vue2-start-coding.html



## 创建

### 根据模板创建项目

> vue init webpack-simple 工程名字<工程名字不能用中文>
> 或者创建 vue1.0 的项目
> vue init webpack-simple#1.0 工程名字<工程名字不能用中文>

```
npm config set prefix "D:\development\nodejs\node_global"
npm config set cache "D:\development\nodejs\node_cache"
## 查看本地仓库
npm list -global
## 查看所有配置信息
npm config list
```

```
npm config set registry https://registry.npm.taobao.org
## 查看设置的国内镜像对不对
npm config get registry
## 安装vue.js到全局
npm install vue -g
```



## 语法示例

### 文本显示

```html
<div id="app">
  {{ message }}
</div>
```

```js
var app = new Vue({
  el: '#app',
  data: {
    message: 'Hello Vue!'
  }
})
```



## 指令

### 属性绑定

#### v-bind

**鼠标悬浮**

```html
<div id="app-2">
  <span v-bind:title="message">
    Hover your mouse over me for a few seconds
    to see my dynamically bound title!
  </span>
</div>
```

```js
var app2 = new Vue({
  el: '#app-2',
  data: {
    message: 'You loaded this page on ' + new Date().toLocaleString()
  }
})
```

### 条件与循环

#### 



#### v-if

```html
<div id="app-3">
  <span v-if="seen">Now you see me</span>
</div>
```

```js
var app3 = new Vue({
  el: '#app-3',
  data: {
    seen: true
  }
})
```

在JavaScript控制台将`app3.seen`修改为`false`，可以看到文本消失。

#### v-for

```html
<div id="app-4">
  <ol>
    <li v-for="todo in todos">
      {{ todo.text }}
    </li>
  </ol>
</div>
```

```js
var app4 = new Vue({
  el: '#app-4',
  data: {
    todos: [
      { text: 'Learn JavaScript' },
      { text: 'Learn Vue' },
      { text: 'Build something awesome' }
    ]
  }
})
```

在控制台输入`app4.todos.pop()`和`app4.todos.push('something new')`可以修改文本列表。



### 交互

#### v-on

```html
<div id="app-5">
  <p>{{ message }}</p>
  <button v-on:click="reverseMessage">Reverse Message</button>
</div>
```

```js
var app5 = new Vue({
  el: '#app-5',
  data: {
    message: 'Hello Vue.js!'
  },
  methods: {
    reverseMessage: function () {
      this.message = this.message.split('').reverse().join('')
    }
  }
})
```

点击按钮将文本反转。

