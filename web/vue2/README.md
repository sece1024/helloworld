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

## 懒加载

[vue路由懒加载及组件懒加载 - z_xun - 博客园 (cnblogs.com)](https://www.cnblogs.com/xiaoxiaoxun/p/11001884.html)

## 模板字符串

[字符串模板${}失效_weixin_30767921的博客-CSDN博客](https://blog.csdn.net/weixin_30767921/article/details/95232691)

```js
`@/components/${sub.componentName}`
// 错误用法
'@/components/${sub.componentName}'
```

## 页面设计-美化

* element-ui

  [Vue + Vue-router + Element-ui 搭建一个非常简单的dashboard demo - SegmentFault 思否](https://segmentfault.com/a/1190000012015667)

# 模块引入

**需要进入vue项目所在目录，并且是cmd管理员模式**

## router

[安装 | Vue Router (vuejs.org)](https://router.vuejs.org/zh/installation.html)

* npm

```bash
npm install vue-router
```

## element

[组件 | Element](https://element.eleme.cn/#/zh-CN/component/installation)



* npm安装

`npm i element-ui -S`

* 对于已经创建的项目

```npm install --save element-ui```



# vue与springboot连接

[Springboot Vue Login(从零开始实现Springboot+Vue登录)_XiaoJL博客-CSDN博客_springboot vue](https://blog.csdn.net/xiaojinlai123/article/details/90694372)

