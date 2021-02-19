#### 把问题细化成较为简单的小问题，逐个突破

这是最简单的一个原则.

#### 1, 把特别长的文件，切割成多个短小的文件。例如，

一个网页的主页有三个部分，把三个部分的逻辑分别放到不同的文件：

```ruby
views/
  ├── home/
  |   ├── hero.html
  |   ├── how-it-works.html
  |   └── press.html
  └── home.html
```

#### 2, 把包含特别多文件的文件夹，整理到少数几个文件夹里，例如

把放字体的文件夹整理起来：

```ruby
# ================================================== #
# ================== Fat Codes ===================== #
# ================================================== #
fonts/
  ├── futurastd-condensed-webfont.woff
  ├── futurastd-condensedbold-webfont.woff
  ├── futurastd-condensedboldobl-webfont.woff
  ├── proximanova-bold-webfont.woff
  ├── proximanova-light-webfont.woff
  ├── proximanova-semibold-webfont.woff
  ├── proximanova-regular-webfont.woff
  ├── raleway-bold.woff
  └── raleway-regular.woff

# ===================================================== #
# ================== Skinny Codes ===================== #
# ===================================================== #
fonts/
  ├── futurastd-condensed/
  |   ├── futurastd-condensed-webfont.woff
  |   ├── futurastd-condensedbold-webfont.woff
  |   └── futurastd-condensedboldobl-webfont.woff
  ├── proximanova/
  |   ├── proximanova-bold-webfont.woff
  |   ├── proximanova-light-webfont.woff
  |   ├── proximanova-semibold-webfont.woff
  |   └── proximanova-regular-webfont.woff
  └── raleway/
      ├── raleway-bold.woff
      └── raleway-regular.woff
```

=====

在写这个文章的过程中，为了更好的放置不同的文件夹，我设计了一个针对GUI的框架(framework)：

[Scenarios based framework for GUI softwares](https://github.com/linyingkui/skinny/blob/master/categorize/scenarios.md)

===

#### 4，[突出重点，消除杂音](https://github.com/linyingkui/skinny/tree/master/remove-noise/README.md)
