class User < ApplicationRecord
    attr_accessor :activation_token #仮想的にカラムをつくる
    mount_uploader :avator, AvatarUploader
end
