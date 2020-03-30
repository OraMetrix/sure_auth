class StuffController < ApplicationController
  before_action :login_required, only: :private

  def private; end

  def public; end
end
