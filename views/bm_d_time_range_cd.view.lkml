view: bm_d_time_range_cd {
  sql_table_name: `project_a_team.bm_d_time_range_cd`
    ;;

  dimension: tm_range_cd {
    type: string
    sql: ${TABLE}.tm_range_cd ;;
  }

  dimension: tm_range_nm {
    type: string
    sql: ${TABLE}.tm_range_nm ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
