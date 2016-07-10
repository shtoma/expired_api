class Creator < ApplicationRecord
  DUMMY_YEAR_SUFFIX = "1900-"

  scope :search, -> (params){
    select_columns(params[:select_columns])
    .search_with_birth_day(params[:birth_day])
    .search_with_death_year(params[:death_year])
    .search_with_expired_year(params[:expired_year])
  }

  scope :select_columns, -> (select_columns){
    return if select_columns.nil?
    select_columns.push('id', 'user_id')
    select(select_columns.map!{|s| s.intern})
  }

  scope :search_with_birth_day, -> (birth_day){
    return if birth_day.nil?
    birth_date = DUMMY_YEAR_SUFFIX+birth_day
    where('MONTH(birth_date) = MONTH(?) AND DAY(birth_date) = DAY(?)', "#{birth_date}", "#{birth_date}")
  }

  scope :search_with_death_year, -> (death_year){
    return if death_year.nil?
    where('YEAR(death_date) = ?', death_year)
  }

  scope :search_with_expired_year, -> (expired_year){
    return if expired_year.nil?
    where('YEAR(death_date) + 51 = ? ', expired_year)
  }
end
