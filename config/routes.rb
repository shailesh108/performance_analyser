Rails.application.routes.draw do
  root 'home#index'
  resources :students

    devise_for :admins,:skip => [:sessions]
    devise_scope :admin do
  
    get 'admin/welcome'=> 'admins/sessions#welcome'
    post 'admin/login/:resource' => 'admins/sessions#create',as: :session
    delete 'admin/logout' => 'admins/sessions#destroy', as: :destroy_admin_session
    get 'admin/login' => 'admins/sessions#new', as: :new_admin_session

  
  end

  devise_for :teachers,:skip => [:sessions,:registrations]
    devise_scope :teacher do
    get 'teacher/welcome'=> 'teachers/sessions#welcome'
    post 'teacher/login/:resource' => 'teachers/sessions#create',as: :teacher_session
    delete 'teacher/logout' => 'teachers/sessions#destroy', as: :destroy_teacher_session
    get 'teacher/login' => 'teachers/sessions#new', as: :new_teacher_session
    get 'admin/teacher/add'=>'teachers/registrations#new',as: :new_teacher_registration
    post 'admin/teacher/add/:resource'=>'teachers/registrations#create',as: :registration
  end

end
