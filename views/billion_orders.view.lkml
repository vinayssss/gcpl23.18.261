# The name of this view in Looker is "Billion Orders"
view: billion_orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "LOOKER_TEST"."BILLION_ORDERS" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Customer ID" in Explore.

  dimension: customer_id {
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension: order_price {
    type: number
    sql: ${TABLE}."ORDER_PRICE" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_order_price {
    type: sum
    sql: ${order_price} ;;  }
  measure: average_order_price {
    type: average
    sql: ${order_price} ;;  }
  measure: count {
    type: count
    drill_fields: [orders.id]
  }
}
