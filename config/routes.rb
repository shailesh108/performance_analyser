Rails.application.routes.draw do
	root 'home#index'

	devise_for :admins,:controllers => {:sessions => "admins/sessions"}, :path => 'admin', :path_names => { :sign_in => 'login', :sign_out => 'logout'}
	devise_for :teachers,:controllers => {:sessions => "teachers/sessions"}, :path => 'teacher', :path_names => { :sign_in => 'login', :sign_out => 'logout'}
	devise_for :students,:controllers => {:sessions => "students/sessions"}, :path => 'student', :path_names => { :sign_in => 'login', :sign_out => 'logout'}

	resources :tests 
    resources :questions

	resources :teachers,except: [:index],path: 'admin/teacher' do
		collection do
			get 'list'
		end
	end

	resources :students,except: [:index],path: 'teacher/student' do
		collection do
			get 'list'
		end
	end

	get 'admin/welcome'=> 'admins#welcome'
	get 'student/welcome'=> 'students#welcome'
	get 'teacher/welcome'=> 'teachers#welcome'
  get 'test/question/add'=>'questions#new'
end
