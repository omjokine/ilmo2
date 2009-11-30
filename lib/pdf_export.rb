# PdfExport.all_courses(courses)

module PdfExport
  require 'pdf/writer'
  
	def self.all_courses(courses)
	
		pdf = PDF::Writer.new(:paper => "A4")

		pdf.select_font "Helvetica"
		pdf.font_size = 12
		pdf.right_margin = 100
		pdf.left_margin = 50
	
		
    pdf.text("All courses")

    courses.each do |course|
      pdf.text("Name: #{course.name}", :font_size=>32)
      pdf.text("Description:", :font_size=>12)
      pdf.text(course.description, :left=>50) if course.description
    end
		
		pdf.render
	
	end
	
end
