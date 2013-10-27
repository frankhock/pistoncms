module Pistoncms
  module Generators
    module Migrations

      def run_migrations
        migrations = [  ['create_entries.rb', 'db/migrate/create_pistoncms_entries.rb'],
                        ['create_friendly_id_slugs.rb', 'db/migrate/create_friendly_id_slugs.rb'],
                        ['create_menus.rb', 'db/migrate/create_pistoncms_menus.rb'],
                        ['create_media.rb', 'db/migrate/create_pistoncms_media.rb']
                      ]

        migrations.each do |m|
          migration_template m.first, m.last rescue display $!.message, :yellow
        end
      end

    end
  end
end