Rails.application.routes.draw do

  
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resource :showcase do 
		collection do 
			get :school_showcase
		end
	end

	resources :students do 
		get :pay_fees_school
		post :pay_fees_school
		get :fee_details
		get :pay_fees_tutor
		post :pay_fees_tutor
		get :sale_book
		post :sale_book 
		get :schools
		get :apply_school
		post :apply_school
		get :teachers
		get :apply_teacher
		post :apply_teacher
		get :slots
	end

	resources :teachers do
		get :schools
		get :students
		get :apply_school
		post :apply_school
		get :find_student
		get :sale_notes
		get :create_sale_notes
		post :create_sale_notes
		get :update_sale_notes
		patch :update_sale_notes
		get :sale
		get :destroy_sale_notes
		get :slots
		get :create_slots
		post :create_slots
		get :update_slots
		patch :update_slots
		get :destroy_slot
		get :demo_videos
		get :create_demo_videos
		post :create_demo_videos
		get :update_demo_videos
		patch :update_demo_videos
		get :destroy_demo_video
		get :teacher_openings
	end

	resources :schools do
		get :teachers
		get :vendors
		get :students
		get :overview
		post :overview
		get :update_overview
		patch :update_overview
		get :courses
		get :course
		post :course
		get :update_course
		patch :update_course
		get :destroy_course
		get :scholarships
		get :scholarship
		post :scholarship
		get :update_scholarship
		patch :update_scholarship
		get :destroy_scholarship
		get :placements
		get :placement
		post :placement
		get :update_placement
		patch :update_placement
		get :destroy_placement
		get :cutoffs
		get :cutoff
		post :cutoff
		get :update_cutoff
		patch :update_cutoff
		get :destroy_cutoff
		get :campus
		get :campu
		post :campu
		get :update_campu
		patch :update_campu
		get :destroy_campu
		get	:schoolinformations
		get  :schoolinformation
		post :schoolinformation
		get :update_schoolinformation
		patch :update_schoolinformation
		get :destroy_schoolinformation
		get :schoolpictures
		get  :schoolpicture
		post :schoolpicture
		get :update_schoolpicture
		patch :update_schoolpicture
		get :destroy_schoolpicture
		get :schoolvideos
		get  :schoolvideo
		post :schoolvideo
		get :update_schoolvideo
		patch :update_schoolvideo
		get :destroy_schoolvideo
		get :post_requirements
		post :teacher_requirement
		post :vendor_requirement
	end

	resources :vendors do
		get :schools
		get :vendor_openings
		get :apply_school
		post :apply_school
	end

	root to: "users#index"
	devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks",
	 sessions: 'users/sessions' ,registrations: 'users/registrations',passwords: 'users/passwords'}
		devise_scope :user do 
			get '/users/login' => 'devise/sessions#new'
		    get '/users/register' => 'devise/registrations#new'
		    get '/users/sign_out' => 'devise/sessions#destroy'
		    #get '/users/:id/showcase' => 'users#showcase'
		end
	devise_for :admins, controllers: { sessions: 'admins/sessions'}
	devise_scope :admin do 
			get '/admins/login' => 'devise/sessions#new'
		    get '/admins/sign_out' => 'devise/sessions#destroy'
		    #get '/users/:id/showcase' => 'users#showcase'
		end
	resources :admins do 
		get :schools
		get :school_update
		patch :school_update
		get :teachers
		get :students
		get :vendors
		post :activate
		get :video_upload
		post :video_upload
	end
	  get 'users/search' 
	  post 'users/search'
	  get 'users/student_show'
	  get 'users/show'
	  get 'users/all_view'
	  post 'users/find_all_course_name'
	  get 'users/current_requirements'
	  get 'users/apply_to_post'
end
