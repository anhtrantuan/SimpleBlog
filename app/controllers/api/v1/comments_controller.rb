module Api
	module V1
		class CommentsController < ApplicationController
			respond_to :json

			def index
				entry = Entry.find_by_id(params[:entry_id])
				comments = entry.comments.order(:created_at).map { |comment| comment.id }
				
				page_size = if params[:page_size]
					params[:page_size].to_i
				else
					PAGE_SIZE
				end
				page = if params[:page]
					params[:page].to_i - 1
				else
					0
				end

				respond_with comments[page * page_size, page_size]
			end

			def create
				entry = Entry.find_by_id(params[:entry_id])
				comment = entry.comments.create(params[:comment])

				respond_with comment
			end

			def show
				entry = Entry.find_by_id(params[:entry_id])
				respond_with entry.comments.find_by_id(params[:id])
			end
		end
	end
end