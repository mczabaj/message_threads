Rails.application.routes.draw do
  root 'message_threads#index'

  resources :message_threads do
    resources :messages

    # collection do
    #   get '/:id/messages' => 'messages#index', as: 'thread_messages'
    #   get '/:id/messages/:id' => 'messages#show', as: 'thread_message'
    # end
  end

  resources :users

end
