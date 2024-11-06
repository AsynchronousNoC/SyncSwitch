create_pblock pblock_X0Y0
resize_pblock [get_pblocks pblock_X0Y0] -add {SLICE_X0Y230:SLICE_X15Y249}
resize_pblock [get_pblocks pblock_X0Y0] -add {DSP48_X0Y92:DSP48_X0Y99}
resize_pblock [get_pblocks pblock_X0Y0] -add {RAMB18_X0Y92:RAMB18_X0Y99}
resize_pblock [get_pblocks pblock_X0Y0] -add {RAMB36_X0Y46:RAMB36_X0Y49}
add_cells_to_pblock [get_pblocks pblock_X0Y0] [get_cells myNoC/routerinst[0].router_ij]
set_property EXCLUDE_PLACEMENT true [get_pblocks pblock_X0Y0]
set_property CONTAIN_ROUTING true [get_pblocks pblock_X0Y0]

create_pblock pblock_X1Y0
resize_pblock [get_pblocks pblock_X1Y0] -add {SLICE_X32Y230:SLICE_X47Y249}
resize_pblock [get_pblocks pblock_X1Y0] -add {DSP48_X2Y92:DSP48_X2Y99}
resize_pblock [get_pblocks pblock_X1Y0] -add {RAMB18_X2Y92:RAMB18_X2Y99}
resize_pblock [get_pblocks pblock_X1Y0] -add {RAMB36_X2Y46:RAMB36_X2Y49}
add_cells_to_pblock [get_pblocks pblock_X1Y0] [get_cells myNoC/routerinst[1].router_ij]
set_property EXCLUDE_PLACEMENT true [get_pblocks pblock_X1Y0]
set_property CONTAIN_ROUTING true [get_pblocks pblock_X1Y0]

create_pblock pblock_X2Y0
resize_pblock [get_pblocks pblock_X2Y0] -add {SLICE_X114Y232:SLICE_X131Y249}
add_cells_to_pblock [get_pblocks pblock_X2Y0] [get_cells myNoC/routerinst[2].router_ij]
set_property EXCLUDE_PLACEMENT true [get_pblocks pblock_X2Y0]
set_property CONTAIN_ROUTING true [get_pblocks pblock_X2Y0]

create_pblock pblock_X3Y0
resize_pblock [get_pblocks pblock_X3Y0] -add {SLICE_X144Y232:SLICE_X161Y249}
resize_pblock [get_pblocks pblock_X3Y0] -add {DSP48_X8Y94:DSP48_X8Y99}
resize_pblock [get_pblocks pblock_X3Y0] -add {RAMB18_X8Y94:RAMB18_X8Y99}
resize_pblock [get_pblocks pblock_X3Y0] -add {RAMB36_X8Y47:RAMB36_X8Y49}
add_cells_to_pblock [get_pblocks pblock_X3Y0] [get_cells myNoC/routerinst[3].router_ij]
set_property EXCLUDE_PLACEMENT true [get_pblocks pblock_X3Y0]
set_property CONTAIN_ROUTING true [get_pblocks pblock_X3Y0]

create_pblock pblock_X0Y1
resize_pblock [get_pblocks pblock_X0Y1] -add {SLICE_X0Y180:SLICE_X15Y199}
resize_pblock [get_pblocks pblock_X0Y1] -add {DSP48_X0Y72:DSP48_X0Y79}
resize_pblock [get_pblocks pblock_X0Y1] -add {RAMB18_X0Y72:RAMB18_X0Y79}
resize_pblock [get_pblocks pblock_X0Y1] -add {RAMB36_X0Y36:RAMB36_X0Y39}
add_cells_to_pblock [get_pblocks pblock_X0Y1] [get_cells myNoC/routerinst[4].router_ij]
set_property EXCLUDE_PLACEMENT true [get_pblocks pblock_X0Y1]
set_property CONTAIN_ROUTING true [get_pblocks pblock_X0Y1]

create_pblock pblock_X1Y1
resize_pblock [get_pblocks pblock_X1Y1] -add {SLICE_X36Y180:SLICE_X51Y199}
resize_pblock [get_pblocks pblock_X1Y1] -add {DSP48_X2Y72:DSP48_X2Y79}
resize_pblock [get_pblocks pblock_X1Y1] -add {RAMB18_X2Y72:RAMB18_X2Y79}
resize_pblock [get_pblocks pblock_X1Y1] -add {RAMB36_X2Y36:RAMB36_X2Y39}
add_cells_to_pblock [get_pblocks pblock_X1Y1] [get_cells myNoC/routerinst[5].router_ij]
set_property EXCLUDE_PLACEMENT true [get_pblocks pblock_X1Y1]
set_property CONTAIN_ROUTING true [get_pblocks pblock_X1Y1]

create_pblock pblock_X2Y1
resize_pblock [get_pblocks pblock_X2Y1] -add {SLICE_X114Y182:SLICE_X131Y199}
add_cells_to_pblock [get_pblocks pblock_X2Y1] [get_cells myNoC/routerinst[6].router_ij]
set_property EXCLUDE_PLACEMENT true [get_pblocks pblock_X2Y1]
set_property CONTAIN_ROUTING true [get_pblocks pblock_X2Y1]

create_pblock pblock_X3Y1
resize_pblock [get_pblocks pblock_X3Y1] -add {SLICE_X144Y182:SLICE_X161Y199}
resize_pblock [get_pblocks pblock_X3Y1] -add {DSP48_X8Y74:DSP48_X8Y79}
resize_pblock [get_pblocks pblock_X3Y1] -add {RAMB18_X8Y74:RAMB18_X8Y79}
resize_pblock [get_pblocks pblock_X3Y1] -add {RAMB36_X8Y37:RAMB36_X8Y39}
add_cells_to_pblock [get_pblocks pblock_X3Y1] [get_cells myNoC/routerinst[7].router_ij]
set_property EXCLUDE_PLACEMENT true [get_pblocks pblock_X3Y1]
set_property CONTAIN_ROUTING true [get_pblocks pblock_X3Y1]


create_pblock pblock_X0Y2
resize_pblock [get_pblocks pblock_X0Y2] -add {SLICE_X0Y130:SLICE_X15Y149}
resize_pblock [get_pblocks pblock_X0Y2] -add {DSP48_X0Y52:DSP48_X0Y59}
resize_pblock [get_pblocks pblock_X0Y2] -add {RAMB18_X0Y52:RAMB18_X0Y59}
resize_pblock [get_pblocks pblock_X0Y2] -add {RAMB36_X0Y26:RAMB36_X0Y29}
add_cells_to_pblock [get_pblocks pblock_X0Y2] [get_cells myNoC/routerinst[8].router_ij]
set_property EXCLUDE_PLACEMENT true [get_pblocks pblock_X0Y2]
set_property CONTAIN_ROUTING true [get_pblocks pblock_X0Y2]

create_pblock pblock_X1Y2
resize_pblock [get_pblocks pblock_X1Y2] -add {SLICE_X36Y130:SLICE_X51Y149}
resize_pblock [get_pblocks pblock_X1Y2] -add {DSP48_X2Y52:DSP48_X2Y59}
resize_pblock [get_pblocks pblock_X1Y2] -add {RAMB18_X2Y52:RAMB18_X2Y59}
resize_pblock [get_pblocks pblock_X1Y2] -add {RAMB36_X2Y26:RAMB36_X2Y29}
add_cells_to_pblock [get_pblocks pblock_X1Y2] [get_cells myNoC/routerinst[9].router_ij]
set_property EXCLUDE_PLACEMENT true [get_pblocks pblock_X1Y2]
set_property CONTAIN_ROUTING true [get_pblocks pblock_X1Y2]

create_pblock pblock_X2Y2
resize_pblock [get_pblocks pblock_X2Y2] -add {SLICE_X114Y132:SLICE_X131Y149}
add_cells_to_pblock [get_pblocks pblock_X2Y2] [get_cells myNoC/routerinst[10].router_ij]
set_property EXCLUDE_PLACEMENT true [get_pblocks pblock_X2Y2]
set_property CONTAIN_ROUTING true [get_pblocks pblock_X2Y2]

create_pblock pblock_X3Y2
resize_pblock [get_pblocks pblock_X3Y2] -add {SLICE_X144Y132:SLICE_X161Y149}
resize_pblock [get_pblocks pblock_X3Y2] -add {DSP48_X8Y54:DSP48_X8Y59}
resize_pblock [get_pblocks pblock_X3Y2] -add {RAMB18_X8Y54:RAMB18_X8Y59}
resize_pblock [get_pblocks pblock_X3Y2] -add {RAMB36_X8Y27:RAMB36_X8Y29}
add_cells_to_pblock [get_pblocks pblock_X3Y2] [get_cells myNoC/routerinst[11].router_ij]
set_property EXCLUDE_PLACEMENT true [get_pblocks pblock_X3Y2]
set_property CONTAIN_ROUTING true [get_pblocks pblock_X3Y2]

create_pblock pblock_X0Y3
resize_pblock [get_pblocks pblock_X0Y3] -add {SLICE_X0Y80:SLICE_X15Y99}
resize_pblock [get_pblocks pblock_X0Y3] -add {DSP48_X0Y32:DSP48_X0Y39}
resize_pblock [get_pblocks pblock_X0Y3] -add {RAMB18_X0Y32:RAMB18_X0Y39}
resize_pblock [get_pblocks pblock_X0Y3] -add {RAMB36_X0Y16:RAMB36_X0Y19}
add_cells_to_pblock [get_pblocks pblock_X0Y3] [get_cells myNoC/routerinst[12].router_ij]
set_property EXCLUDE_PLACEMENT true [get_pblocks pblock_X0Y3]
set_property CONTAIN_ROUTING true [get_pblocks pblock_X0Y3]

create_pblock pblock_X1Y3
resize_pblock [get_pblocks pblock_X1Y3] -add {SLICE_X36Y82:SLICE_X53Y99}
resize_pblock [get_pblocks pblock_X1Y3] -add {DSP48_X2Y34:DSP48_X2Y39}
resize_pblock [get_pblocks pblock_X1Y3] -add {RAMB18_X2Y34:RAMB18_X2Y39}
resize_pblock [get_pblocks pblock_X1Y3] -add {RAMB36_X2Y17:RAMB36_X2Y19}
add_cells_to_pblock [get_pblocks pblock_X1Y3] [get_cells myNoC/routerinst[13].router_ij]
set_property EXCLUDE_PLACEMENT true [get_pblocks pblock_X1Y3]
set_property CONTAIN_ROUTING true [get_pblocks pblock_X1Y3]

create_pblock pblock_X2Y3
resize_pblock [get_pblocks pblock_X2Y3] -add {SLICE_X114Y82:SLICE_X131Y99}
add_cells_to_pblock [get_pblocks pblock_X2Y3] [get_cells myNoC/routerinst[14].router_ij]
set_property EXCLUDE_PLACEMENT true [get_pblocks pblock_X2Y3]
set_property CONTAIN_ROUTING true [get_pblocks pblock_X2Y3]

create_pblock pblock_X3Y3
resize_pblock [get_pblocks pblock_X3Y3] -add {SLICE_X144Y82:SLICE_X161Y99}
resize_pblock [get_pblocks pblock_X3Y3] -add {DSP48_X8Y34:DSP48_X8Y39}
resize_pblock [get_pblocks pblock_X3Y3] -add {RAMB18_X8Y34:RAMB18_X8Y39}
resize_pblock [get_pblocks pblock_X3Y3] -add {RAMB36_X8Y17:RAMB36_X8Y19}
add_cells_to_pblock [get_pblocks pblock_X3Y3] [get_cells myNoC/routerinst[15].router_ij]
set_property CONTAIN_ROUTING true [get_pblocks pblock_X3Y3]
set_property EXCLUDE_PLACEMENT true [get_pblocks pblock_X3Y3]

