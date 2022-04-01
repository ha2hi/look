view: bm_d_holiday_dt {
  sql_table_name: `project_a_team.bm_d_holiday_dt`
    ;;

  dimension_group: dt {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt ;;
  }

  dimension: dt_day {
    type: string
    sql: ${TABLE}.dt_day ;;
  }

  dimension: holiday {
    type: string
    sql: ${TABLE}.holiday ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
