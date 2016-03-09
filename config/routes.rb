Rails.application.routes.draw do
 
  get "logout" => "sessions#destroy", :as => "logout"
	get "login" => "sessions#new", :as => "login"
	get "signup" => "students#new", :as => "signup"
	root 'home#index'
	resources :students
	resources :sessions
	resources :password_resets

	devise_for :admins,:controllers => {:sessions => "admins/sessions"}, :path => 'admin', :path_names => { :sign_in => 'login', :sign_out => 'logout'}
	devise_for :teachers,:controllers => {:sessions => "teachers/sessions"}, :path => 'teacher', :path_names => { :sign_in => 'login', :sign_out => 'logout'}
	devise_for :students,:controllers => {:sessions => "students/sessions"}, :path => 'student', :path_names => { :sign_in => 'login', :sign_out => 'logout'}

	resources :teachers,except: [:index],path: 'admin/teacher' do
		collection do
			get 'list'
			get 'search'
			get "search_result" => 'teachers#search_result'
	
		end		
		member do
			get 'assign'
			post 'assign' => 'teachers#assign_teacher'
			delete "assign/:assigned_id" => 'teachers#delete_assignment',as: :delete_assigned				
		end
	end

	resources :students,except: [:index],path: 'teacher/student' do
		collection do
			get 'list'
			get 'search'
			get 'starttest/:id'=>'students#starttest',as: :starttest
			
		end
	end
post 'result/:id'=>'results#test_result',as: :result

	resources :tests, except: [:show], path: 'test' do
		resources :questions, except: [:show], path: 'question' do
		collection { post :import }
		end
	end

	get 'admin/welcome'=> 'admins#welcome'
	get 'student/welcome'=> 'students#welcome'
	get 'teacher/welcome'=> 'teachers#welcome'
end
