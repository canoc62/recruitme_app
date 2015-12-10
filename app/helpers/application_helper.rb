module ApplicationHelper

  def convert_inch(inch)
    (inch/12).to_s + '\'' + (inch%12).floor.to_s + "\""
  end

  def us_states
    [
      'AK','AL','AR','AZ','CA','CO','CT','DC','DE','FL',
      'GA','HI','IA','ID','IL','IN','KS','KY','LA','MA',
      'MD','ME','MI','MN','MO','MS','MT','NC','ND','NE',
      'NH','NJ','NM','NV','NY','OH','OK','OR','PA','RI',
      'SC','SD','TN','TX','UT','VA','VT','WA','WI','WV','WY'
    ]
  end
end
