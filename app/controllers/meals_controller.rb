class MealsController < ApplicationController
  before_action :authenticate_user!