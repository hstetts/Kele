module Roadmap

  def get_roadmap(roadmap_id)
    response = Kele.get("/roadmaps/#{roadmap_id}", headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    response = Kele.get("/checkpoints/#{checkpoint_id}", headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_remaining_checkpoints(enrollment_id)
    response = Kele.get("/enrollment_chains/#{enrollment_id}/checkpoints_remaining_in_section", headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

end
