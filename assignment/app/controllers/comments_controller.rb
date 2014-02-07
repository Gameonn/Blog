class CommentsController < ApplicationController

def index
	@comment = Comment.all
	
end

def create
    @comment = Comment.new()
 
@comment.article_id= params[:comment][:article_id]
   @comment.note = params[:comment][:note]
   @comment.user_id= params[:comment][:user_id]
@comment.save
redirect_to article_path(@comment.article_id)
    

  end

  def show
	
	@comment = Comment.find(params[:id])
  
end

def new
    @comment = Comment.new
  end

  # GET /myreviews/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end
  def update
@comment=Comment.find(params[:id])
    @comment.note=params[:comment][:note]

    @comment.save
    redirect_to articles_path
end

def destroy
	@comment=Comment.find(params[:id])
	@comment.destroy
	respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
end


  def comment_params
      params.require(:comment).permit(:comment, :user_id,:article_id)
  end
end
