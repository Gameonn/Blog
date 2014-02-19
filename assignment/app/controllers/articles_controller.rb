class ArticlesController < ApplicationController

def index

@article = Article.all.paginate(:page => params[:page], :per_page =>3 ).search(params[:search])
@m = User.all
 @comment = Comment.all
 # @user=User.find(params[:id])
  
   # @art = Article.search(params[:search])
 # if params[:search]
 #      @articles = Article.search(params[:search]).order("created_at DESC")
 #    else
 #      @articles = Article.order("created_at DESC")
 #    end
end

def show
	
	@article = Article.find(params[:id])
  
end

def new
    @article = Article.new
  end

  def myart

 @article = Article.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page =>3 )


  end

  # GET /myreviews/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  def create

    @article = Article.new(article_params)
   # @articles.articles_id = current_user.id
@article.title=params[:article][:title]
@article.body=params[:article][:body]
    @article.user_id = current_user.id

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Myblog was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /myreviews/1
  # PATCH/PUT /myreviews/1.json
  def update
@article=Article.find(params[:id])
    @article.title=params[:article][:title]
@article.body=params[:article][:body]
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
  @article=Article.find(params[:id])
    @article.destroy
   respond_to do |format|
      format.html { redirect_to articles_url}
      format.json { head :no_content }
    end
  end



private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :string, :body, :text, :photo)
    end

    

end
