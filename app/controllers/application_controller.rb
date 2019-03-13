class ApplicationController < ActionController::Base
  layout "landing"

# ajout des quatres alertes principale en bootstrap (3autres manquantes)
  add_flash_types :danger, :info, :warning, :success

end
