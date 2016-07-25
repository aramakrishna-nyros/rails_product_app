class ProductsController < ApplicationController
before_action :set_product, only: [:show, :edit, :update, :destroy]

	def index
		@products = Product.all.page(params[:page]).per(3)
		respond_to do |format|
		    format.html
		    format.xlsx do
				response.headers['Content-Disposition'] = 'attachment; filename="all_products.xlsx"'
				# render xlsx: 'products', template: 'my/template', filename: "my_products.xlsx", disposition: 'inline', xlsx_created_at: 3.days.ago, xlsx_author: "Rk"
			end
		end
	end

	def show
		
	end

	def new
		@product = Product.new
	end

	def edit
		
	end

	def send_mail
		@product = Product.all
		SendingMailer.new_mail(@product).deliver_now		
	end

	def download_pdf
		html = render_to_string(template: 'products/download_pdf.pdf.erb')
		pdf = PDFKit.new(html)
		send_data pdf.to_pdf, filename: "datareport.pdf", type: "application/pdf", disposition: "inline"
	end
	
	def create
		@product = Product.new(product_params)

		respond_to do |prdct|
			if @product.save
				prdct.html{ redirect_to @product, notice: 'product was successfully created' }
				prdct.json{ render :show, status: :created, location: @product }
			else
				prdct.html{ render :new }
				prdct.json{ render json: @product.errors, status: :unprocessible_entity }
			end
		end
	end

	def update
	    respond_to do |prdct|
	      if @product.update(product_params)
	        prdct.html { redirect_to @product, notice: 'Product was successfully updated.' }
	        prdct.json { render :show, status: :ok, location: @product }
	      else
	        prdct.html { render :edit }
	        prdct.json { render json: @product.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	def destroy
	    @product.destroy
	    respond_to do |prdct|
	      prdct.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
	      prdct.json { head :no_content }
	    end
  	end

  	private
    def set_product
      @product = Product.find(params[:id])
      @product = Product.all
	  SendingMailer.new_mail(@product).deliver_now
    end

    def product_params
      params.require(:product).permit( :product_id, :title, :price, :quantity, :vat, :totol_price, :description, :image)
    end

end
