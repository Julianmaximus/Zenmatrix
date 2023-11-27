class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
  end

  def about
  end

  def terms
  end

  def privacy_policy
  end

  def horoscope
  end
end
