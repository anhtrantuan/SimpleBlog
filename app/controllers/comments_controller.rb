class CommentsController < ApplicationController
	def index
		@entry = Entry.find(params[:entry_id])
		@comments = @entry.comments

		respond_to do |format|
			format.json { render json: @comments }
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