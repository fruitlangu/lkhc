class ClimbController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @climb_pages, @climbs = paginate :climbs, :per_page => 10
  end

  def show
    @climb = Climb.find(params[:id])
  end

  def new
    @climb = Climb.new
  end

  def create
    @climb = Climb.new(params[:climb])
    if @climb.save
      flash[:notice] = 'Climb was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @climb = Climb.find(params[:id])
  end

  def update
    @climb = Climb.find(params[:id])
    if @climb.update_attributes(params[:climb])
      flash[:notice] = 'Climb was successfully updated.'
      redirect_to :action => 'show', :id => @climb
    else
      render :action => 'edit'
    end
  end

  def destroy
    Climb.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
