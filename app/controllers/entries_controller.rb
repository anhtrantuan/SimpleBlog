class EntriesController < ApplicationController
	def index
		@entries = Entry.all

		respond_to do |format|
			format.html
			format.json { render json: @entries }
		end
	end

	def show
		@entry = Entry.find(params[:id])

		respond_to do |format|
			format.html
			format.json { render json: @entry }
		end
	end

	def new
		@entry = Entry.new

		respond_to do |format|
			format.html
			format.json { render json: @entry }
		end
	end

	def edit
		@entry = Entry.find(params[:id])
	end

	def create
		parameters = params[:entry]
		parameters[:published] = DateTime.current
		@entry = Entry.new(parameters)

		respond_to do |format|
			if @entry.save
				format.html { redirect_to @entry, notice: "New entry was successfully created!" }
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
				format.html { redirect_to @entry, notice: "Entry was successfully updated!" }
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
			format.html { redirect_to entries_url }
			format.json { head :no_content }
			format.js
		end
	end
end