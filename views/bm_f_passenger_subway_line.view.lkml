view: bm_f_passenger_subway_line {
  derived_table: {
    sql:
      select dt
            , subway_line_cd
            , sum(passenger_cnt) as line_passenger_cnt
            , sum(getoff_passenger_cnt) as  line_getoff_passenger_cnt
            , sum(foot_traffic_cnt) as  line_foot_traffic_cnt
            , sum(clean_transported_cnt) as  line_clean_transported_cnt
      from `project_a_team.bm_f_passenger_subway_dd`
      group by dt, subway_line_cd
      ;;

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


  dimension: subway_line_cd {
    type: string
    sql: ${TABLE}.subway_line_cd ;;
  }


  measure: line_clean_transported_cnt {
    label: "호선별 순수송인원"
    type: number
    sql: sum(${TABLE}.line_clean_transported_cnt) ;;
  }

  measure: line_foot_traffic_cnt {
    label: "호선별 유동인원"
    type: number
    sql: sum(${TABLE}.line_foot_traffic_cnt) ;;
  }

  measure: line_getoff_passenger_cnt {
    label: "호선별 하차인원"
    type: number
    sql: sum(${TABLE}.line_getoff_passenger_cnt) ;;
  }

  measure: line_passenger_cnt {
    label: "호선별 승차인원"
    type: number
    sql: sum(${TABLE}.line_passenger_cnt) ;;
  }


}
