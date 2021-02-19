### 避免反复解决那些反复出现的问题

====

#### 1, Don’t repeat yourself.

把出现多次的重复代码整理起来。

例子:

```ruby
# ================================================================================== #
# ================== An example of making codes dry and skinny ===================== #
# ================================================================================== #


# =============================================================== #
# ================== 1, Django's controller ===================== #
# =============================================================== #

def show
  product = Product.find params[:id]
  render 'products/show.html', variables: { product: product }
end

# ================================================================ #
# ================== 2, set default directory ==================== #
# ================================================================ #

# set default folder to 'products/', set default file extension to html
def show
  product = Product.find params[:id]
  render :show, variables: { product: product }
end

# ==================================================================== #
# ================== 3, remove variables argument ==================== #
# ==================================================================== #

# use instance variable instead of passing variables argument
def show
  @product = Product.find params[:id]
  render :show
end

# ======================================================= #
# ================== 4, use callback ==================== #
# ======================================================= #

# use before_action callback to do this repeated task.
before_action :set_product

def show
  # product = Product.find params[:id]
  render :show
end

def index
  # product = Product.find params[:id]
  render :index
end

def edit
  # product = Product.find params[:id]
  render :edit
end

private

def set_product
  @product = Product.find params[:id]
end

# ============================================================ #
# ================== 5, use function name ==================== #
# ============================================================ #

# use function name (show) to call render method
def show
end

# ============================================================ #

# THE END: write nothing
# Note: This is the rails way to deal with normal controller actions.
```

极端的假设：如果一段代码，需要你反复写一千次，你会怎么减轻自己重复敲代码（甚至是重复思考和解决）的痛苦。

更多例子：

1，[Array counting](https://github.com/linyingkui/skinny/blob/master/generalize/count.rb)

2，[jQuery selector](https://github.com/linyingkui/skinny/blob/master/generalize/jquery.coffee)

====

#### 2, Convention over configuration.

把大多数人在大多数情况下所采取的设置，定为默认设置。

例如，自动生成数据库里table的名字：

```ruby
# ===================================================== #
# ================== Configuration ==================== #
# ===================================================== #

# models/user.rb
User.DATABASE_TABLE_NAME     = "users"

# models/post.rb
Post.DATABASE_TABLE_NAME     = "posts"

# models/product.rb
Product.DATABASE_TABLE_NAME = "products"

# ================================================== #
# ================== Convention ==================== #
# ================================================== #

# models/base.rb
BaseModel.DATABASE_TABLE_NAME= self.class.name.pluralize.lower
```

====

#### 3, 抽象出一个处理通用逻辑的基类 （特殊的DRY）

例如，[一个RESTful API的基类](https://blog.codelation.com/rails-restful-api-just-add-water/)：

```ruby
class API::BaseController

  def create
    create_resource(params)
    render :show, status: :created
  end

  def read
    @resource = resource_class.find params[:id]
    render :show
  end

  def update
    @resource = resource_class.find params[:id]
    @resource.update params
    render :show
  end

  def destroy
    @resource.destroy
    render :no_content
  end

end
```

===

#### 2，[把问题归类成相互独立的几部分，各司其职](https://github.com/linyingkui/skinny/tree/master/split-responsibilities/README.md)
