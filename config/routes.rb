Rails.application.routes.draw do
<<<<<<< HEAD
    root 'home#index'
     devise_for :admins, :skip => [:sessions]
     devise_scope :admin do
      post 'admins/login/:resource' => 'devise/sessions#create',as: :session
      delete '/logout' => 'devise/sessions#destroy', as: :destroy_admin_session
      get '/login' => 'devise/sessions#new', as: :new_admin_session
      resources :students
    end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
=======
  root 'home#index'

    devise_for :admins,:skip => [:sessions]
    devise_scope :admin do
  
    get 'admin/welcome'=> 'admins/sessions#welcome'
    post 'admin/login/:resource' => 'admins/sessions#create',as: :session
    delete 'admin/logout' => 'admins/sessions#destroy', as: :destroy_admin_session
    get 'admin/login' => 'admins/sessions#new', as: :new_admin_session
  end

  devise_for :teachers,:skip => [:sessions]
    devise_scope :teacher do
    get 'teacher/welcome'=> 'teachers/sessions#welcome'
    post 'teacher/login/:resource' => 'teachers/sessions#create',as: :teacher_session
    delete 'teacher/logout' => 'teachers/sessions#destroy', as: :destroy_teacher_session
    get 'teacher/login' => 'teachers/sessions#new', as: :new_teacher_session
  end
>>>>>>> teachermodel

end
