resouce :users do
    resouce :tweets, only: [:new,:create]
end

get "tweets/index"

