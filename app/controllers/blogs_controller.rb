class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @blogs = Blog.order(created_at: :desc)
  end

  def search
    # パラメータから検索キーワードを取得
    keyword = params[:keyword]

    # キーワードを使ってブログを検索
    @blogs = Blog.where("title LIKE ?", "%#{keyword}%").order(created_at: :desc)
  end

  def new
    @blog = Blog.new
  end

  def show
    @comment = Comment.new
    @comments = @blog.comments.includes(:user)
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blog_url(@blog), notice: 'Blog was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to blog_url(@blog), notice: 'Blog was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'Blog was successfully destroyed.'
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :description, :movie, :published_at).merge(user_id: current_user.id)
  end

  # もし必要ならばmove_to_indexメソッドを定義してください
   def move_to_index
     
  end
end
