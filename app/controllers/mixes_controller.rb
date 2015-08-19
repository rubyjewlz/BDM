class MixesController < ApplicationController

	def index
		@mixes = Mixes.all
end

def show
	@mixes = Mixes.find(params[:id])
end

def new
	@mixes = Mixes.new
end

def edit
	@mixes = Mixes.find(params[:id])
end

def create
	@mixes = Mixes.new(mixes_params)

	if @mixes.save
		redirect to @mixes
	else
		render 'new'
	end
end

def update
	@mixes = Mixes.find(params[:id])

	if @mixes.update(mixes_params)
		redirect_to @mixes
	else
		render 'edit'
	end
end

def destroy
	@mixes = Mixes.find(params[:id])
	@mixes.destroy

	redirect_to mixes_path
end

private
def mixes_params
	params.require(:mixes).permit(:title, :text)
end
end