class CommentsController < ApplicationController
	def create
		@comment = Comment.create(text: params[:text], prototype_id: params[:prototype_id], user_id: current_user.id)
		# redirect_to "/prototype/#{@comment.prototype_id}"
		respond_to do |format|
			format.html{ redirect_to prototype_path(params[:prototype_id]) }
			format.json
	end

	private 
	def comment_params
		params.permit(:text, :prototype_id)
	end
end
