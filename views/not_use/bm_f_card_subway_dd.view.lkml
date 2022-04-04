view: bm_f_card_subway_dd {
  sql_table_name: `project_a_team.bm_f_card_subway_dd`
    ;;

  dimension: clean_transported_cnt {
    type: number
    sql: ${TABLE}.clean_transported_cnt ;;
  }

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

  dimension: foot_traffic_cnt {
    type: number
    sql: ${TABLE}.foot_traffic_cnt ;;
  }

  dimension: getoff_passenger_cnt {
    type: number
    sql: ${TABLE}.getoff_passenger_cnt ;;
  }

  dimension: passenger_cnt {
    type: number
    sql: ${TABLE}.passenger_cnt ;;
  }

  dimension: station_nm {
    type: string
    sql: ${TABLE}.station_nm ;;
  }

  dimension: subway_line_nm {
    type: string
    sql: ${TABLE}.subway_line_nm ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  parameter: p_choose_date {
    view_label: "Date_Parameter"
    type: date
  }

  dimension: cal_14_days_ago {
    type: date
    sql: DATE_SUB(date({% parameter p_choose_date%}), INTERVAL 14 DAY) ;;
  }

  dimension: period {
    type: string
    sql: case when ${dt_date} >= ${cal_14_days_ago}
              and ${dt_date} <= date({% parameter p_choose_date%}) then "yes"
          else "no" end ;;
  }
}
