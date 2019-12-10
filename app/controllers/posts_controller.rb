class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
      @post=Post.find_by(id: params[:id])
  end

  def new
    @category_number = params[:category_number]
  end

  def create
    #空のpostインスタンスを作成
    @post = Post.new(content: params[:content], user_id: session[:user_id],tag: params[:tag],category: params[:category_number] )
    if @post.save
      redirect_to("/posts/index")
    else
      redirect_to("/posts/new/#{params[:category_number]}")
    end
  end

  def search
    #その要素の投稿だけをwhereメソッドで@postsに代入
    @posts=Post.where(category: params[:category_number]).order(created_at: :desc)
    @category=params[:category_number].to_i
    category=Category.find_by(number: params[:category_number])
    @category_name=category.category
  end

  def login_form
  end

  def posts_in_category
    @category = Category.find_by(number: params[:category_number].to_i)
    @posts = Post.where(category: @category.number())
  end




end
