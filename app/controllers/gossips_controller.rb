class GossipsController < ApplicationController

	def index
		@gossip = Gossip.all
	end

  def new
  	@gossip = Gossip.new
  end

  def create
     @gossip = Gossip.create(gossip_params)
      redirect_to gossip_path(@gossip.id)
  end

  def edit
  	@gossip = Gossip.find(params[:id])
  end

  def update
  	@gossip = Gossip.find(params[:id])

  	if @gossip.update(gossip_params)
    redirect_to @gossip
  	else
    	render 'edit'
  	end
	end

	def destroy
		@gossip = Gossip.find(params[:id])
  	@gossip.destroy
 
  	redirect_to gossips_path
	end

  def show
  	 @gossip = Gossip.find(params[:id])
  end


  private
    def gossip_params
        params.require(:gossip).permit(:anonymous_author, :content)
    end


end
