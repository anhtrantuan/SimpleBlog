class CategoriesController < ApplicationController
	before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]

	def index
		@categories = Category.all
		@category_ids = Category.pluck(:id)

		respond_to do |format|
			format.html
			format.json { render json: @category_ids }
		end
	end

	def show
		@category = Category.includes(:entries).find(params[:id])

		respond_to do |format|
			format.html
			format.json { render json: @category }
		end
	end

	def new
		@category = Category.new

		respond_to do |format|
			format.html
			format.json { render json: @category }
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def create
		@category = Category.new(params[:category])

		respond_to do |format|
			if @category.save
				format.html { redirect_to category_url(@category.id), notice: "New category was successfully created!" }
				format.json { render json: @category, status: :created, location: @entry }
			else
				format.html { render action: "new" }
				format.json { render json: @category.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@category = Category.find(params[:id])

		respond_to do |format|
			if @category.update_attributes(params[:category])
				format.html { redirect_to category_url(@category.id), notice: "Category was successfully updated!" }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @category.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy

		respond_to do |format|
			format.html { redirect_to categories_url }
			format.json { head :no_content }
			format.js
		end
	end
end