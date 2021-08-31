# Não funciona o codigo abaixo por algum motivo
# class Item < ActiveRecord::Base
#   class_inheritable_accessor :columns
#     self.columns = []
  
#     def self.column(name, sql_type = nil, default = nil, null = true)
#       columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
#     end
  
#     def all
#       return []
#     end
  
#     column :recommendable_type, :string
#     #Other columns, validations and relations etc...
#   end

class Fii
  include ActiveModel::Model
  attr_accessor :cod, :dy, :v_vpa

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end