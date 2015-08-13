module BusinessHelper
  #@last_group_of_featured = [] 
  def format_id(string)
    string.match(/\d/)
  end

  # def get_last_featured(a_business)
  #   if @last_group_of_featured.length >= 3
  #     @last_group_of_featured.shift
  #     @last_group_of_featured << a_business if a_business.featured == true
  #   else
  #     @last_group_of_featured << a_business if a_business.featured == true
  #   end
  # end

  # def return_last_featured
  #   return @last_group_of_featured
  # end
  
end