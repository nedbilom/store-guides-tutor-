class PlatformHoldersController < ApplicationController
                    #         platform_holders GET    /platform_holders(.:format)                                                                       platform_holders#index
                    #                      POST   /platform_holders(.:format)                                                                       platform_holders#create
                    #  new_platform_holder GET    /platform_holders/new(.:format)                                                                   platform_holders#new
                    # edit_platform_holder GET    /platform_holders/:id/edit(.:format)                                                              platform_holders#edit
                    #      platform_holder GET    /platform_holders/:id(.:format)                                                                   platform_holders#show
                    #                      PATCH  /platform_holders/:id(.:format)                                                                   platform_holders#update
                    #                      PUT    /platform_holders/:id(.:format)                                                                   platform_holders#update
                    #                      DELETE /platform_holders/:id(.:format)  
    def index
    end

    def new
        @platform_holder = PlatformHolder.new
        @products = Product.all
    end

    def show
        @platform = PlatformHolder.find(params[:id]);
    end

    def create
        @platform = PlatformHolder.new(platform_params)

        if @platform.save
            productIds = params[:platform_holder][:product_ids] || []
            productIds = productIds.reject(&:blank?)

            puts "=== DEBUG ==="
            puts productIds.inspect
            puts "============="

            # Альтернатива:
            # Product.where(id: product_ids).update_all(platform_holder_id: @platform.id)

            productIds.each do |id|
                product = Product.find(id)
                
                puts "=== Обновляю продукт ID: #{id} ==="
                puts "Текущий platform_holder_id: #{product.platform_holder_id}"
                
                if product.update(platform_holder_id: @platform.id)
                    puts "Успешно обновлено!"
                else
                    puts "ОШИБКА ОБНОВЛЕНИЯ!"
                    puts product.errors.full_messages.inspect
                end
            end

            redirect_to @platform
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

  def platform_params
    params.expect(platform_holder: [ :name, :description ])
  end
end
