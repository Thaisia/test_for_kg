require 'rubygems'
require 'nokogiri'
require 'open-uri'

tables = []

# {'1':'http://static.ozone.ru/multimedia/yml/facet/div_soft.xml',
# '1001': 'http://www.trenazhery.ru/market2.xml',
# '1002': 'http://www.radio-liga.ru/yml.php',
# '1003': 'http://armprodukt.ru/bitrix/catalog_export/yandex.php'}.each do |cat_code, url|

{'1' => 'market1.xml', '1001' => 'market2.xml', '1002' => 'market3.xml', '1003' => 'market4.xml'}.each do |cat_code, url|
    market = {}
    categories = []
    items = []
    xml_doc = Nokogiri::XML.parse(open(url), "UTF-8")
    #puts xml_doc.xpath("//shop/name").text

    xml_doc.xpath("//categories/category").each do |cat|
        categories << {cat_id: cat_code+cat['id'].to_s, cat_parent_id: cat_code+cat['parentId'].to_s, cat_name: cat.text}
    end
    
#item_id:integer item_cat_id:integer item_url:string item_name:string price:integer currency_id:string avaliable:boolean
#picture:string store:boolean pickup:boolean delivery:boolean local_delivery_cost:integer vendor:string item_model:string
#description:text sales_notes:text manufacturer_warranty:boolean

    xml_doc.xpath("//offers/offer").each do |item|
      items << {
                item_id: item['id'],
                item_cat_id: cat_code+item.xpath('categoryId').text, # todo: ARRAY
                item_url: item.xpath('url').text,
                item_name: item.xpath('name').text, # todo: params
                price: item.xpath('price').text,
                currency_id: item.xpath('currencyId').text,
                picture: item.xpath('picture').text, # todo: ARRAY
                store: item.xpath('store').text,
                pickup: item.xpath('pickup').text,
                delivery: item.xpath('delivery').text,
                local_delivery_cost: item.xpath('local_delivery_cost').text,
                type_prefix: item.xpath('typePrefix').text,
                vendor: item.xpath('vendor').text,
                item_model: item.xpath('model').text,
                description: item.xpath('description').text,
                sales_notes: item.xpath('sales_notes').text,
                manufacturer_warranty: item.xpath('manufacturer_warranty').text
              }
    end

    puts categories.inspect
      market[xml_doc.xpath("//shop/name").text] = categories, items # todo: more info
    tables << market
end

tables.each do |t|
  puts t
  puts '*********'
end
