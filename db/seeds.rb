
require 'json'
require 'open-uri'

Cocktail.destroy_all
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read # abre a url e pega o conteudo cru
ingredients = JSON.parse(ingredients_serialized) # transforma o conteudo cru em algo para trabalharmos

ingredients_array = ingredients['drinks']

ingredients_array.each do |ingredient|
  ingredient_name = ingredient['strIngredient1']
  Ingredient.create!(name: ingredient_name)
end

Cocktail.create!(name: 'Caipirinha')
