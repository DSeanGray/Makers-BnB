def sign_up
  visit '/'
  fill_in :email, with: 'MrT@a.team.com'
  fill_in :username, with: 'pitythefool'
  fill_in :password, with: 'snickers'
  fill_in :password_confirmation, with: 'snickers'
  click_button 'Sign Up'
end

def sign_up_with_nil_email
  visit '/'
  fill_in :email, with: nil
  fill_in :username, with: 'example'
  fill_in :password, with: 'example'
  fill_in :password_confirmation, with: 'example'
  click_button 'Sign Up'
end

def sign_up_with_invalid_email
  visit '/'
  fill_in :email, with: 'i23rf9dfoi34'
  fill_in :username, with: 'example'
  fill_in :password, with: 'example'
  fill_in :password_confirmation, with: 'example'
  click_button 'Sign Up'
end

def sign_up_with_invalid_password_confirmation
  visit '/'
  fill_in :email, with: 'MrT@a.team.com'
  fill_in :username, with: 'example'
  fill_in :password, with: 'example'
  fill_in :password_confirmation, with: 'doggo'
  click_button 'Sign Up'
end
