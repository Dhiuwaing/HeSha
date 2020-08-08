class Api::V1::RecipesController < Api::V1::BaseController
def index
  @recipes = Recipe.all
end

def show
  @recipe = Recipe.find(params[:id])
end

private

def recipe_params
  params.require(:recipe).permit(:name, :description, :ingredients, :instruction, :tag_list)
end

def render_error
    render json: {error: @recipe.errors.full_messages}
end


