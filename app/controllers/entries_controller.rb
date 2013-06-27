class EntriesController < ApplicationController
	before_filter :authorize, except: [:index, :show]
	
	def index
		if params[:category_id]
			category = Category.find_by_id(params[:category_id])
			entries = category.entries.order(:title)
		else
			entries = Entry.order(:title).all
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

		@entries = entries[page * page_size, page_size]
	end

	def show
		@entry = Entry.find_by_id(params[:id])
		@categories = @entry.categories
		@comments = @entry.comments
		@new_comment = Comment.new
	end

	def new
		@entry = Entry.new
		@categories = Category.all
	end

	def edit
		@entry = Entry.find_by_id(params[:id])
		@categories = Category.all
	end

	def create
		@entry = Entry.new(params[:entry])

		if @entry.save
			redirect_to entry_url(@entry.id), notice: "New entry was successfully created!"
		else
			render action: "new"
		end
	end

	def update
		@entry = Entry.find_by_id(params[:id])

		if @entry.update_attributes(params[:entry])
			redirect_to entry_url(@entry.id), notice: "Entry was successfully updated!"
		else
			render action: "edit"
		end
	end

	def destroy
		@entry = Entry.find_by_id(params[:id])
		@entry.destroy

		respond_to :js
	end
end