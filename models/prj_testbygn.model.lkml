connection: "con-tesybygn"

# include all the views
include: "/views/**/*.view"

datagroup: prj_testbygn_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: prj_testbygn_default_datagroup

explore: bm_f_card_subway_dd {
  from: bm_f_card_subway_dd
  label: "card_subway"
  join: bm_f_card_subway_line {
    type: left_outer
    relationship: many_to_one
    sql_on: ${bm_f_card_subway_dd.subway_line_nm} = ${bm_f_card_subway_line.subway_line_nm}
      and ${bm_f_card_subway_dd.dt_date} = ${bm_f_card_subway_line.dt_date};;
  }
  sql_always_where: ${bm_f_card_subway_dd.period} = 'yes' ;;
}


explore: bm_f_passenger_subway_dd {
  from: bm_f_passenger_subway_dd
  label: "passenger_subway"
  join: bm_f_passenger_subway_line {
    type: left_outer
    relationship: many_to_one
    sql_on: ${bm_f_passenger_subway_dd.subway_line_cd} = ${bm_f_passenger_subway_line.subway_line_cd}
      and ${bm_f_passenger_subway_dd.dt_date} = ${bm_f_passenger_subway_line.dt_date};;
  }
  # sql_always_where: ${bm_f_card_subway_dd.period} = 'yes' ;;
}

explore: bm_f_passenger_subway_period {
  from: bm_f_passenger_subway_period
  label: "passenger_subway_period"


 join: bm_d_passenger_type_cd{
    type: left_outer

    sql_on: ${bm_f_passenger_subway_period.passenger_type_cd} = ${bm_d_passenger_type_cd.passenger_type_cd};;
    relationship: many_to_one}

}
explore: bm_f_passenger_subway_test {}
