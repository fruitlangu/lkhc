class RiderController < Admin::AdminController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @rider_pages, @riders = paginate :riders, :per_page => 10
  end

  def show
    @rider = Rider.find(params[:id])
  end

  def new
    @rider = Rider.new
  end

  def create
    @rider = Rider.new(params[:rider])
    if @rider.save
      flash[:notice] = 'Rider was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @rider = Rider.find(params[:id])
  end

  def update
    @rider = Rider.find(params[:id])
    if @rider.update_attributes(params[:rider])
      flash[:notice] = 'Rider was successfully updated.'
      redirect_to :action => 'show', :id => @rider
    else
      render :action => 'edit'
    end
  end

  def destroy
    Rider.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
