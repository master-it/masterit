Configus.build Rails.env do
  env :production do
    admin do
      email 'admin@admin.ru'
      password 'admin@admin.ru'
      role 'admin'
    end

    facebook do
      app_id '331201187000748'
      app_secret '7799c1fef2caeab6be745a60e5387f98'
    end

    google_oauth2 do
      app_id '209775191585.apps.googleusercontent.com' 
      app_secret 'sUfIfhz67EEiTn5onHqR3AVM'
    end

    twitter do 
      app_id  'zDz7Ir4sy1ZpMVUwAzm0eg' 
      app_secret '7Oc2PHHqX4lnbGwmiJLQdTPkNxnDBNdNDWNCzgaPjg'
    end

    vkontakte do
      app_id '3419036'
      app_secret 'ehQDNhqslXfd5RnhZm2r'
    end

    mailer do
      default_host "masterit.ru"
      default_from "noreplay@masterit.ru"
    end

  end

  env :development, parent: :production do
  end

  env :test, parent: :production do
  end

  env :staging, parent: :production do
  end

end