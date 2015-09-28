class QuotesController < ApplicationController
	def index
		@quote = Quote.order("RANDOM()").first
	end

	def new
		@quote = Quote.new
	end

	# Create a new quote using the parameters given in the form
	def create
		@quote = Quote.create(quote_params)
		if @quote.invalid?
			flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
		end
		redirect_to root_path
	end

	private

	def quote_params
		#permit - only allows these params to be saved
		params.require(:quote).permit(:saying, :author)
	end

end
