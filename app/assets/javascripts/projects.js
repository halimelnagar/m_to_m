var init_project_lookup;

init_project_lookup = function() {
  $('#project-lookup-form').on('ajax:before', function(event, data, status){
    show_spinner();
  });
  
  $('#project-lookup-form').on('ajax:after', function(event, data, status){
    hide_spinner();
  });
  
  $('#project-lookup-form').on('ajax:success', function(event, data, status){
    $('#project-lookup').replaceWith(data);
    init_project_lookup();
  });
  
  $('#project-lookup-form').on('ajax:error', function(event, xhr, status, error){
    hide_spinner();
    $('#project-lookup-results').replaceWith(' ');
    $('#project-lookup-errors').replaceWith('Project was not found.');
  });
}



$(document).ready(function() {
  init_project_lookup();
})