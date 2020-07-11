Rails.application.routes.draw do
  devise_for :users
  # post '/authenticate', to: 'authentication#authenticate', as: 'authenticate'

  namespace :api do
    namespace :v1 do
      post '/login', to: 'authentication#authenticate', as: 'authenticate'
      post '/login_socmed', to: 'authentication#login_socmed', as: 'login_socmed'
      post '/register/doctor', to: 'registration#registration_doctor', as: 'registration_doctor'
      post '/register/patient', to: 'registration#registration_patient', as: 'registration_patient'
      get '/schedules', to: 'guest#active_schedules', as: 'schedule'
      get '/doctors', to: 'guest#active_doctors', as: 'doctors'
      get '/hospitals', to: 'guest#active_hospitals', as: 'hospitals'
      get '/doctor/appointments', to: 'doctor#appointments', as: 'appointments'
      post '/patient/make_appointment', to: 'patient#make_appointment', as: 'make_appointment'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
