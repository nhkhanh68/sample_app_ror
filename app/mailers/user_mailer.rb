class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("pls_act_acc")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("password_reset")
  end
end
