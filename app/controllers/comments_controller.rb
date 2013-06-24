class CommentsController < ApplicationController
	def index
		@entry = Entry.find(params[:entry_id])
		@comment_ids = @entry.comments.collect { |comment| comment.id }

		respond_to do |format|
			format.json { render json: @comment_ids }
		end
	end

	def create
		@entry = Entry.find(params[:entry_id])
		@comment = Comment.new(params[:comment])
		@entry.comments << @comment

		respond_to do |format|
			format.html { redirect_to entry_url(@entry.id) }
			format.js if @entry.save
			format.json { head :no_content }
		end
	end

	def show
		@entry = Entry.find(params[:entry_id])
		@comment = @entry.comments.find(params[:id])

		respond_to do |format|
			format.json { render json: @comment }
		end
	end
end