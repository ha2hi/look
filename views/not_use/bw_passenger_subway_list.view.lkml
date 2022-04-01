view: bw_passenger_subway_list {
  sql_table_name: `project_a_team.bw_passenger_subway_list`
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

  dimension: getoff_passenger_cnt {
    type: number
    sql: ${TABLE}.getoff_passenger_cnt ;;
  }

  dimension: passenger_cnt {
    type: number
    sql: ${TABLE}.passenger_cnt ;;
  }

  dimension: passenger_type_nm {
    type: string
    sql: ${TABLE}.passenger_type_nm ;;
  }

  dimension: station_cd {
    type: string
    sql: ${TABLE}.station_cd ;;
  }

  dimension: station_nm {
    type: string
    sql: ${TABLE}.station_nm ;;
  }

  dimension: subway_line_nm {
    type: string
    sql: ${TABLE}.subway_line_nm ;;
  }

  dimension: tm_range_gb {
    type: string
    sql: ${TABLE}.tm_range_gb ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
