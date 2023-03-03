class DocumentationController < ApplicationController
  skip_before_action :authenticate_request

  def index; end

  def authentication; end
  
  def users; end
  
  def cars; end

  def reservations; end
end
