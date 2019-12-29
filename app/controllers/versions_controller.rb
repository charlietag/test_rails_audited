class VersionsController < ApplicationController
  #before_action :set_version, only: [:show, :edit, :update, :destroy]
  before_action :set_version, only: [:rollback]

  # GET /versions/:id/rollback(.:format)
  def rollback
    

    respond_to do |format|
      if @version.revision.save
        format.html { redirect_to @version.revision, notice: 'Version was successfully restored.' }
      else
        format.html { redirect_to @version.revision, warning: 'Rollback Failed.' }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_version
      @version = Audited::Audit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def version_params
    #  params.require(:version).permit(:name, :author, :year)
    #end
end
