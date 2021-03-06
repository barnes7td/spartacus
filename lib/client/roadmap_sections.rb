require_relative 'base_client'

module RoadmapSections
  include BaseClient
  # Create a checkpoint
  #
  # @param id [Integer] A roadmap section id.
  # @param options [Hash] A customizable set of options.
  # @option options [String] :name Checkpoint name.
  # @option options [String] :summary Checkpoint summary.
  # @option options [String] :body Checkpoint body.
  # @option options [String] :assignment Checkpoint assignment.
  # @option options [Integer] :points Checkpoint point.
  # @option options [String] :body_and_assignment Checkpoint body and Assignment
  # @return [Checkpoint] The created checkpoint
  # @example Create a checkpoint
  #   Spartacus#create_checkpoint(1, {name: 'Real Cool Checkpoint'})
  def create_checkpoint(id, options={})
    whitelist = ['name', 'summary', 'body', 'assignment','body_and_assignment', 'points']

    options = convert_keys(options)
    checkpoint_params = whitelist_params(options, whitelist)
    url = "#{@api_base_path}/roadmap_sections/#{id}/create_checkpoint"

    handle_timeouts do
      response = self.class.post(url,
                                 headers: auth_header,
                                 body: { checkpoint: checkpoint_params })
      convert_response(response, "checkpoint")
    end
  end
end
