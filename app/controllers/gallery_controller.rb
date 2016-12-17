class GalleryController < ApplicationController

	before_action :login_check
	skip_before_action	:login_check,	:only => [:posts, :posts_category, :show]

  def posts
	@posts = Post.all
  end

  def posts_category
	case params[:category]
	when "Charged"
		@category = "Charged"
	else 
		@category = "Free"
	end
	@posts = Post.where(category: @category)
  end

  def show
	@post = Post.find(params[:id])
	@comment_writer = User.where(id: session[:user_id])[0]
  end

  def write
  end

  def write_complete
	post = Post.new
	post.user_id = session[:user_id]
	post.category = params[:post_category]
	post.title = params[:post_title]
	post.content = params[:post_content]
	post.image = params[:image]
	if post.save
		flash[:alert] = "Save complete!"
		redirect_to "/gallery/show/#{post.id}"
	else
		flash[:alert] = post.errors.values.flatten.join('')
		redirect_to :back
	end
  end

  def edit
	@post = Post.find(params[:id])
	if @post.user_id != session[:user_id]
		flash[:alert] = "수정 권한이 없습니다."
		redirect_to	:back
	end
  end

  def edit_complete
	post = Post.find(params[:id])
	post.category = params[:post_category]
	post.title = params[:post_title]
	post.content = params[:post_content]
	if post.save
		flash[:alert] = "Modify complete!"
		redirect_to "/gallery/show/#{post.id}"
	else
		flash[:alert] = post.errors.values.flatten.join('')
		redirect_to	:back
	end
  end

  def delete_complete
	post = Post.find(params[:id])
	if post.user_id == session[:user_id]
		post.destroy
		flash[:alert]="Delete complete!"
		redirect_to "/"
	else
		flash[:alert] = "삭제 권한이 없습니다."
		redirect_to :back
	end
  end
  def write_comment_complete
	comment = Comment.new
	comment.user_id = session[:user_id]
	comment.post_id = params[:post_id]
	comment.content = params[:comment_content]
	comment.save

	flash[:alert] = "New comment save"
	redirect_to "/gallery/show/#{comment.post_id}"
  end
  def delete_comment_complete
	comment = Comment.find(params[:id])
	if comment.user_id == session[:user_id]
		comment.destroy
		flash[:alert]="Delete comment complete!"
		redirect_to "/gallery/show/#{comment.post_id}"
	else
		flash[:alert] = "해당 댓글의 삭제 권한이 없습니다."
		redirect_to	:back
	end
  end
end
