class ImportsController < ApplicationController
  include ImportsHelper
  def import
    @run = "запуск!"
  end
end
