class AddShortUrlNameToShortUrl < ActiveRecord::Migration
  def change
    add_column :short_urls, :short_url_name, :string
  end
end
