class DiaryEntriesController < ApplicationController

	def index
		if params[:date]
			@date = params[:date].to_date.to_time_in_current_zone
		else
			@date = Time.zone.now
		end
		@diary_entries = DiaryEntry.where(created_at: @date.beginning_of_day..@date.end_of_day)

		@diary_entry_month = DiaryEntry.where(created_at: @date.beginning_of_month..@date.end_of_month).map do |d|
			d.created_at.to_date
		end
	end

	def new
		@diary_entry = DiaryEntry.new
		
	end

	def create
		@diary_entry = DiaryEntry.new params[:diary_entry]

		if @diary_entry.save
		redirect_to diary_entries_path
		else 
			render :new
		end
	end

	def edit
    	@diary_entry = DiaryEntry.find(params[:id])
  	end

  	def update
  		@diary_entry = DiaryEntry.find(params[:id])

  		if @diary_entry.update_attributes params[:diary_entry]
  		   redirect_to diary_entries_path
  		else
  		   render :edit
  		end
  	end

  	def destroy
  		@diary_entry = DiaryEntry.find(params[:id])
  		@diary_entry.destroy
  	end

end
