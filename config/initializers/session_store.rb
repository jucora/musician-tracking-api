if Rails.env == "production"

    Rails.application.config.session_store :cookie_store, key: "_authentication_app", same_site: :strict, secure: true, domain: "https://musician-tracking-app.herokuapp.com/"
else
    Rails.application.config.session_store :cookie_store, key: "_authentication_app", same_site: :strict 

