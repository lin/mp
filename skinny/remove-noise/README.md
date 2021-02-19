### 突出重点，消除杂音

====

这个原则的目的是，降低阅读程序的压力，用简短清晰的符号来表达逻辑。

也就是，Reduce learning time, Remove distractions, Avoid stress.

晕头假设：假设你现在比较迷糊，却要在短时间理解一个程序，如何才能让这时的你更好的理解程序

====

#### 1，同一等级的逻辑占用同样行数的代码，最好都是一行，例如:

```ruby
# clear way
checkout: ->
  if order.charge.
    send_order_email.
    success_alert "You are awesome!"
  else
    error_alert "Error!"

# distracting way
checkout: ->
  if order.charge.
    send_order_email.
    AlertViewController.presentAlert
      self,
      title: "Success"
      message: "You are awesome!"
      actions: ["close"]
  else
    AlertViewController.presentAlert
      self,
      title: "Error"
      message: "Error!"
      actions: ["close"]
```

第二个策略的问题在于，喧宾夺主，alert并不是逻辑主要解决的问题，却要抢夺大量的注意力。

===

#### 2，在不引起歧义的前提下，尽量减少字符数（对常用函数，使用4-7个字符的单一单词最佳）

例如:

```ruby
# clean
UserMail.welcome(current_user).deliver

# verbose
MSEmailController.SendEmailMessage(currentUser.emailAddress,
                                   withTemplateNamed: “welcome”,
                                   withLocalVariables: { user:  currentUser })

# ugly
mail = MSMail.new

mail.addTo(currentUser.emailAddress)
mail.setSubject('Welcome to Our Site')

template = MSTemplate.new(locateTemplate('includes/mail/user-welcome.php'))
template.setVar('userName', $currentUser.name)
bodyStr = template.render

mail.setHTMLBody(bodyStr)

mail.send
```

最后一个方案的问题还在于：没有把责任分担给其他的类。

在这个场景下，唯一要表达的信息就是”给用户发一封欢迎邮件“，具体怎么发的（尤其是发邮件的逻辑），那是其他类需要解决的问题。

====

#### 3，选择或设计一个减少键盘敲击的编程语言

例如：python, ruby，scala, coffeescript

在写这篇文章的过程中，我设计了一个追求简洁的语言

[An Introduction to Sweet Programming Language](https://github.com/linyingkui/sweet)

===

#### [结束语](https://github.com/linyingkui/skinny/tree/master/finale/README.md)
