json.array!(@tickets) do |ticket|
  json.extract! ticket, :origin, :destination, :transportation_type, :transportation_id, :seat, :extra_information
  json.url ticket_url(ticket, format: :json)
end
