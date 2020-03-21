# frozen_string_literal: true

# clear DB
REDIS.flushdb

def next_page(page_number)
  url_base = "http://challenge-api.luizalabs.com/api/product/?page=#{page_number}"

  HTTParty.get(url_base)
end

def store_keys(products)
  products.each { |product| REDIS.set(product['id'], '') }
end

page_number = 0

loop do
  page_number += 1

  res = next_page(page_number)

  break if res.message != 'OK'

  store_keys res['products']
end
