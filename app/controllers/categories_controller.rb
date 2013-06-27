class CategoriesController < ApplicationController
	before_filter :authorize, except: [:index, :show]

	def index
		if params[:entry_id]
			entry = Entry.find_by_id(params[:entry_id])
			categories = entry.categories
		else
			categories = Category.all
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

		@categories = categories[page * page_size, page_size]
	end

	def show
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
	end

	def edit
		@category = Category.find_by_id(params[:id])
	end

	def create
		@category = Category.new(params[:category])

		if @category.save
			redirect_to category_url(@category.id), notice: "New category was successfully created!"
		else
			render action: "new"
		end
	end

	def update
		@category = Category.find_by_id(params[:id])

		if @category.update_attributes(params[:category])
			redirect_to category_url(@category.id), notice: "Category was successfully updated!"
		else
			render action: "edit"
		end
	end

	def destroy
		@category = Category.find_by_id(params[:id])
		@category.destroy

		respond_to :js
	end
end