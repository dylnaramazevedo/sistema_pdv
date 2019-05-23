RailsAdmin.config do |config|


  config.main_app_name = ["Sistema PDV", ""]

  # == adiciona links ao menu lATERAL ==
      #config.navigation_static_links = {
      #  'OneBitCode' => 'https://onebitcode.com'
      #}
      #
      #config.navigation_static_label = "Lins Úteis"

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true



config.model Sale do
   navigation_icon 'fa fa-money'
  create do
    field  :client
    field  :sale_date
    field  :discount
    field  :notes
    field  :product_quantities
 
    field :user_id, :hidden do
      default_value do
        bindings[:view]._current_user.id
      end
    end
  end
 
  edit do
    field  :client
    field  :sale_date
    field  :discount
    field  :notes
    field  :product_quantities
 
    field :user_id, :hidden do
      default_value do
        bindings[:view]._current_user.id
      end
    end
  end
end

config.model User do
  create do
    field  :name
    field  :document
    field  :kind
    field  :status
    field  :notes
  end
 
  edit do
    field  :name
    field  :document
    field  :kind
    field  :status
    field  :notes
  end
end

config.model Product do
  create do
    field  :name
    field  :description
    field  :status
    field  :price
    field  :photo
  end
 
  edit do
    field  :name
    field  :description
    field  :status
    field  :price
    field  :photo
  end
end
 
config.model Client do
  create do
    field  :name
    field  :company_name
    field  :document
    field  :email
    field  :phone
    field  :notes
    field  :status
    field  :address
 
    field :user_id, :hidden do
      default_value do
        bindings[:view]._current_user.id
      end
    end
  end
 
  edit do
    field  :name
    field  :company_name
    field  :document
    field  :email
    field  :phone
    field  :notes
    field  :status
    field  :address
 
 
    field :user_id, :hidden do
      default_value do
        bindings[:view]._current_user.id
      end
    end
  end
 
  list do
    field  :name
    field  :company_name
    #field  :document
    #field  :email
    field  :phone
    field  :notes
    field  :status
    #field  :address
 
  end
end

config.model ProductQuantity do
  edit do
    field :product
    field :quantity
 
    field :user_id, :hidden do
      default_value do
        bindings[:view]._current_user.id
      end
    end
  end
end
 
# Faz desaparecer do menu lateral e
#------ Ordena o menu lateral --------
 
config.model Client do
  parent User
  weight -4
end

config.model Product do
  parent User
  weight -3
end

config.model Discount do
  parent User
  weight -2
end

config.model Sale do
  parent User
  weight -1
end
 
config.model Comission do
  parent User
end
 
config.model ProductQuantity do
  visible false
end
 
config.model Address do
  visible false
end

#------------------------------

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
