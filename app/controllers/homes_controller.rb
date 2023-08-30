class HomesController < ApplicationController
 def about
 end
 
 def top
   @user=current_user
 end
end

