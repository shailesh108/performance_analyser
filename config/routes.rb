Rails.application.routes.draw do
	root 'home#index'

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
			get 'graph'
		end
	end

	resources :tests, except: [:show], path: 'test' do
		resources :questions, except: [:show], path: 'question' do
			collection do
				post 'import'
			end
		end
		member do
			get 'tests_graph/:id' => 'teachers#tests_graph', as: :tests_graph
		end
	end

	get 'admin/welcome'=> 'admins#welcome'
	get 'student/welcome'=> 'students#welcome'
	get 'teacher/welcome'=> 'teachers#welcome'

	post 'result/:id'=>'results#test_result',as: :result

	# get 'student/welcome/:id'=> 'students#welcome'
	# get 'student/resultdata'=> 'students#resultdata'
	# get 'student/compare'=> 'students#studentcompare'
	# post 'teacher/perfromance'=> 'teachers#studtestperformance'
	# get 'teacher/graph'=> 'teachers#graph'
	# get 'student/testlist'=>'tests#testslist'
	# get 'teacher/tests_graph/:id'=>'teachers#tests_graph',as: :tests_graph
end
