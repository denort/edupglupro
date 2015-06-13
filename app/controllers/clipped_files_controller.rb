class ClippedFilesController < ApplicationController
  before_action :set_clipped_file, only: [:show, :edit, :update, :destroy]

  # GET /clipped_files
  # GET /clipped_files.json
  # def index
  #   @clipped_files = ClippedFile.all
  # end

  # GET /clipped_files/1
  # GET /clipped_files/1.json
  def show
    #@clipped_file = ClippedFile.find_by_id(params[:clipped_file_id])
  end

  # GET /clipped_files/new
  def new
    @clipped_file = ClippedFile.new
  end

  # GET /clipped_files/1/edit
  # def edit
  # end

  # POST /clipped_files
  # POST /clipped_files.json
  def create

    uploaded_io = params[:clipped_file][:file]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
      @clipped_file = ClippedFile.new(name: uploaded_io.original_filename,
                                     lecture_id: params[:clipped_file][:lecture_id],
                                     content_type: uploaded_io.content_type)
    end
    respond_to do |format|
      if @clipped_file.save
        format.html { redirect_to lecture_path(params[:clipped_file][:lecture_id]), notice: 'Clipped file was successfully created.' }
        format.json { render :show, status: :created, location: lecture_path(params[:clipped_file][:lecture_id]) }
      else
        format.html { render :new }
        format.json { render json: @clipped_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clipped_files/1
  # PATCH/PUT /clipped_files/1.json
  # def update
  #   respond_to do |format|
  #     if @clipped_file.update(clipped_file_params)
  #       format.html { redirect_to @clipped_file, notice: 'Clipped file was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @clipped_file }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @clipped_file.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /clipped_files/1
  # DELETE /clipped_files/1.json
  def destroy
    @clipped_file.destroy
    respond_to do |format|
      format.html { redirect_to clipped_files_url, notice: 'Clipped file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clipped_file
      @clipped_file = ClippedFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clipped_file_params
      params.require(:clipped_file).permit(:name, :lecture_id)
    end
end
