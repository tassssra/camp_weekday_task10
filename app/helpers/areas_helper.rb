module AreasHelper

  def api_request(zipcode)
    begin
      uri = URI.parse("http://zipcloud.ibsnet.co.jp/api/search?zipcode=#{zipcode}")
      response = Net::HTTP.get_response(uri)
    rescue
      flash.now[:alert] = "郵便番号を入力してください"
      return render :search
    end
    begin
      case response
      when Net::HTTPOK
        @result = JSON.parse(response.body)
        if @result["results"].nil? && @result["status"] == 200
          flash.now[:alert] = "郵便番号が見つかりませんでした。"
          return render :search
        end
        @area.zipcode = @result["results"][0]["zipcode"]
        @area.prefcode = @result["results"][0]["prefcode"]
        @area.address1 = @result["results"][0]["address1"]
        @area.address2 = @result["results"][0]["address2"]
        @area.address1 = @result["results"][0]["address3"]
        @area.kana1 = @result["results"][0]["kana1"]
        @area.kana2 = @result["results"][0]["kana2"]
        @area.kana3 = @result["results"][0]["kana3"]
      when Net::HTTPRedirection
        @message = "Redirection: code=#{response.code} message=#{response.message}"
      else
        @message = "HTTP ERROR: code=#{response.code} message=#{response.message}"
      end
    rescue
      flash.now[:alert] = @result["message"]
      render :search
    end
  end
end
