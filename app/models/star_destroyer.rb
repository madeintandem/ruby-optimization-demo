class StarDestroyer < ApplicationRecord
  def jump_rating_params
    @jump_rating_params ||= JumpRatingParam.where(star_destroyer_version: version).first
  end

  def combat_rating_params
    @combat_rating_params ||= CombatRatingParam.where(star_destroyer_version: version).first
  end

  def interdiction_rating_param
    @interdiction_rating_param ||= InterdictionRatingParam.where(star_destroyer_version: version).first
  end
end
