# frozen_string_literal: true

class StarDestroyer < ApplicationRecord
  CLASSES = %w[
    Acclamator
    Executor
    Gladiator
    Imperator
    Imperial
    Interdictor
    Maelstrom
    Mega
    Onager
    Qaz
    Resurgent
    Secutor
    Tector
    Venator
    Victory
    Xyston
  ]

  def jump_rating_params
    @jump_rating_params ||= JumpRatingParam.where(star_destroyer_version: version).first
  end

  def combat_rating_params
    @combat_rating_params ||= CombatRatingParam.where(star_destroyer_version: version).first
  end

  def interdiction_rating_params
    @interdiction_rating_params ||= InterdictionRatingParam.where(star_destroyer_version: version).first
  end
end
