# frozen_string_literal: true

require 'json'

class Node
  attr_accessor :id, :name, :children, :level

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @level = data[:level] || 0
    @children = []
  end

  def to_s
    name.to_s
  end
end

class LocationNodes
  attr_accessor :tree, :all

  def initialize(data)
    @root = root
    @all ||= [@root]
    @tree ||= [@root]
    @output = []

    init_nodes(data)
  end

  def to_s
    @output = []
    display
    puts @output.join("\n")
  end

  def display(children = @root.children)
    children.each do |r|
      @output << "#{'-' * r.level}#{r.name}"

      display(r.children) if r.children.any?
    end
  end

  def push(node_obj)
    node = nil
    if (parent = search_by_id(node_obj[:parent_id]))
      node = Node.new(node_obj.merge(level: parent.level + 1))
      parent.children << node
    else
      node = Node.new(node_obj)
      @root.children << node
    end

    @all << node
  end

  def search_by_id(id)
    @all.select do |node|
      node.id == id
    end.first
  end

  private

  def root
    Node.new(name: 'root', level: -1)
  end

  def init_nodes(data)
    data.each do |location_data|
      push(location_data)
    end
  end
end

DATA = JSON.parse('[
  {"id": 1, "name": "Nairobi", "parent_id": null},
  {"id": 2, "name": "San Francisco Bay Area", "parent_id": null},
  {"id": 3, "name": "San Jose", "parent_id": 1},
  {"id": 4, "name": "South Bay", "parent_id": 2},
  {"id": 5, "name": "San Francisco", "parent_id": 3},
  {"id": 6, "name": "Manhattan", "parent_id": 1},
  {"id": 7, "name": "New York", "parent_id": null}
]', symbolize_names: true).sort_by { |v| v[:parent_id] || 0 }

locations = LocationNodes.new(DATA)
locations.to_s
