connection: "thelook"

# include all the views
include: "/views/**/*.view"

explore: order_items {
  label: "Store Orders"
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
  join: user_data {
    type: left_outer
    sql_on: ${users.id} = ${user_data.user_id} ;;
    relationship: many_to_one
  }
}
