class BackofficeController < ApplicationController
before_action :conta_radmin
layout 'backoffice'

def index
end

def newsletter
  Newsletter.newsletter
  redirect_to backhome_path
end

end
