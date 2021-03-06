HighlanderComponent do
  DependsOn 'vpc@1.0.4'
  Parameters do
    StackParam 'EnvironmentName', 'dev', isGlobal: true
    StackParam 'EnvironmentType', 'development', isGlobal: true
    StackParam 'Ami'
    MappingParam('InstanceType') do
      map 'EnvironmentType'
      attribute 'BastionInstanceType'
    end
    MappingParam('KeyName') do
      map 'AccountId'
      attribute 'KeyName'
    end
    MappingParam('DnsDomain') do
      map 'AccountId'
      attribute 'DnsDomain'
    end
    subnet_parameters({'public'=>{'name'=>'Public'}}, maximum_availability_zones)
    OutputParam component: 'vpc', name: "VPCId"
    OutputParam component: 'vpc', name: 'SecurityGroupDev'
    OutputParam component: 'vpc', name: 'SecurityGroupOps'
  end
end
