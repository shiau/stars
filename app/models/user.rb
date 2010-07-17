require 'digest/sha1'

class User < ActiveRecord::Base
  acts_as_authentic

  has_many :stars, :foreign_key => :to_id

  named_scope :active, :conditions => {:active => true}

  def self.by_recent_stars
    User.all.sort_by do |user|
      star = user.most_recent_star
      (star.created_at if star).to_i
    end.reverse
  end

  def most_recent_star
    stars.recent.first
  end

  def others
    User.active.all(:conditions => ["`users`.`id` != ?", self.id])
  end

=begin
  def valid_password?( p )
    self.crypted_password  == encrypt( p ) 
  end

  def password=( pw )
    @password = pw
  end

  def password
    @password
  end
  
  def encrypt( s )
    Digest::SHA1.hexdigest( s.chomp.downcase )
  end

  before_save :encrypt_password!

  def encrypt_password!
    self.crypted_password = encrypt( @password ) if @password 
  end
=end
end
