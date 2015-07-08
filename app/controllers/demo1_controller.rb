class Demo1Controller < ApplicationController
  def index
  	@user=User.all
  	render :json => @user
  end
  	def index
  	@doc=Doctor.all
  	render :json => @doc

  end
end
