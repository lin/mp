### 把问题归类成相互独立的几部分，各司其职

====

#### 1, 函数要短，最好五行以内，尽量不超过20行

把程序分解成函数主要有三个目的：

1，反复使用相同的逻辑，也就是第一节讨论的话题

2，提高逻辑的抽象等级(raise the level of abstraction)，以便更好的理解

如果一个函数里有多个等级的逻辑混杂在一起，就会使得程序更加难以理解（受到污染，变得不纯净）

3，把复杂的问题切割成更好处理的小块，也就是第三节将要讨论的话题

这样做的好处是，便于程序的理解、测试、debug以及保养

====

在一个函数里，应该：

1，只表述有别于其他任何函数的逻辑

2，只表述同一层面的逻辑

3，只做一件事，并把它做好

====

举例说明，一个要把大象装冰箱的函数

```ruby
# ================================================== #
# ================== Fat Codes ===================== #
# ================================================== #
def put_elephant_into_fridge
  # open
  @user.hand.hold @fridge.door
  @user.hand.pull "10cm"
  @user.hand.clear
  # put
  @user.hand.hold @elephant
  @user.hand.up "30cm"
  @user.body.move "forward", by: "30cm"
  @user.hand.down "30cm"
  @user.hand.clear
  # close
  @user.hand.hold @fridge.door
  @user.hand.push "10cm"
  @user.hand.clear
end

# ======================================================= #
# ================== Polluted Codes ===================== #
# ======================================================= #

def put_elephant_into_fridge
  # open
  @user.hand.hold @fridge.door
  @user.hand.pull "10cm"
  @user.hand.clear
  # put
  @user.put @elephant, into: @fridge
  # close
  @user.hand.hold @fridge.door
  @user.hand.push "10cm"
  @user.hand.clear
end

# ===================================================== #
# ================== Skinny Codes ===================== #
# ===================================================== #
# this is super easy to understand,
# it only has three lines, each line means a clear step
def put_elephant_into_fridge
  @user.open_door @fridge.door
  @user.put @elephant, into: @fridge
  @user.close_door @fridge.door
end

# ===================================================== #
# ================== Better Codes ===================== #
# ===================================================== #

# open/close fridge is a common task.
# this piece of logic is shared by multiple functions.
# so it should have its own function.
# by this way, we reduced 11 lines to one line.

def put_elephant_into_fridge
  operate_fridge { |user, fridge| user.put @elephant, into: fridge }
end

def grab_coke_from_fridge
  operate_fridge { |user, fridge| user.grab @coke, from: fridge }
end

def operate_fridge &block
  @user.open @fridge.door
  block.call @user, @fridge
  @user.close @fridge.door
end
```

====

#### 2, 一个类要短，并且只做一类事

类所要追从的是[Single Responsibility Principle](https://github.com/linyingkui/skinny/blob/master/split-responsibilities/srp.pdf), 也就是说：

"There should never be more than one reason for a class to change."

更直接的，一个类只做一类事，多了不干。木匠做家具，瓦匠砌墙。

举例说明， 比如在一个卖地皮的网站上，要标注面积和价格信息

```javascript
/*
  # ================================================== #
  # ================== Fat Codes ===================== #
  # ================================================== #
*/
square_sides_length = 20
price_in_cents = 3000

console.log("Area: " + square_sides_length ** 2)
console.log("Price: " + "$" + (price_in_cents / 100).toFixed(2))


/*
  # ===================================================== #
  # ================== Skinny Codes ===================== #
  # ===================================================== #
*/
square_sides_length = 20
price_in_cents = 3000

console.log("Area: "  +  Math.Square.calculate_area(square_sides_length));
console.log("Price: " +  Currency.cents_to_string(price_in_cents));
```

第一个方案的职责是输出数值，但它又承担了计算正方形面积和生成货币字符的任务.

第一个方案虽然比较快，但是污染了类的职责，其主要弊端在于:

不便于理解程序，在这个层面上，程序员只需要知道这是在计算面积，而无需理解计算面积的方式.

=============

#### 3, 宏观的模块化，每一大块负责一个具体的任务

不在一个文件里处理两个模块的问题，彻底把责任分开。例如，在html里：
```html

<!--
  # ================================================== #
  # ================== Fat Codes ===================== #
  # ================================================== #
-->
<!-- it has too much responsibilities, 3 rather than 1 -->
<div class="post" style="background-color: red" onclick="sayHello()"></div>

<!--
  # ===================================================== #
  # ================== Skinny Codes ===================== #
  # ===================================================== #
-->
<!-- post.html  -->
<div class="post"></div>

<!-- post.css  -->
.post {
  background-color: red
}

<!-- post.js  -->
$(".post").click(function(){sayHello()});
```
两个更加具体的例子：

1，[Model-View-Controller](https://github.com/linyingkui/skinny/blob/master/split-responsibilities/mvc.rb)

2，[HTML-CSS-JavaScript](https://github.com/linyingkui/skinny/blob/master/split-responsibilities/hcj.coffee)

====

#### 4, 任何包含逻辑的文件都应该短，任何文件夹（根目录下）里的文件也应该少

任何手工写的文件，或是要人读的文件都应该非常简短，**最好限制在200行以内**。

这样其他人阅读的时候可以减少压力感(avoid overwhelming feeling)，提高理解程序的效率。

Less is more，写的短，往往意味着写的精简，不罗嗦，不重复。

除了单一文件外，文件夹根目录下的文件数量也要少（不多于10个？）.

只把最核心的文件放在根目录下，其他的文件分类整理到文件夹里，这样便于其他人阅读和查找。

===

#### 3，[把问题细化成较为简单的小问题，逐个突破](https://github.com/linyingkui/skinny/tree/master/categorize/README.md)
