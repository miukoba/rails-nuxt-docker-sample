class Api::V1::HelloController < ApplicationController
  def index
    render json: "hello world! #{Time.zone.now}"
  end
end
