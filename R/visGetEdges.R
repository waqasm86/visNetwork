#' Function to get edges data, with shiny only.
#'
#' Function to get edges data, with shiny only
#' 
#' @param graph : a \code{\link{visNetworkProxy}}  object
#' @param input : name of shiny input created. Default to paste0(graph$id, "_edges")
#' 
#'@seealso \link{visNodes} for nodes options, \link{visEdges} for edges options, \link{visGroups} for groups options, 
#'\link{visLegend} for adding legend, \link{visOptions} for custom option, \link{visLayout} & \link{visHierarchicalLayout} for layout, 
#'\link{visPhysics} for control physics, \link{visInteraction} for interaction, \link{visNetworkProxy} & \link{visFocus} & \link{visFit} for animation within shiny,
#'\link{visDocumentation}, \link{visEvents}, \link{visConfigure} ...
#' 
#' @examples
#'\dontrun{
#'
#'# have a look to : 
#'shiny::runApp(system.file("shiny", package = "visNetwork"))
#'
#'}
#'
#'@export
#'@references See online documentation \url{http://datastorm-open.github.io/visNetwork/}
visGetEdges <- function(graph, input = paste0(graph$id, "_edges")){
  
  if(!any(class(graph) %in% "visNetwork_Proxy")){
    stop("Can't use visGetEdges with visNetwork object. Only within shiny & using visNetworkProxy")
  }
  
  data <- list(id = graph$id, input = input)
  
  graph$session$sendCustomMessage("visShinyGetEdges", data)
  
  graph
}
