class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@dev-reply.aircheck.io'
  #default :"Message-ID" => lambda {"<#{SecureRandom.uuid}@example.org>"}
  layout 'mailer'
end
