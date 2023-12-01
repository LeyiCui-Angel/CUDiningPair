class UserMailer < ApplicationMailer
    require 'sendgrid-ruby'
    include SendGrid
  
    def send_email(to_email, subject, content_value)
      from = Email.new(email: 'cudiningpair@gmail.com')
      to = Email.new(email: to_email)
      content = Content.new(type: 'text/plain', value: content_value)
      mail = Mail.new(from, subject, to, content)
  
      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
  
      # Optionally, you can log the response or handle it as needed
      puts response.status_code
      puts response.body
      puts response.headers
    end
  end
  