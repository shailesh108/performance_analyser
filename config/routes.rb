Rails.application.routes.draw do

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

   devise_for :students,:skip => [:sessions,:registrations]
    devise_scope :student do
    get 'student/welcome'=> 'students/sessions#welcome'
    post 'student/login/:resource' => 'students/sessions#create',as: :student_session
    delete 'student/logout' => 'students/sessions#destroy', as: :destroy_student_session
    get 'student/login' => 'students/sessions#new', as: :new_student_session
     get 'teacher/student/add'=>'students/registrations#new',as: :new_student_registration
    post 'teacher/student/add/:resource'=>'students/registrations#create',as: :student_registration
  end
end
