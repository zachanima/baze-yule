module UsersHelper
  def attributes_for_import
    options = [:name, :username, :password, :department].collect do |attr|
      [attr, attr]
    end
    options_for_select(options.unshift(['', '']))
  end
end
