class ContactMailer < ApplicationMailer

	def send_when_admin_reply(user, contact, reply) #メソッドに対して引数を設定
    @user = user #ユーザー情報
    @answer = reply.body #返信内容
    mail to: @user.email, subject: "【りんごCD】#{reply.title}"
  end

end
