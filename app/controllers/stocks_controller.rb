require 'open-uri'
require 'csv'
class StocksController < ApplicationController
  # GET /stocks
  # GET /stocks.json
  def index
    @stocks = Stock.all
    query_string = ""
    @stocks.each do |stock|
      query_string = query_string + "+" + stock.symbol
    end
    url = "http://finance.yahoo.com/d/quotes.csv?s=#{query_string}&f=nl1c1"
    csv = CSV.parse(open(url).read)
    @result = Array.new
    #parse csv data
    csv.each do |row|
      puts row
      @result += row
    end
    @counter=0
    count=0
    @hash = Hash.new
    @stocks_array=Array.new

    @stocks.each do |stock|
      @hash["symbol"] = stock.symbol
      @hash["name"]= stock.name
      count=count+1
      @hash["holding"]= stock.holding
      @hash["price"]= stock.price
      @hash["current_price"]= @result[count]
      count=count+1
      @hash["daily_gain"]=stock.holding.to_f * @result[count].to_f
      count=count+1
      @hash["overall_gain"]=(stock.price.to_f-stock.price.to_f) * stock.holding.to_f
      @hash["current_value"]=@hash["current_price"].to_f * stock.holding.to_f
      @total_value = @total_value.to_f + @hash["current_value"].to_f
      @total_investment = @total_investment.to_f + (stock.price.to_f * stock.holding.to_f)
      @stocks_array.push(@hash)
    end
    @total_gain=@total_value.to_f-@total_investment.to_f
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stocks }
    end
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
    @stock = Stock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stock }
    end
  end

  # GET /stocks/new
  # GET /stocks/new.json
  def new
    @stock = Stock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stock }
    end
  end

  # GET /stocks/1/edit
  def edit
    @stock = Stock.find(params[:id])
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @stock = Stock.new(params[:stock])

    respond_to do |format|
      if @stock.save
        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
        format.json { render json: @stock, status: :created, location: @stock }
      else
        format.html { render action: "new" }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stocks/1
  # PUT /stocks/1.json
  def update
    @stock = Stock.find(params[:id])

    respond_to do |format|
      if @stock.update_attributes(params[:stock])
        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy

    respond_to do |format|
      format.html { redirect_to stocks_url }
      format.json { head :no_content }
    end
  end
end
