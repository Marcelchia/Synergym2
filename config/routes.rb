
Rails.application.routes.draw do
  devise_for :users
  get 'onepage/index'
  root to: "onepage#index", as: 'home'

  get '/profile/:id', to: 'users#show', as: 'profile'
  get '/profile/:id/edit', to: 'users#edit', as: 'update_profile'
  patch '/profile/:id/edit', to: 'users#update', as: 'user'

  get '/aboutus' => 'companyprofiles#index' , as: 'aboutus'
  get '/contactus' => 'ourcontacts#index' ,  as: 'contactus'


  get '/workouts' => 'workouts#index', as: 'workouts'
  get '/workouts/new' => 'workouts#new', as: 'new_workout'
  post '/workouts' => 'workouts#create'
  get '/workout/:id/edit', to: 'workouts#edit', as: 'update_workout'
  patch '/workouts/:id', to: 'workouts#update'

  get '/workouts/:id' => 'workouts#show' , as: 'workout'
  delete '/workouts/:id' => 'workouts#destroy'




  get '/meals' => 'meals#index', as: 'meals'
  get '/meals/new' => 'meals#new', as: 'new_meal'
  post '/meals' => 'meals#create'

   get '/meal/:id/edit', to: 'meals#edit', as: 'update_meal'
  patch '/meals/:id', to: 'meals#update'

  get '/meals/:id' => 'meals#show' , as: 'meal'

  delete '/meals/:id' => 'meals#destroy'


  get '/tips' => 'tips#index', as: 'tips'






#   get '/meals/:id/bookings/new'=> 'bookings#new' ,as:'new_booking'
#   get '/meals/:id/edit' => 'meals#edit', as: 'edit_meal'
#   patch '/meals/:id' => 'meals#update'
#   delete '/meals/:id' => 'meals#destroy'


#   get '/users' => 'users#index', as: 'users'
#   get '/users/new' => 'users#new', as: 'new_user'
#   post '/users' => 'users#create'
#   get '/users/:id' => 'users#show' , as: 'user'
#   get '/users/:id/edit' => 'users#edit', as: 'edit_user'
#   patch '/users/:id' => 'users#update'
#   delete '/users/:id' => 'users#destroy'


#   get 'users/:id', to: 'users#show_profile'
#   get 'users/:id/edit', to: 'users#edit'
#   put 'profile', to: 'users#update', as: 'update_profile'
#   get 'dashboard', to: 'users#show_dashboard', as: 'dashboard'
#   get '/profile', to: 'users#show_profile', as: 'profile'







#   get '/bookings' => 'bookings#index', as: 'bookings'
#   post '/cars/:id/bookings' => 'bookings#create'
#   get '/bookings/:id' => 'bookings#show' , as: 'booking'
#   get '/bookings/:id/edit' => 'bookings#edit', as: 'edit_booking'
#   patch '/bookings/:id' => 'bookings#update'
#   delete '/bookings/:id' => 'bookings#destroy', as: 'return_booking'



#   get '/aboutus' => 'companyprofiles#index' , as: 'aboutus'

#   get '/contactus' => 'ourcontacts#index' ,  as: 'contactus'

# get '/customers/:customer_id/bookings' => 'bookings#index', as: 'bookings_customers'
# post '/bookings/:id' => 'bookings#update'
# #post '/customers/:customer_id/bookings' => 'bookings#update'

# end

#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end