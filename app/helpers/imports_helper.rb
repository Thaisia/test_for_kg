module ImportsHelper
  def import_xml
    begin
      puts "************** IMPORT **************"

      require 'rubygems'
      require 'nokogiri'
      require 'open-uri'

      {'1'    => 'http://static.ozone.ru/multimedia/yml/facet/div_soft.xml',
       '1001' => 'http://www.trenazhery.ru/market2.xml',
       '1002' => 'http://www.radio-liga.ru/yml.php',
       '1003' => 'http://armprodukt.ru/bitrix/catalog_export/yandex.php'}.each do |cat_code, url|

          xml_doc = Nokogiri::XML.parse(open(url), "UTF-8")
          xml_doc.xpath("//categories/category").each do |row_cat|
            row_cat['parentId'] == nil ? parent = nil : parent = (cat_code+row_cat['parentId'].to_s).to_i
            row_cat_id = cat_code+row_cat['id'].to_s
            Category.create(:id => row_cat_id.to_i, :parent_id => parent, :name => row_cat.text)
          end

          xml_doc.xpath("//offers/offer").each do |row_item|
            cats_list = []
            row_item.xpath('categoryId').each { |id| cats_list.push (cat_code+id.text).to_i}

            pics_list = []
            row_item.xpath('picture').each { |id| pics_list.push id.text}

            Item.create(:id => row_item['id'],
                        :category_id => cats_list.to_s,
                        :url => row_item.xpath('url').text,
                        :name => row_item.xpath('name').text, # todo: params
                        :price => row_item.xpath('price').text.to_i,
                        :currency_id => row_item.xpath('currencyId').text,
                        :avaliable => row_item['available'].to_s,
                        :picture => pics_list.to_s,
                        :store => row_item.xpath('store').text,
                        :pickup =>  row_item.xpath('pickup').text,
                        :delivery =>  row_item.xpath('delivery').text,
                        :local_delivery_cost => row_item.xpath('local_delivery_cost').text.to_i,
                        :vendor => row_item.xpath('vendor').text,
                        :model => row_item.xpath('model').text,
                        :description => row_item.xpath('description').text,
                        :sales_notes => row_item.xpath('sales_notes').text,
                        :manufacturer_warranty => row_item.xpath('manufacturer_warranty').text)
          end



      end
      puts "*************** END ****************"
      @imp_res = "Успешно"
    rescue
      @imp_res = "Неудачный"
    end

  end
end
