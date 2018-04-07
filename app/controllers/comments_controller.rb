class CommentsController < ApplicationController
	before_action :set_prototype

	def create
		@comment = @prototype.comments.new(text: comment_params[:text], user_id: comment_params[:user_id], prototype_id: params[:prototype_id])
		if @comment.save
			respond_to do |format|
      	format.html { redirect_to prototype_path(@prototype) }
				format.json
			end
		else
			@comment = @prototype.comment.includes(:user)
			flash.now[:alert] = 'メッセージを入力してください'
			redirect_to prototype_path(@prototype)
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:text).merge(user_id: current_user.id)
	end

	def set_prototype
		@prototype = Prototype.find(params[:prototype_id])
	end
end





