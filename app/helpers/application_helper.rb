require 'digest'
module ApplicationHelper
  FRIENDLY_TIME_FORMAT = '%H:%M%p on %b %d'
  def friendly_time(time)
    time.getlocal.strftime(FRIENDLY_TIME_FORMAT).
         gsub(/(\s|^)0/, '\\1').
         sub('AM', 'am').
         sub('PM', 'pm')
  end

  DEFAULT_NAME_OPTIONS = {:firstnameonly => true,
                          :linked => false,
                          :useyou => false}
  def default_name_options(user)
    DEFAULT_NAME_OPTIONS.merge(:ifcantsee => user.name.split.first)
  end

  def name(user, opts={})
    user.name
  end

  def linked_name(user, opts={})
    link_to name(user, opts), user_url(user)
  end

  DEFAULT_PHOTO_OPTIONS = {:linked => false,
                           :size => :square}
  def photo(user, opts={})
    if user.facebook_uid then
      fb_profile_pic(user.facebook_uid, DEFAULT_PHOTO_OPTIONS.merge(opts))
    else
      hash = Digest::MD5.hexdigest(user.email.strip.downcase)
      gravatar_url = "http://www.gravatar.com/avatar/" + hash + "?s=48"
      image_tag( gravatar_url )
    end
  end

  def linked_photo(user, opts={})
    link_to photo(user, opts), user_url(user)
  end

  def stylesheet(path)
    @stylesheets << path
  end
end
