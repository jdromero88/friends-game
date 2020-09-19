class StatesController < ApplicationController
  def index
    @states = State.all
    render json: StateSerializer.new(@states).to_serialized_json
  end

  def show
    # byebug
    @state = State.find(params['id']);
    if @state
      render json: StateSerializer.new(@state).to_serialized_json
    else
      render json: {message: error}
    end
  end

  def search
    # byebug
    @state = State.find_by(name: params['name'])
    if @state
      render json: StateSerializer.new(@state).to_serialized_json
    else
      render json: {message: 'typo'}
    end
  end

  def create
    @state = State.create!(code: params['code'], name: params['name'])
    if @state
      render json: StateSerializer.new(@state).to_serialized_json
    else
      render json: {messsage: error}
    end
  end

  def update
    @state = State.find!(params['id'])
    if @state
      @state = State.update!(code: params['code'], name: params['name'])
    else
      render json: {messsage: error}
    end
  end

  def destroy
    render json: {messsage: error}
  end
end
