require_relative '../../config/database'
require 'json'

class VotesController
  def get_votes(review_id)
    puts "[INFO] Iniciando búsqueda de votos para review_id: #{review_id}"

    return [400, { error: 'review_id requerido' }.to_json] if review_id.nil? || review_id.strip.empty?

    review_id_str = review_id.to_s
    vote = VOTES_COLLECTION.find({ review_id: review_id_str }).first

    if vote.nil?
      puts "[WARN] No se encontró la review con id: #{review_id_str}"
      return [404, { error: "No se encontró la review con id #{review_id_str}" }.to_json]
    end

    likes = vote['likes']&.length || 0
    dislikes = vote['dislikes']&.length || 0

    puts "[INFO] Likes: #{likes}, Dislikes: #{dislikes} para review_id: #{review_id_str}"

    response = {
      review_id: review_id_str,
      likes: likes,
      dislikes: dislikes
    }

    [200, response.to_json]
  end
end
