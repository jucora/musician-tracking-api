if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "_authentication_app", same_site: :strict, secure: true, domain: "https://musician-tracking-app.herokuapp.com/"
    Rails.application.config.session_store :cookie_store, key: "_session_id", same_site: :lax, secure: true, domain: "https://musician-tracking-app.herokuapp.com/"
else
    Rails.application.config.session_store :cookie_store, key: "_authentication_app", same_site: :strict, secure: true
    Rails.application.config.session_store :cookie_store, key: "_session_id", same_site: :lax, secure: true
end