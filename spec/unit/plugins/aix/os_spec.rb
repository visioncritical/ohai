#
# Author:: Isa Farnik (<isa@chef.io>)
# Copyright:: Copyright (c) 2013-2015 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')

describe Ohai::System, "AIX os plugin" do
  before(:each) do
    @plugin = get_plugin("aix/os")
    kernel = Mash.new
    kernel[:version] = "6"
    kernel[:release] = "1"
    allow(@plugin).to receive(:collect_os).and_return(:aix)
    allow(@plugin).to receive(:kernel).and_return(kernel)
    @plugin.run
  end

  it "should set the top-level os_level attribute" do
    expect(@plugin[:os_version]).to eql("6")
  end
end

