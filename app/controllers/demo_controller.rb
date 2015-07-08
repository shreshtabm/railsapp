class DemoController < ApplicationController

layout false

  def index
  	@number=5
  	@user=User.all
  end
end
