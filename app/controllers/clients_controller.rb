class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def show
        client = Client.find(params[:id])
        render json: client, methods: [:membership_total], status: :ok
    end

    def update
        client = Client.find(params[:id])
        client.update!(client_params)
        render json: client, status: :accepted
    end

    private

    def client_params
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: {error: "Client not found"}, status: :not_found
    end

end
