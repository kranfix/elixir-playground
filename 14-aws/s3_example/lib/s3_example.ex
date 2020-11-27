# defmodule S3Example do
#  def hello do
#    :world
#  end
# end

alias ExAws.S3
# S3.list_objects("spartan1992") |> ExAws.request()

# ExAws.Config.new(:s3) |> ExAws.S3.presigned_url(:get, "some-bucket", "path/to/object", [])
