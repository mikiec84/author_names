namespace :authornames do
  desc "Add the default superadmin"
  task :default_superadmin => :environment do
    user = User.new(:username => 'superadmin', :email => 'superadmin@example.com', :first_name => 'Super', :last_name => 'Admin')
    if %w[development test dev local].include?(Rails.env)
      user.password = "12345678"
    else
      user.password = User.random_password
    end
    user.superadmin = true
    user.save
    puts "Super Admin email is: #{user.username}"
    puts "Super Admin password is: #{user.password}"
  end
  
  desc "Add the test accounts"
  task :default_libadmin => :environment do
    if %w[development dev local].include?(Rails.env)
      user = User.new(:username => 'libadmin', :email => 'libadmin@example.com', :first_name => 'Library', :last_name => 'Admin')
      user.password = "12345678"
    end
    user.library = Library.first
    user.admin = true
    user.save
    puts "Lib Admin email is: #{user.username}"
    puts "Lib Admin password is: #{user.password}"
  end
  task :default_libstaff => :environment do
    if %w[development dev local].include?(Rails.env)
      user = User.new(:username => 'libstaff', :email => 'libstaff@example.com', :first_name => 'Library', :last_name => 'Staff')
      user.password = "12345678"
    end
    user.library = Library.first
    user.staff = true
    user.save
    puts "Lib Staff email is: #{user.username}"
    puts "Lib Staff password is: #{user.password}"
  end
  task :default_pubadmin => :environment do
    if %w[development dev local].include?(Rails.env)
      user = User.new(:username => 'pubadmin', :email => 'pubadmin@example.com', :first_name => 'Publisher', :last_name => 'Admin')
      user.password = "12345678"
    end
    user.publisher = Publisher.first
    user.admin = true
    user.save
    puts "Pub Admin email is: #{user.username}"
    puts "Pub Admin password is: #{user.password}"
  end
  task :default_pubstaff => :environment do
    if %w[development dev local].include?(Rails.env)
      user = User.new(:username => 'pubstaff', :email => 'pubstaff@example.com', :first_name => 'Publisher', :last_name => 'Staff')
      user.password = "12345678"
    end
    user.publisher = Publisher.first
    user.staff = true
    user.save
    puts "Pub Staff email is: #{user.username}"
    puts "Pub Staff password is: #{user.password}"
  end
  task :default_author => :environment do
    if %w[development dev local].include?(Rails.env)
      user = User.new(:username => 'author', :email => 'author@example.com', :first_name => 'Author', :last_name => 'User')
      user.password = "12345678"
    end
    user.save
    puts "Author email is: #{user.username}"
    puts "Author password is: #{user.password}"
  end
  
  desc "Add the default libraries"
  task :default_libraries => :environment do
    ['Widener', 'Houghton', 'Fine Arts'].each do |library|
      library = Library.new(:name => library, :contact_name => "Default Contact", :phone => "XXX-XXX-XXXX", :email => "contact@example.com", :address_1 => "1 Smart Lane", :city => "Boston", :state => "MA", :postal_code => "02111", :country => "US")
      library.save
    end
    puts "Libraries Added!"
  end
  
  desc "Add the default publishers"
  task :default_publishers => :environment do
    ['Tupelo', 'Harvard', 'MIT'].each do |publisher|
      publisher = Publisher.new(:name => publisher, :contact_name => "Default Contact", :phone => "XXX-XXX-XXXX", :email => "contact@example.com", :address_1 => "1 Smart Lane", :city => "Boston", :state => "MA", :postal_code => "02111", :country => "US")
      publisher.save
    end
    puts "Publishers Added!"
  end
  
  desc "run all tasks in bootstrap"
  task :run_all => [:default_superadmin, :default_libadmin, :default_libstaff, :default_pubadmin, :default_pubstaff, :default_libraries, :default_publishers] do
    puts "Created Admin account, Repos, Locations and Rooms!"
  end
end    