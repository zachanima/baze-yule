module UsersHelper
  def attributes_for_import
    array_for_select([:name, :username, :password, :department])
  end

  def transforms_for_import
    array_for_select([:upcase, :downcase, :titleize])
  end 
end
