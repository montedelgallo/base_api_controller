# frozen_string_literal: true

class BaseApiController < ApplicationController
  before_action :class_model


  def hello
    render plain: 'Hello there'
  end

  def index
    data = @class_model.all
    render_json_data(data)
  end

  def show
    data = @class_model.find(params[:id])
    render_json_data(data)
  end

  def create
    set_res(class_model.new(res_params))

    if created_res.save
      render_json_data(created_res)
    else
      render_json_data(created_res.errors.full_messages)
    end
  end

  def update
    set_res(class_model.find(params[:id]))

    if created_res.update(res_params)
      render_json_data(created_res)
    else
      render_json_data(created_res.errors.full_messages)
    end
  end

  def destroy
    set_res(class_model.find(params[:id]))

    if created_res.delete
      render_json_data({ message: 'Successfuly deleted', status: 200 })
    else
      render_json_data(created_res.errors.full_messages)
    end
  end

  private

  def res_name
    @res_name ||= self.controller_name.singularize
  end

  def set_res(res = nil)
    res ||= class_model.find(params[:id])
    instance_variable_set("@#{res_name}", res)
  end

  def class_model
    @class_model ||= res_name.classify.constantize
  end

  def render_json_data(data)
    render json: instance_variable_set("@#{res_name.pluralize}", data)
  end

  def res_params
    @res_params ||= self.send("#{res_name}_params")
  end

  def created_res
    instance_variable_get("@#{res_name}")
  end

  def model_attributes
    @class_model.attribute_names.map(&:to_sym) - %i[created_at updated_at]
  end
end
