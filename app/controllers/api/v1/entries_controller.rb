module Api
	module V1
		class EntriesController < ApplicationController
			respond_to :json

			def index
				if params[:category_id]
					category = Category.find_by_id(params[:category_id])
					entries = category.entries.order(:title).map { |entry| entry.id }
				else
					entries = Entry.order(:title).pluck(:id)
				end
		
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

				respond_with ntries[page * page_size, page_size]
			end

			def show
				respond_with Entry.find_by_id(params[:id])
			end

			def create
				respond_with Entry.create(params[:entry])
			end

			def update
				respond_with Entry.update(params[:id], params[:entry])
			end

			def destroy
				respond_with Entry.destroy(params[:id])
			end
		end
	end
end