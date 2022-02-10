class NoticeMailMailer < ApplicationMailer
    default from: ""

    #ここのアクション名が大事 mailのviewはview/notice_mail_mallerフォルダにアクション名.text.erbと記述
    def register_user_complete(user) 
        @user = user
        @url = "http://localhost"
        mail(
            from: 'サンプルアプリ制作委員会<aaa@gmail.com>', #fromはこのように書かないとだめ<>の中身は@gmail.comは必ずいる aaaは適当
            subject: "ユーザー登録完了のお知らせ" ,
            to: @user.email
        )
    end
end
