class SeriesController < Admin::AdminController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @series_pages, @series = paginate :series, :per_page => 10
  end

  def show
    @series = Series.find(params[:id])
  end

  def new
    @series = Series.new
  end

  def create
    @series = Series.new(params[:series])
    if @series.save
      flash[:notice] = 'Series was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @series = Series.find(params[:id])
  end

  def update
    @series = Series.find(params[:id])
    if @series.update_attributes(params[:series])
      flash[:notice] = 'Series was successfully updated.'
      redirect_to :action => 'show', :id => @series
    else
      render :action => 'edit'
    end
  end

  def destroy
    Series.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
