class EntriesController < ApplicationController
	before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]
	
	def index
		@entries = Entry.includes(:comments).all
		
		if params[:category_id]
			@category = Category.find(params[:category_id])
			@entry_ids = @category.entries.collect { |entry| entry.id }
		else
			@entry_ids = Entry.pluck(:id)
		end

		respond_to do |format|
			format.html { redirect_to categories_url if params[:category_id] }
			format.json { render json: @entry_ids }
		end
	end

	def show
		@entry = Entry.find(params[:id])
		@categories = @entry.categories
		@comments = @entry.comments
		@new_comment = Comment.new

		respond_to do |format|
			format.html
			format.json { render json: @entry }
		end
	end

	def new
		@entry = Entry.new
		@categories = Category.all

		respond_to do |format|
			format.html
			format.json { render json: @entry }
		end
	end

	def edit
		@entry = Entry.find(params[:id])
		@categories = Category.all
	end

	def create
		@entry = Entry.new(params[:entry])

		respond_to do |format|
			if @entry.save
				format.html { redirect_to entry_url(@entry.id), notice: "New entry was successfully created!" }
				format.json { render json: @entry, status: :created, location: @entry }
			else
				format.html { render action: "new" }
				format.json { render json: @entry.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@entry = Entry.find(params[:id])

		respond_to do |format|
			if @entry.update_attributes(params[:entry])
				@entry.update_attribute(:updated_at, Time.now)
				format.html { redirect_to entry_url(@entry.id), notice: "Entry was successfully updated!" }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @entry.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@entry = Entry.find(params[:id])
		@entry.destroy

		respond_to do |format|
			format.html { redirect_to root_url }
			format.json { head :no_content }
			format.js
		end
	end
end