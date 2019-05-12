abstract class BaseBox < Avram::Box
  SEQUENCES = {} of String => Int32

  def sequence(value : String) : String
    SEQUENCES[value] ||= 0
    SEQUENCES[value] += 1
    "#{value}-#{SEQUENCES[value]}"
  end
end
