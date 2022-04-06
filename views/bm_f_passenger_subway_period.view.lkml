view: bm_f_passenger_subway_period {
  derived_table: {
    sql:
      select dt
            , passenger_type_cd
            , '총 승차 인원수' as gubun
            , sum(passenger_cnt) as cnt
      from `project_a_team.bm_f_passenger_subway_dd`
      group by dt, passenger_type_cd

      union all

      select dt
            , passenger_type_cd
            , '총 하차 인원수' as gubun
            , sum(getoff_passenger_cnt) as  cnt
      from `project_a_team.bm_f_passenger_subway_dd`
      group by dt, passenger_type_cd

      union all

      select dt
            , passenger_type_cd
            , '유동 인원수' as gubun
            , sum(foot_traffic_cnt) as  cnt
      from `project_a_team.bm_f_passenger_subway_dd`
      group by dt, passenger_type_cd

      union all

      select dt
            , passenger_type_cd
            , '순수송 인원수' as gubun
            , sum(abs(clean_transported_cnt)) as  cnt
      from `project_a_team.bm_f_passenger_subway_dd`
      group by dt, passenger_type_cd

      union all

      select a.dt
            , passenger_type_cd
            , '수송분담율' as gubun
            , sum(clean_transported_cnt) / max(total_clean) as cnt
      from `project_a_team.bm_f_passenger_subway_dd` a
      left join
      (
        select dt, sum(clean_transported_cnt) as total_clean
        from `project_a_team.bm_f_passenger_subway_dd`
        group by 1
      )c
      on a.dt = c.dt
      group by dt, passenger_type_cd
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


  dimension: station_cd {
    type: string
    sql: ${TABLE}.station_cd ;;
  }


  dimension: subway_line_cd {
    type: string
    sql: ${TABLE}.subway_line_cd ;;
  }


  dimension: gubun {
    type: string
    sql: ${TABLE}.gubun ;;
  }

  measure: cnt {
    type: sum
    sql: ${TABLE}.cnt ;;
  }


  parameter: p_date_from {
    view_label: "Date_Parameter"
    type: date
  }

  parameter: p_date_to {
    view_label: "Date_Parameter"
    type: date
  }

  dimension: passenger_type_cd {
    type: string
    sql: ${TABLE}.passenger_type_cd ;;
  }



  dimension: period {
    type: string
    sql: case when ${dt_date} >= date({% parameter p_date_from%})
                    and ${dt_date} <= date({% parameter p_date_to%}) then "당월"
              when ${dt_date} >= date_sub(date({% parameter p_date_from%}), interval 1 month)
                    and ${dt_date} <= date_sub(date({% parameter p_date_to%}), interval 1 month) then "전월"
        end ;;
  }


  # measure: now_passenger_cnt {
  #   label: "당기"
  #   type: number
  #   sql: case when ${period} = '당기' then ${cnt} else 0 end ;;
  # }

  # measure: old_passenger_cnt {
  #   label: "전기"
  #   type: number
  #   sql: case when ${period} = '전기' then ${cnt} else 0 end ;;
  # }



}
