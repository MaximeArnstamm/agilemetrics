require "administrate/base_dashboard"

class SprintDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    project: Field::BelongsTo,
    id: Field::Number,
    number: Field::Number,
    startDate: Field::DateTime,
    endDate: Field::DateTime,
    velocityForecast: Field::Number,
    velocityReal: Field::Number,
    internalBugs: Field::Number,
    externalBugs: Field::Number,
    teamSatisfaction: Field::Number.with_options(decimals: 2),
    clientSatisfaction: Field::Number.with_options(decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    velocityComment: Field::String,
    bugsComment: Field::String,
    satisfactionComment: Field::String,
    additionalNotes: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :project,
    :id,
    :number,
    :startDate,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :project,
    :id,
    :number,
    :startDate,
    :endDate,
    :velocityForecast,
    :velocityReal,
    :internalBugs,
    :externalBugs,
    :teamSatisfaction,
    :clientSatisfaction,
    :created_at,
    :updated_at,
    :velocityComment,
    :bugsComment,
    :satisfactionComment,
    :additionalNotes,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :project,
    :number,
    :startDate,
    :endDate,
    :velocityForecast,
    :velocityReal,
    :internalBugs,
    :externalBugs,
    :teamSatisfaction,
    :clientSatisfaction,
    :velocityComment,
    :bugsComment,
    :satisfactionComment,
    :additionalNotes,
  ]

  # Overwrite this method to customize how sprints are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(sprint)
  #   "Sprint ##{sprint.id}"
  # end
end
