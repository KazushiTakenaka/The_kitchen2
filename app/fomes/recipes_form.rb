# class RecipeForm
#   include ActiveModel::Model


#   concerning :RecipeBuilder do
#     def recipe
#       @recipe ||= Recipe.new
#     end
#   end

#   concerning :MaterialBuilder do
#     attr_reader :materials_attributes

#     def materials
#       @materials_attributes ||= Material.new #nilであれば、右辺の値（またはメソッド）を代入することができる
#     end

#     def materials_attributes=(attributes)
#       @materials_attributes = Material.new(attributes)
#     end
#   end

#   concerning :PhotoBuilder do
#     attr_reader :photos_attributes

#     def photos
#       @photos_attributes ||= Photo.new
#     end

#     def photos_attributes=(attributes)
#       @photos_attributes = Photo.new(attributes)
#     end
#   end

#   concerning :MakeBuilder do
#     attr_reader :makes_attributes

#     def makes
#       @makes_attributes ||= Make.new
#     end

#     def makes_attributes=(attributes)
#       @makes_attributes = Make.new(attributes)
#     end
#   end

#   attr_accessor :name, :time, :user_id

#   validate :validate_something

#   def save
#     # バリデーションに引っかかる場合は以降の処理には行かせずfalseをコントローラーに返します
#     return false if invalid?
#     recipe.assign_attributes(recipe_params) #データをまとめる？
#     build_asscociations #アソシエーション？

#     if recipe.save
#       true
#     else
#       false
#     end
#   end

#   private

#   def recipe_params
#     {
#       name: name,
#       time: time,
#       user_id: user_id
#     }
#   end

#   def build_asscociations
#     recipe.materials << materials
#     recipe.photos << photos
#     recipe.makes << makes
#   end

#   def validate_something
#     # Do something
#   end

# end