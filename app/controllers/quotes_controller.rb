class QuotesController < ApplicationController
	def index
		@quote = Quote.order("RANDOM()").first
	end

	def new
		@quote = Quote.new
	end

	# Create a new quote using the parameters given in the form
	def create
		Quote.create(quote_params)
		redirect_to root_path
	end

	private

	def quote_params
		#permit - only allows these params to be saved
		params.require(:quote).permit(:saying, :author)
	end

end
