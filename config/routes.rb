
Rails.application.routes.draw do
  root 'home#index'
  
   get 'student/welcome'=> 'students#welcome'
    
    devise_for :admins,:skip => [:sessions]
    devise_scope :admin do  
    get 'admin/welcome'=> 'admins/sessions#welcome'
    post 'admin/login/:resource' => 'admins/sessions#create',as: :session
    delete 'admin/logout' => 'admins/sessions#destroy', as: :destroy_admin_session
    get 'admin/login' => 'admins/sessions#new', as: :new_admin_session
    get 'admin/teacher/edit/:id'=>'teachers#edit' ,as: :edit_teacher
    patch 'admin/teacher/update/:id'=>'teachers#update' ,as: :update_teacher
    delete 'admin/teacher/delete/:id'=>'teachers#destroy' ,as: :delete_teacher
    
  end

  devise_for :teachers,:skip => [:sessions,:registrations]
    devise_scope :teacher do
        get 'teacher/welcome'=> 'teachers/sessions#welcome'
        post 'teacher/login/:resource' => 'teachers/sessions#create',as: :teacher_session
        delete 'teacher/logout' => 'teachers/sessions#destroy', as: :destroy_teacher_session
        get 'teacher/login' => 'teachers/sessions#new', as: :new_teacher_session
        get 'admin/teacher/add'=>'teachers/registrations#new',as: :new_teacher_registration
        post 'admin/teacher/add/:resource'=>'teachers/registrations#create',as: :registration

        get 'teacher/student/list'=>'students#list',as: :list_student
        get 'teacher/student/edit/:id'=>'students#edit',as: :edit_student
        patch 'teacher/student/edit/:id'=>'students#update',as: :update_student
        delete 'teacher/student/delete/:id'=>'students#destroy',as: :delete_student
 
    end

   devise_for :students,:skip => [:sessions,:registrations]
    devise_scope :student do
    post 'student/login/:resource' => 'students/sessions#create',as: :student_session
    delete 'student/logout' => 'students/sessions#destroy', as: :destroy_student_session
    get 'student/login' => 'students/sessions#new', as: :new_student_session
    get 'teacher/student/add'=>'students/registrations#new',as: :new_student_registration
    post 'teacher/student/add/:resource'=>'students/registrations#create',as: :student_registration
    
  end
end
