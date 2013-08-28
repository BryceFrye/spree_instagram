module SpreeInstagram
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :auto_run_migrations, :type => :boolean, :default => false

      def add_javascripts
        append_file 'app/assets/javascripts/store/all.js', "\n//= require store/spree_instagram\n"
        append_file 'app/assets/javascripts/admin/all.js', "\n//= require admin/spree_instagram\n"
      end

      def add_stylesheets
        store_ext = File.exists?("app/assets/stylesheets/store/all.css") ? ".css" : ".css.scss"
        admin_ext = File.exists?("app/assets/stylesheets/admin/all.css") ? ".css" : ".css.scss"
        inject_into_file "app/assets/stylesheets/store/all#{store_ext}", " *= require store/spree_instagram\n", :after => "*= require_tree .", :verbose => true
        inject_into_file "app/assets/stylesheets/admin/all#{admin_ext}", " *= require admin/spree_instagram\n", :after => "*= require_tree .", :verbose => true
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_instagram'
      end

      def run_migrations
        run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
        if run_migrations
          run 'bundle exec rake db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end
    end
  end
end
