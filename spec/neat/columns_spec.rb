require 'spec_helper'

describe "@include span-columns()" do
  before(:all) do
    ParserSupport.parse_file("span-columns")
  end

  context "with argument (6) in a twelve-column grid" do
    it "sets width in percentage" do
      expect('.span-columns-default').to have_rule('width: 48.821174201029585%')
    end

    it "sets gutter in percentage" do
      expect('.span-columns-default').to have_rule('margin-right: 2.3576515979408077%')
    end

    it "sets display to block" do
      expect('.span-columns-default').to have_rule('display: block')
    end

    it "sets float to left" do
      expect('.span-columns-default').to have_rule('float: left')
    end

    it "removes gutter from last element" do
      expect('.span-columns-default:last-child').to have_rule('margin-right: 0')
    end
  end

  context "when nested" do
    it "sets relative width in percentage" do
      expect('.span-columns-default .span-columns-nested').to have_rule('width: 30.1138947235848%')
    end

    it "sets relative gutter in percentage" do
      expect('.span-columns-default .span-columns-nested').to have_rule('margin-right: 4.829157914622806%')
    end
  end

  context "with argument (table)" do
    it "sets display to table-cell" do
      expect('.span-columns-table').to have_rule('display: table-cell')
    end

    it "sets padding in percentage" do
      expect('.span-columns-table').to have_rule('padding-right: 2.3576515979408077%')
    end

    it "substracts gutter from width of last element" do
      expect('.span-columns-table:last-child').to have_rule('width: 48.821174201029585%')
    end
  end

	context "with argument (collapse)" do
		it "appends gutter width to column width" do
			expect('.span-columns-collapse').to have_rule('width: 51.178825798970394%')
		end

		it "removes the next gutter" do
			expect('.span-columns-collapse').to_not have_rule('margin-right')
		end
	end
end
