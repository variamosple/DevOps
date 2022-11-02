<?xml version="1.0" encoding="utf-8"?>
<Dsl xmlns:dm0="http://schemas.microsoft.com/VisualStudio/2008/DslTools/Core" dslVersion="1.0.0.0" Id="5af03ef8-bd8c-4744-90d5-5e9ee1e1d2aa" Description="Description for Variamos.DevOpsDsl.DevOpsDsl" Name="DevOpsDsl" DisplayName="DevOpsDsl" Namespace="Variamos.DevOpsDsl" ProductName="DevOpsDsl" CompanyName="Variamos" PackageGuid="dcd1f89d-000b-4058-8a43-beac92073e9f" PackageNamespace="Variamos.DevOpsDsl" xmlns="http://schemas.microsoft.com/VisualStudio/2005/DslTools/DslDefinitionModel">
  <Classes>
    <DomainClass Id="53fa3ae4-60e5-44d4-9a97-0d287f987aa9" Description="Description for Variamos.DevOpsDsl.DevOps" Name="DevOps" DisplayName="Dev Ops" Namespace="Variamos.DevOpsDsl">
      <Properties>
        <DomainProperty Id="e449a9e4-b5b2-4013-8a30-7ad6f145e609" Description="Model Name" Name="ModelName" DisplayName="Model Name" IsElementName="true">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
      <ElementMergeDirectives>
        <ElementMergeDirective>
          <Index>
            <DomainClassMoniker Name="Application" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>DevOpsHasApplications.Applications</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
      </ElementMergeDirectives>
    </DomainClass>
    <DomainClass Id="89646196-a8a0-4186-a288-4384229596fd" Description="Description for Variamos.DevOpsDsl.Application" Name="Application" DisplayName="Application" Namespace="Variamos.DevOpsDsl">
      <Properties>
        <DomainProperty Id="7e652c65-8339-43a0-a5ca-5373d18d416d" Description="Description for Variamos.DevOpsDsl.Application.Application Name" Name="ApplicationName" DisplayName="Application Name" IsElementName="true">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="a68c76f7-6613-4377-9eed-7587bb0f5903" Description="Description for Variamos.DevOpsDsl.Application.Cloud Provider" Name="CloudProvider" DisplayName="Cloud Provider">
          <Type>
            <DomainEnumerationMoniker Name="CloudProvider" />
          </Type>
        </DomainProperty>
      </Properties>
      <ElementMergeDirectives>
        <ElementMergeDirective>
          <Index>
            <DomainClassMoniker Name="Container" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>ApplicationHasContainers.Containers</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
      </ElementMergeDirectives>
    </DomainClass>
    <DomainClass Id="3fba09f1-07e3-4ebf-8039-06613d70913a" Description="Description for Variamos.DevOpsDsl.Container" Name="Container" DisplayName="Container" Namespace="Variamos.DevOpsDsl">
      <Properties>
        <DomainProperty Id="7fa1949c-3098-44bf-8744-69103252f3d1" Description="Description for Variamos.DevOpsDsl.Container.Container Name" Name="ContainerName" DisplayName="Container Name" IsElementName="true">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="d2cc7913-300d-48f0-aecb-a7767f011abb" Description="Implement DevSecOps practices to the current container" Name="DevSecOps" DisplayName="DevSecOps" DefaultValue="">
          <Type>
            <ExternalTypeMoniker Name="/System/Boolean" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="d45aabbd-728a-4307-b35a-f452ee8daf49" Description="Implement Continuous Integration practices to the current container" Name="ContinuousIntegration" DisplayName="Continuous Integration">
          <Type>
            <ExternalTypeMoniker Name="/System/Boolean" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="1c1b8f92-c227-4d08-ba3f-fe6758fa846b" Description="Implement Release Management practices to the current container" Name="ReleaseManagement" DisplayName="Release Management">
          <Type>
            <ExternalTypeMoniker Name="/System/Boolean" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
  </Classes>
  <Relationships>
    <DomainRelationship Id="b66acc16-ee54-4251-b928-007a38cc3e15" Description="Description for Variamos.DevOpsDsl.DevOpsHasApplications" Name="DevOpsHasApplications" DisplayName="Dev Ops Has Applications" Namespace="Variamos.DevOpsDsl" IsEmbedding="true">
      <Source>
        <DomainRole Id="44f85076-c197-4de1-af0d-7deca5793366" Description="Description for Variamos.DevOpsDsl.DevOpsHasApplications.DevOps" Name="DevOps" DisplayName="Dev Ops" PropertyName="Applications" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Applications">
          <RolePlayer>
            <DomainClassMoniker Name="DevOps" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="5b862f38-ad09-4bb8-9f80-1b6e44397633" Description="Description for Variamos.DevOpsDsl.DevOpsHasApplications.Application" Name="Application" DisplayName="Application" PropertyName="DevOps" Multiplicity="One" PropagatesDelete="true" PropertyDisplayName="Dev Ops">
          <RolePlayer>
            <DomainClassMoniker Name="Application" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="1a31614f-2028-4783-9531-035dfea87223" Description="Description for Variamos.DevOpsDsl.ApplicationHasContainers" Name="ApplicationHasContainers" DisplayName="Application Has Containers" Namespace="Variamos.DevOpsDsl" IsEmbedding="true">
      <Source>
        <DomainRole Id="55a60d90-0958-42c8-b32e-3b9cad7a2ce7" Description="Description for Variamos.DevOpsDsl.ApplicationHasContainers.Application" Name="Application" DisplayName="Application" PropertyName="Containers" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Containers">
          <RolePlayer>
            <DomainClassMoniker Name="Application" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="7d65ec8e-9f36-4ae5-b1ab-56d3f3eeab77" Description="Description for Variamos.DevOpsDsl.ApplicationHasContainers.Container" Name="Container" DisplayName="Container" PropertyName="Application" Multiplicity="One" PropagatesDelete="true" PropertyDisplayName="Application">
          <RolePlayer>
            <DomainClassMoniker Name="Container" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
  </Relationships>
  <Types>
    <ExternalType Name="DateTime" Namespace="System" />
    <ExternalType Name="String" Namespace="System" />
    <ExternalType Name="Int16" Namespace="System" />
    <ExternalType Name="Int32" Namespace="System" />
    <ExternalType Name="Int64" Namespace="System" />
    <ExternalType Name="UInt16" Namespace="System" />
    <ExternalType Name="UInt32" Namespace="System" />
    <ExternalType Name="UInt64" Namespace="System" />
    <ExternalType Name="SByte" Namespace="System" />
    <ExternalType Name="Byte" Namespace="System" />
    <ExternalType Name="Double" Namespace="System" />
    <ExternalType Name="Single" Namespace="System" />
    <ExternalType Name="Guid" Namespace="System" />
    <ExternalType Name="Boolean" Namespace="System" />
    <ExternalType Name="Char" Namespace="System" />
    <DomainEnumeration Name="CloudProvider" Namespace="Variamos.DevOpsDsl" Description="Description for Variamos.DevOpsDsl.CloudProvider">
      <Literals>
        <EnumerationLiteral Description="Microsft Azure" Name="Azure" Value="" />
        <EnumerationLiteral Description="Amazon Web Services" Name="AWS" Value="" />
        <EnumerationLiteral Description="Google Cloud Platform" Name="GCP" Value="" />
      </Literals>
    </DomainEnumeration>
    <DomainEnumeration Name="NodeType" Namespace="Variamos.DevOpsDsl" Description="Description for Variamos.DevOpsDsl.NodeType">
      <Literals>
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.NodeType.Container" Name="Container" Value="" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.NodeType.Capability" Name="Capability" Value="" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.NodeType.Application" Name="Application" Value="" />
      </Literals>
    </DomainEnumeration>
  </Types>
  <Shapes>
    <GeometryShape Id="d7e872c2-b2b8-408a-8805-304f48a2f8cc" Description="Description for Variamos.DevOpsDsl.ContainerShape" Name="ContainerShape" DisplayName="Container Shape" Namespace="Variamos.DevOpsDsl" FixedTooltipText="Container Shape" InitialHeight="1" Geometry="Rectangle">
      <ShapeHasDecorators Position="Center" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="NameDecorator" DisplayName="Name Decorator" DefaultText="NameDecorator" FontStyle="Bold" FontSize="10" />
      </ShapeHasDecorators>
    </GeometryShape>
    <GeometryShape Id="1f477189-8a64-42e2-994b-b0c1e42e32f1" Description="Description for Variamos.DevOpsDsl.ApplicationShape" Name="ApplicationShape" DisplayName="Application Shape" Namespace="Variamos.DevOpsDsl" FixedTooltipText="Application Shape" InitialHeight="1" Geometry="Rectangle">
      <ShapeHasDecorators Position="Center" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="NameDecorator" DisplayName="Name Decorator" DefaultText="NameDecorator" FontStyle="Bold" FontSize="12" />
      </ShapeHasDecorators>
      <ShapeHasDecorators Position="InnerBottomCenter" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="CloudProviderDecorator" DisplayName="Cloud Provider Decorator" DefaultText="CloudProviderDecorator" />
      </ShapeHasDecorators>
    </GeometryShape>
  </Shapes>
  <Connectors>
    <Connector Id="2e9b8dab-b453-4eac-95e4-4bcd75e4c400" Description="Description for Variamos.DevOpsDsl.ApplicationContainerConnector" Name="ApplicationContainerConnector" DisplayName="Application Container Connector" Namespace="Variamos.DevOpsDsl" FixedTooltipText="Application Container Connector" RoutingStyle="Straight" />
  </Connectors>
  <XmlSerializationBehavior Name="DevOpsDslSerializationBehavior" Namespace="Variamos.DevOpsDsl">
    <ClassData>
      <XmlClassData TypeName="DevOpsDiagram" MonikerAttributeName="" SerializeId="true" MonikerElementName="devOpsDiagramMoniker" ElementName="devOpsDiagram" MonikerTypeName="DevOpsDiagramMoniker">
        <DiagramMoniker Name="DevOpsDiagram" />
      </XmlClassData>
      <XmlClassData TypeName="ContainerShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="containerShapeMoniker" ElementName="containerShape" MonikerTypeName="ContainerShapeMoniker">
        <GeometryShapeMoniker Name="ContainerShape" />
      </XmlClassData>
      <XmlClassData TypeName="DevOps" MonikerAttributeName="" SerializeId="true" MonikerElementName="devOpsMoniker" ElementName="devOps" MonikerTypeName="DevOpsMoniker">
        <DomainClassMoniker Name="DevOps" />
        <ElementData>
          <XmlRelationshipData UseFullForm="true" RoleElementName="applications">
            <DomainRelationshipMoniker Name="DevOpsHasApplications" />
          </XmlRelationshipData>
          <XmlPropertyData XmlName="modelName">
            <DomainPropertyMoniker Name="DevOps/ModelName" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="DevOpsHasApplications" MonikerAttributeName="" SerializeId="true" MonikerElementName="devOpsHasApplicationsMoniker" ElementName="devOpsHasApplications" MonikerTypeName="DevOpsHasApplicationsMoniker">
        <DomainRelationshipMoniker Name="DevOpsHasApplications" />
      </XmlClassData>
      <XmlClassData TypeName="Application" MonikerAttributeName="" SerializeId="true" MonikerElementName="applicationMoniker" ElementName="application" MonikerTypeName="ApplicationMoniker">
        <DomainClassMoniker Name="Application" />
        <ElementData>
          <XmlPropertyData XmlName="applicationName">
            <DomainPropertyMoniker Name="Application/ApplicationName" />
          </XmlPropertyData>
          <XmlRelationshipData UseFullForm="true" RoleElementName="containers">
            <DomainRelationshipMoniker Name="ApplicationHasContainers" />
          </XmlRelationshipData>
          <XmlPropertyData XmlName="cloudProvider">
            <DomainPropertyMoniker Name="Application/CloudProvider" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="ApplicationShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="applicationShapeMoniker" ElementName="applicationShape" MonikerTypeName="ApplicationShapeMoniker">
        <GeometryShapeMoniker Name="ApplicationShape" />
      </XmlClassData>
      <XmlClassData TypeName="ApplicationHasContainers" MonikerAttributeName="" SerializeId="true" MonikerElementName="applicationHasContainersMoniker" ElementName="applicationHasContainers" MonikerTypeName="ApplicationHasContainersMoniker">
        <DomainRelationshipMoniker Name="ApplicationHasContainers" />
      </XmlClassData>
      <XmlClassData TypeName="Container" MonikerAttributeName="" SerializeId="true" MonikerElementName="containerMoniker" ElementName="container" MonikerTypeName="ContainerMoniker">
        <DomainClassMoniker Name="Container" />
        <ElementData>
          <XmlPropertyData XmlName="containerName">
            <DomainPropertyMoniker Name="Container/ContainerName" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="devSecOps">
            <DomainPropertyMoniker Name="Container/DevSecOps" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="continuousIntegration">
            <DomainPropertyMoniker Name="Container/ContinuousIntegration" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="releaseManagement">
            <DomainPropertyMoniker Name="Container/ReleaseManagement" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="ApplicationContainerConnector" MonikerAttributeName="" SerializeId="true" MonikerElementName="applicationContainerConnectorMoniker" ElementName="applicationContainerConnector" MonikerTypeName="ApplicationContainerConnectorMoniker">
        <ConnectorMoniker Name="ApplicationContainerConnector" />
      </XmlClassData>
    </ClassData>
  </XmlSerializationBehavior>
  <ExplorerBehavior Name="DevOpsDslExplorer" />
  <Diagram Id="aa0ce2b2-1fa5-458a-82dd-05d3b4d5e591" Description="Description for Variamos.DevOpsDsl.DevOpsDiagram" Name="DevOpsDiagram" DisplayName="Dev Ops Diagram" Namespace="Variamos.DevOpsDsl">
    <Class>
      <DomainClassMoniker Name="DevOps" />
    </Class>
    <ShapeMaps>
      <ShapeMap>
        <DomainClassMoniker Name="Application" />
        <ParentElementPath>
          <DomainPath>DevOpsHasApplications.DevOps/!DevOps</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="ApplicationShape/NameDecorator" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Application/ApplicationName" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <DecoratorMap>
          <TextDecoratorMoniker Name="ApplicationShape/CloudProviderDecorator" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Application/CloudProvider" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <GeometryShapeMoniker Name="ApplicationShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="Container" />
        <ParentElementPath>
          <DomainPath>ApplicationHasContainers.Application/!Application/DevOpsHasApplications.DevOps/!DevOps</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="ContainerShape/NameDecorator" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Container/ContainerName" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <GeometryShapeMoniker Name="ContainerShape" />
      </ShapeMap>
    </ShapeMaps>
    <ConnectorMaps>
      <ConnectorMap>
        <ConnectorMoniker Name="ApplicationContainerConnector" />
        <DomainRelationshipMoniker Name="ApplicationHasContainers" />
      </ConnectorMap>
    </ConnectorMaps>
  </Diagram>
  <Designer CopyPasteGeneration="CopyPasteOnly" FileExtension="DevOpsDsl" EditorGuid="35fae0cc-3108-4123-8cf1-c38d1633276a">
    <RootClass>
      <DomainClassMoniker Name="DevOps" />
    </RootClass>
    <XmlSerializationDefinition CustomPostLoad="false">
      <XmlSerializationBehaviorMoniker Name="DevOpsDslSerializationBehavior" />
    </XmlSerializationDefinition>
    <ToolboxTab TabText="DevOpsDsl" />
    <Validation UsesMenu="false" UsesOpen="false" UsesSave="false" UsesLoad="false" />
    <DiagramMoniker Name="DevOpsDiagram" />
  </Designer>
  <Explorer ExplorerGuid="4862bab5-3ef9-4f41-baf7-5415442935ef" Title="DevOpsDsl Explorer">
    <ExplorerBehaviorMoniker Name="DevOpsDsl/DevOpsDslExplorer" />
  </Explorer>
</Dsl>