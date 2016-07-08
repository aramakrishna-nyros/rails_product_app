class Product < ActiveRecord::Base
	before_save :total
	def total
		self.totol_price = self.price + self.vat.to_i
		product = 1001 + Product.all.to_a.length
		self.product_id = 'PDCT-' + product.to_s
	end	
	has_attached_file :image, styles: { medium: "300x300>", large: "600x600>", thumb: "100x100#" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/	
	validates :title, :presence => 'true'
  	validates :price, :presence => 'true' , :numericality => {:only_integer => true}					
  	validates :quantity, :presence => 'true'
  	validates :vat, :presence => 'true'
  	validates :description, :presence => 'true'
end
