library("DiagrammeR")

# ---------------
pre <- 
  create_graph() %>%
  add_node() %>%
  add_node() %>%
  add_edge(from = 1, to = 2) %>%
  select_nodes_by_id(nodes = 1)

render_graph(pre)
# ---------------

create_graph() %>%
  add_node() %>%
  add_node() %>%
  add_edge(from = 1, to = 2) %>%
  select_nodes_by_id(nodes = 1) %>%
  trav_out() %>%
  get_selection()

# ----------------
test <- 
  create_graph() %>%
  add_path(n = 5) 
  
  test %>% 
  select_nodes_by_id(nodes = 1) %>%
  trav_out() %>%
  trav_out() %>%
  trav_out() %>%
  trav_out() %>%
  get_selection()

render_graph(test)

# ------

graph_1 <- 
  create_graph() %>%
  add_node() %>%
  select_nodes_by_id(nodes = 1) %>%
  add_n_nodes_ws(
    n = 5,
    direction = "from"
  ) %>%
  add_n_nodes_ws(
    n = 5,
    direction = "to"
  )

graph_1 %>% render_graph()

graph_1 %>%
  trav_out() %>%
  get_selection()



# ------------------------

graph_2 <-
create_graph() %>%
  add_node() %>%
  select_nodes_by_id(nodes = 1) %>%
  add_n_nodes_ws(
    n = 3,
    direction = "to"
  ) %>%
  add_n_nodes_ws(
    n = 3,
    direction = "from"
  )

render_graph(graph_2)

graph_2%>%
  trav_both() %>%
  get_selection()

# Add type -------
graph %>%
  select_nodes_by_id(nodes = 1) %>%
  trav_out() %>%
  get_selection()

graph %>%
  select_nodes_by_id(nodes = 1) %>%
  trav_out(conditions = type == "type_b") %>%
  get_selection()

graph %>%
  select_nodes_by_id(nodes = 1) %>%
  trav_out(conditions = type == "type_c") %>%
  get_selection()

# Once the nodes have been selected via
# a traversal, a useful thing to do would
# be to attach new nodes to that selection
updated_graph <-
  graph %>%
  select_nodes_by_id(nodes = 1) %>%
  trav_out(conditions = type == "type_c") %>%
  add_n_nodes_ws(
    n = 1,
    direction = "from",
    type = "type_d"
  )

# View the updated graph
updated_graph %>% render_graph()


# Get all connected node ------

# Create a random graph using the
# `add_gnm_graph()` function; it
# has an unconnected node (`6`)
graph_1 <-
  create_graph() %>%
  add_gnm_graph(
    n = 20,
    m = 32,
    set_seed = 23) 


render_graph(graph_1)

# There won't be any connected
# nodes to `6` so when specifying
# this node with `get_all_connected_nodes()`
# we get NA back
graph_1 %>%
  get_all_connected_nodes(
    node = 6)

# Any other node in `graph_1` will
# provide a vector of all the nodes
# other than `6`
graph_1 %>%
  get_all_connected_nodes(
    node = 1)

# The following graph has two
# clusters of nodes (i.e., the
# graph has two connected components)
graph_2 <-
  create_graph() %>%
  add_path(n = 6) %>%
  add_path(n = 4)

# In `graph_2`, node `1` is in
# the larger of the two
# connected components
graph_2 %>%
  get_all_connected_nodes(
    node = 1)

# Also in `graph_2`, node `8`
# is in the smaller of the two
# connected components
graph_2 %>%
  get_all_connected_nodes(
    node = 8)


# Get predecessor ----

# Set a seed
suppressWarnings(RNGversion("3.5.0"))
set.seed(23)

# Create a node data frame (ndf)
ndf <- create_node_df(n = 26)

# Create an edge data
# frame (edf)
edf <-
  create_edge_df(
    from = sample(
      1:26, replace = TRUE),
    to = sample(
      1:26, replace = TRUE))

# From the ndf and edf,
# create a graph object
graph <-
  create_graph(
    nodes_df = ndf,
    edges_df = edf)

render_graph(graph, layout = "tree")

# Get predecessors for node
# `23` in the graph
graph %>%
  get_predecessors(
    node = 23)

# If there are no predecessors,
# `NA` is returned
graph %>%
  get_predecessors(
    node = 26)


graph %>%
  get_predecessors(
    node = 20)


# get periphery ----

# Create a random graph using the
# `add_gnm_graph()` function and
# get the nodes in the graph periphery
graph <-
create_graph() %>%
  add_gnm_graph(
    n = 28,
    m = 35,
    set_seed = 23) 

graph %>%
  get_periphery()


render_graph(graph, layout = "tree")

# get path -----

# Create a simple graph
graph <-
  create_graph() %>%
  add_n_nodes(n = 8) %>%
  add_edge(from = 1, to = 2) %>%
  add_edge(from = 1, to = 3) %>%
  add_edge(from = 3, to = 4) %>%
  add_edge(from = 3, to = 5) %>%
  add_edge(from = 4, to = 6) %>%
  add_edge(from = 2, to = 7) %>%
  add_edge(from = 7, to = 5) %>%
  add_edge(from = 4, to = 8)

render_graph(graph, layout = "tree")

# Get a list of all paths outward from node `1`
graph %>%
  get_paths(from = 1)

# Get a list of all paths leading to node `6`
graph %>%
  get_paths(to = 6)

# Get a list of all paths from `1` to `5`
graph %>%
  get_paths(
    from = 1,
    to = 5)

# Get a list of all paths from `1` up to a distance
# of 2 node traversals
graph %>%
  get_paths(
    from = 1,
    distance = 2)

# Get a list of the shortest paths from `1` to `5`
get_paths(
  graph,
  from = 1,
  to = 5,
  shortest_path = TRUE)

# Get a list of the longest paths from `1` to `5`
get_paths(
  graph,
  from = 1,
  to = 5,
  longest_path = TRUE)




