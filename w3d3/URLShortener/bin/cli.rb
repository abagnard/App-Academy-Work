class CLI

  def initialize(user_id = nil)
    @user_id = user_id
  end

  def get_email
    puts "Input your email:"
    user_email = gets.chomp
    @user_id = User.where({email: user_email}).first.id
  end

  def get_action
    puts "What do you want to do?
            0. Create shortened URL
            1. Visit shortened URL
            2. Exit"

    gets.chomp
  end

  def create_shortened_url

    puts "Type in your long url"
    long_url = gets.chomp

    short_url = ShortenedUrl.create_for_user_and_long_url!(@user_id, long_url).short_url

    puts "Short url is: #{short_url}"

  end

  def visit_shortened_url

    puts "Type in the shortened URL"
    short_url = gets.chomp

    long_url = ShortenedUrl.where({short_url: short_url}).first
    url_id = long_url.id

    puts "Launching #{long_url.long_url}"

    Launchy.open( long_url.long_url )
    Visit.create!({visitor_id: @user_id, url_id: url_id})

  end

  def run_cli

    get_email
    action = 0

    while action != 2
      action = get_action.to_i

      create_shortened_url if action == 0
      visit_shortened_url if action == 1
      puts "invalid action" unless (0..2).to_a.include?(action)
    end

    puts "Goodbye!"
  end

end


CLI.new.run_cli
