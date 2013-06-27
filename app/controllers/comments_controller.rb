class CommentsController < ApplicationController
	def create
		entry = Entry.find_by_id(params[:entry_id])
		@comment = entry.comments.new(params[:comment])

		respond_to do |format|
			format.js if entry.save
		end
	end

	def show
		entry = Entry.find_by_id(params[:entry_id])
		@comment = entry.comments.find_by_id(params[:id])
	end
end