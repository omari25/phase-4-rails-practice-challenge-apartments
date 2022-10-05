class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        lease = Lease.create!(lease_params)
        render json: lease
    end

    def destroy
        lease = Lease.find_by(id: params[:id])
        lease.destroy
        head :no_content
    end

    private

    def lease_params
        params.permit(:apartment_id, :tenant_id, :rent)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { erros: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
