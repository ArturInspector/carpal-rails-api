class OpenapiController < ApplicationController
  DOCUMENT_PATH = Rails.root.join("config/openapi.yml")

  def show
    render json: YAML.safe_load_file(DOCUMENT_PATH, aliases: true)
  end
end
