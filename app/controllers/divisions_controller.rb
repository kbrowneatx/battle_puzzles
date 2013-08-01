class DivisionsController < ApplicationController
  before_filter :find_division, except: [:index, :new, :create]
  before_filter :set_current_user
  respond_to :html, :js
	
  def index
		@divisions = @army.divisions
  end

  def show
    @type_names_array = UnitType.where('nation_id == ?', @division.army.nation_id).pluck(:name)
    @type_pics_array = UnitType.where('nation_id == ?', @division.army.nation_id).pluck(:img_name)		
  end

  def new
    @division = @army.divisions.new
    (@army.battalions_allowed).times { division.battalions.build }
	end
	
  def create
	  @division = @army.divisions.new(params[:division])
    if @division.save
      redirect_to @division
    else
      render :edit
    end 
  end

  def edit
    if @division.battalions.count == 0 
      (@division.army.battalions_allowed).times { @division.battalions.build }
    end
    @type_names_array = UnitType.where('nation_id == ?', @division.army.nation_id).pluck(:name)
	end

  def update
    if @division.update_attributes(params[:division])
      redirect_to @division
    else
      render :edit
    end	
  end

  def destroy
    if @division.destroy
      @divisions = @army.divisions
      respond_to do |format|
        format.js {}
      end
    else
      redirect_to @division, error: "Error deleting Division. Try again or contact game administrator"
    end	
  end
	
	def find_division
    @division = Division.find(params[:id])
  end
end
