view: bm_d_passenger_type_cd {
  sql_table_name: `project_a_team.bm_d_passenger_type_cd`
    ;;

  dimension: passenger_type_cd {
    type: string
    sql: ${TABLE}.passenger_type_cd ;;
  }

  dimension: passenger_type_nm {
    type: string
    sql: ${TABLE}.passenger_type_nm ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
