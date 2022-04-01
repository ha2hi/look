view: bm_d_transfer_station {
  sql_table_name: `project_a_team.bm_d_transfer_station`
    ;;

  dimension: station_cd {
    type: string
    sql: ${TABLE}.station_cd ;;
  }

  dimension: station_nm {
    type: string
    sql: ${TABLE}.station_nm ;;
  }

  dimension: subway_line_cd {
    type: string
    sql: ${TABLE}.subway_line_cd ;;
  }

  dimension: transfer_line_cnt {
    type: number
    sql: ${TABLE}.transfer_line_cnt ;;
  }

  dimension: transfer_station_gb {
    type: string
    sql: ${TABLE}.transfer_station_gb ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
