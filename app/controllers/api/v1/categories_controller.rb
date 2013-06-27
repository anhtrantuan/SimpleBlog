module Api
	module V1
		class CategoriesController < ApplicationController
			respond_to :json

			def index
				categories = Category.pluck(:id)
		
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

				respond_with categories[page * page_size, page_size]
			end

			def show
				respond_with Category.find_by_id(params[:id])
			end

			def create
				respond_with Category.create(params[:category])
			end

			def update
				respond_with Category.update(params[:id], params[:category])
			end

			def destroy
				respond_with Category.destroy(params[:id])
			end
		end
	end
end