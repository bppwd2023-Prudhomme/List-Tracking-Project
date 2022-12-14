class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy share]

  # GET /lists or /lists.json
  def index
    @lists = List.where("user_id == ? AND archived == ?", current_user.id, false)
    puts "\n\n\n\n\n\n"
    current_user.lists.each do |list|
      puts list.id
    end
    puts "\n\n\n\n\n\n"

  end

  # GET /lists/1 or /lists/1.json
  def show
    @items = []
    @temp = @list.items
    if params[:sort] != nil
      if params[:sort] == "i"
        @temp.where(important: true).each do |item|
          @items << item
        end
        @temp.where(important: false).each do |item|
          @items << item
        end
      elsif params[:sort] == "d"
        @length = @temp.length()-1
        for a in 0..@length do
          @early = @temp[0]
          @temp.each do |item|
            if (@items.include?(@early)) or (item.deadline < @early.deadline and !@items.include?(item))
              @early = item
            end 
          end 
          @items << @early
        end 
      end
    else
      @items = @list.items 
    end  
  end 

  # GET /lists/new
  def new
    @list = List.new
    @sections = Section.where(user_id: current_user.id)
  end

  # GET /lists/1/edit
  def edit
    @sections = Section.where(user_id: current_user.id)
    authorize @list
  end

  def shared
    #@lists = List.where.not(user_id: current_user.id)
    @lists = []
    current_user.permissions.each do |permission|
      puts "\n\n\n\n\n\n"
      puts permission
      puts "\n\n\n\n\n"
    end
  end

  def share
  end

  def archive
    @lists = List.where(archived: true)
  end

  # POST /lists or /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to list_url(@list), notice: "List was successfully created." }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
        puts params
        puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
        format.html { redirect_to list_url(@list), notice: "List was successfully updated." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_url, notice: "List was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
      if(@list.user.id != current_user.id)
        authorize @list
      end
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:user_id, :section_id, :title, :archived, :sort)
    end
end
