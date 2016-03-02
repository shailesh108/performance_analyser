Rails.application.routes.draw do
	root 'home#index'

	devise_for :admins,:controllers => {:sessions => "admins/sessions"}, :path => 'admin', :path_names => { :sign_in => 'login', :sign_out => 'logout'}
	devise_for :teachers,:controllers => {:sessions => "teachers/sessions"}, :path => 'teacher', :path_names => { :sign_in => 'login', :sign_out => 'logout'}
	devise_for :students,:controllers => {:sessions => "students/sessions"}, :path => 'student', :path_names => { :sign_in => 'login', :sign_out => 'logout'}

	resources :teachers,except: [:index],path: 'admin/teacher' do
		collection do
			get 'list'
		end
	end

	resources :students,except: [:index],path: 'teacher/student' do
		collection do
			get 'list'
			get 'search'
			get 'starttest/:id'=>'students#starttest',as: :starttest
			post 'result/:id'=>'students#result',as: :result
		end
	end

	resources :tests, except: [:show], path: 'test' do
			resources :questions, except: [:show], path: 'question'do
			collection { post :import }
		end
	end

	get 'admin/welcome'=> 'admins#welcome'
	get 'student/welcome'=> 'students#welcome'
	get 'teacher/welcome'=> 'teachers#welcome'

end
