ActiveAdmin.register Candidate do
  permit_params :login, :display_name, :password, :password_confirmation, :email

  index do
    selectable_column
    id_column
    column :login
    column :display_name
    actions
  end
  
  before_build do |record|
    if !record.nil? && !record[:login].nil?
      byebug
      record.email = "#{record.login}@example.com"
      record.password = "password"
      record.password_confirmation = "password"
    end
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :login
      f.input :display_name
    end
    f.actions
  end

end
