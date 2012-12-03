class Admin::AdminController < ApplicationController
  before_filter :authorize
  cache_sweeper :page_sweeper

  layout 'admin'
end