### Scenarios based framework for GUI softwares

这个框架方案的理念就是：把写程序当成是按照剧本（设计图稿）拍电影

Scenario指的是场景，Scene指的是场景里的一个画面

为什么会出现scenario？是因为数据的相似性，也就是信息出现的频率，还是计算缩减的一部分。

计算缩减包括了完整信息的缩减，也包括了模糊信息的缩减（所谓模糊就是指的，信息的外延，变形，但是变得不是很大）

接下来举例说明。

这个是程序主目录的列表，（借鉴Rails的设计）

```
twitter/
  ├── app/
  ├── bin/
  ├── config/
  ├── lib/
  ├── log/
  ├── test/
  └── vendor/
```

其中，`app`是和这个软件直接相关的逻辑

=============================

在`app`文件夹里：

```
app/
  ├── models/
  ├── controllers/
  ├── helpers/
  └── views/
```

按照MVVMC的设计理念分为四个部分，其中`helpers`就是View Model（把view里重复的逻辑放到helpers里）

=============================

在`model`文件夹里：

```
models/
  ├── generic/
  ├── vendor/
  |   ├── stripe.rb
  |   ├── shopify.rb
  |   └── instagram.rb
  ├── user/
  ├── product/
  |   ├── properties.rb
  |   ├── relationships.rb
  |   └── callbacks.rb
  ├── user.rb
  └── product.rb
```

值得注意的是：1，把一个大的class分解成小的部分，2，把相近的model归纳到一个文件夹里

=============================

**接下来进入主题**，

对于与views相关的：view，controller和helper，它们都是按照scenarios的不同来建立文件夹。

其中generic就是多个scenarios共用的逻辑。

```
app/
  ├── models/
  ├── controllers/
  |   ├── generic/
  |   ├── auth/
  |   ├── checkout/
  |   └── site/
  ├── helpers/
  |   ├── generic/
  |   ├── auth/
  |   ├── checkout/
  |   └── site/
  └── views/
      ├── generic/
      |   ├── styles/
      |   ├── events/
      |   ├── layouts/
      |   └── scenes/
      ├── auth/
      ├── checkout/
      └── site/
          ├── styles/
          ├── events/
          ├── layouts/
          └── scenes/
              ├── home/
              |   ├── hero.html
              |   ├── how-it-works.html
              |   └── press.html
              ├── home.html
              ├── about-us.html
              └── contact.html
```

==========

这样整理的优点在于：

1，Consistency is king。这样的结构相对比较清晰，便于理解和查找逻辑

2，同一场景里的多个画面，许多设计元素以及需要处理的动作是非常接近的（甚至是一致的）

应该说，正因为这些设计元素和需要处理的动作非常接近，我们才归纳这些画面为一个场景

3，用户操作时，同一场景的多个画面是连续的，有利于将程序切割成相互独立、关联性较小的模块
