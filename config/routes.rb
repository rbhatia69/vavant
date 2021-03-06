Vavant::Application.routes.draw do
  resources :materials

  mount Ckeditor::Engine => '/ckeditor'

  mount Ckeditor::Engine => "/ckeditor"

  get "courses/authored" => 'courses#authored', :as => 'courses_authored'
  get "courses/registered" => 'courses#registered', :as => 'courses_registered'

  get "courses/register/:course_id" => 'courses#register', :as => 'courses_register'
  get "courses/showdetail/:course_id" => 'courses#showdetail', :as => 'courses_showdetail'
  get "courses/changestatus" => 'courses#changestatus', :as => 'courses_changestatus'
  get "courses/mark_complete/:course_id" => 'courses#mark_complete', :as => 'courses_mark_complete'
  get "courses/mark_incomplete/:course_id" => 'courses#mark_incomplete', :as => 'courses_mark_incomplete'

  get "tags/:tag" => 'home#index', :as => 'tag'

  get "lessons/associate_material" => 'lessons#associate_material', :as => 'lessons_associate_material'
  get "lessons/mark_complete/" => 'lessons#mark_complete', :as => 'lessons_mark_complete'
  get "lessons/mark_incomplete/" => 'lessons#mark_incomplete', :as => 'lessons_mark_incomplete'
  get "lessons/display_lesson" => 'lessons#display_lesson', :as => 'lessons_display_lesson'

  resources :courses

  resources :reviews

  resources :registrations

  resources :lessons

  resources :collections

  resources :languages

  devise_for :users

  root :to => 'home#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  get "home/userinfo" => 'home#userinfo', :as => 'home_userinfo'
end
