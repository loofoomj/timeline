class WallController < ApplicationController
  before_action :login_check
  skip_before_action  :login_check, :only => [:posts]

  #포스트 부
  def write
    @user_write = User.find(params[:user_id])
  end

  def write_complete
  	p = Post.new
  	p.name = params[:writer]
  	p.content = params[:content]
  	if p.save
  		redirect_to "/wall/posts"
  	else
  		flash[:alert] = p.errors[:content][0]
  		redirect_to :back
  	end
  	
  end

  def edit
  	@post_edit = Post.find(params[:id])
  end

  def edit_complete
  	p = Post.find(params[:id])
  	p.name = params[:writer_edit]
  	p.content = params[:content_edit]
  	if p.save
  		redirect_to "/wall/posts"
  	else
  		flash[:alert] = p.errors[:content][0]
  		redirect_to :back
  	end
   end

   def delete
   	@post_delete = Post.find(params[:id])
   end

   def delete_complete
   	p = Post.find(params[:id])
    p.comments.each do |comment|
      comment.destroy
    end
   	p.destroy

   	redirect_to "/wall/posts"
   end

   #댓글 부

   def write_comment
     @post_comment = Post.find(params[:id])
     @user_write = User.find(params[:user_id])
   end

   def write_comment_complete
    c = Comment.new
    c.post_id = params[:post_id]
    c.name = params[:writer]
    c.content = params[:content]
    c.save

    redirect_to "/wall/posts" 
   end

   def edit_comment
     @post_comment = Post.find(params[:id])
     @comment_edit = Comment.find(params[:comment_id])
   end

   def edit_comment_complete
    c = Comment.find(params[:id])
    c.name = params[:writer_comment_edit]
    c.content = params[:content_comment_edit]
    if c.save
      redirect_to "/wall/posts"
    else
      flash[:alert] = p.errors[:content][0]
      redirect_to :back
    end
   end

   def delete_comment
     @comment_delete = Comment.find(params[:comment_id])
   end

   def delete_comment_complete
    c = Comment.find(params[:id])
    c.destroy
     
    redirect_to "/wall/posts"
   end

  def posts
  	@posts = Post.all
  end
end
