class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  access all: [:show, :index], user: {except: [:destroy, :create, :update, :edit, :new, :toggle_status]}, site_admin: :all
  layout 'blog'
  
  def index
    @blogs = Blog.all
    @page_title += " | #{params[:controller]}"
    @seo_content = params[:controller]
  end


  def show
    @page_title = @blog.title
    @seo_content = @blog.title
  end


  def new
    @blog = Blog.new
    @page_title += " | #{params[:action]}"
  end


  def edit
    @page_title += " | #{params[:action]} #{@blog.title}"
  end


  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html {redirect_to @blog, notice: 'Blog was successfully created.'}
      else
        format.html {render :new}
      end
    end
  end


  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html {redirect_to @blog, notice: 'Blog was successfully updated.'}
      else
        format.html {render :edit}
        format.json {render json: @blog.errors, status: :unprocessable_entity}
      end
    end
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
    else
      @blog.draft!
    end
    respond_to do |format|
      format.html {redirect_to blogs_path, notice: 'Blog was successfully updated.'}
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html do
        redirect_to blogs_url, notice: 'Blog was successfully destroyed.'
      end
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
