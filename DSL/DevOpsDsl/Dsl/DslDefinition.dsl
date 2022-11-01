<?xml version="1.0" encoding="utf-8"?>
<Dsl xmlns:dm0="http://schemas.microsoft.com/VisualStudio/2008/DslTools/Core" dslVersion="1.0.0.0" Id="5af03ef8-bd8c-4744-90d5-5e9ee1e1d2aa" Description="Description for Variamos.DevOpsDsl.DevOpsDsl" Name="DevOpsDsl" DisplayName="DevOpsDsl" Namespace="Variamos.DevOpsDsl" ProductName="DevOpsDsl" CompanyName="Variamos" PackageGuid="dcd1f89d-000b-4058-8a43-beac92073e9f" PackageNamespace="Variamos.DevOpsDsl" xmlns="http://schemas.microsoft.com/VisualStudio/2005/DslTools/DslDefinitionModel">
  <Classes>
    <DomainClass Id="db8b3ebd-5f08-4607-9624-c334d61e065c" Description="The root in which all other elements are embedded. Appears as a diagram." Name="DevOps" DisplayName="DevOps" Namespace="Variamos.DevOpsDsl">
      <Properties>
        <DomainProperty Id="94107c8c-366b-492c-8fbb-5d2d15d302a6" Description="Description for Variamos.DevOpsDsl.DevOps.Model Name" Name="ModelName" DisplayName="Model Name">
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
            <DomainPath>DevOpsHasApplication.Application</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
      </ElementMergeDirectives>
    </DomainClass>
    <DomainClass Id="f949ca15-dd78-42a0-ac99-24f2afa6c886" Description="Description for Variamos.DevOpsDsl.Application" Name="Application" DisplayName="Application" Namespace="Variamos.DevOpsDsl">
      <Properties>
        <DomainProperty Id="4b1c5f9a-09eb-4b8c-ad25-e15aa5bd629a" Description="Description for Variamos.DevOpsDsl.Application.Application Name" Name="ApplicationName" DisplayName="Application Name">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="b35186f9-19ab-4a97-8cba-0a34c7713e94" Description="Description for Variamos.DevOpsDsl.Application.Cloud Platform" Name="CloudPlatform" DisplayName="Cloud Platform">
          <Type>
            <DomainEnumerationMoniker Name="CloudProvider" />
          </Type>
        </DomainProperty>
      </Properties>
      <ElementMergeDirectives>
        <ElementMergeDirective>
          <Index>
            <DomainClassMoniker Name="DevopsCategory" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>ApplicationHasDevopsCategories.DevopsCategories</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
      </ElementMergeDirectives>
    </DomainClass>
    <DomainClass Id="f1e36ca0-cf54-4987-98a8-e29d8d78f5a2" Description="Description for Variamos.DevOpsDsl.DevopsCategory" Name="DevopsCategory" DisplayName="Devops Category" Namespace="Variamos.DevOpsDsl">
      <Properties>
        <DomainProperty Id="6befe385-84c0-499f-bf6e-e1bc5ba05e83" Description="Description for Variamos.DevOpsDsl.DevopsCategory.Category Name" Name="CategoryName" DisplayName="Category Name">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
      <ElementMergeDirectives>
        <ElementMergeDirective>
          <Index>
            <DomainClassMoniker Name="DevopsPractice" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>DevopsCategoryHasDevopsPracticed.DevopsPracticed</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
      </ElementMergeDirectives>
    </DomainClass>
    <DomainClass Id="4f93e5a4-f9ef-4d17-9ccf-cdc28bae346d" Description="Description for Variamos.DevOpsDsl.DevopsPractice" Name="DevopsPractice" DisplayName="Devops Practice" Namespace="Variamos.DevOpsDsl">
      <Properties>
        <DomainProperty Id="ed16eb6a-4967-40b1-875d-33233aa3d240" Description="Description for Variamos.DevOpsDsl.DevopsPractice.Practice Name" Name="PracticeName" DisplayName="Practice Name">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
  </Classes>
  <Relationships>
    <DomainRelationship Id="ee361c5f-9b65-4dad-b7e7-f94701a5be89" Description="Description for Variamos.DevOpsDsl.DevOpsHasApplication" Name="DevOpsHasApplication" DisplayName="Dev Ops Has Application" Namespace="Variamos.DevOpsDsl" IsEmbedding="true">
      <Source>
        <DomainRole Id="6b3eba1b-4830-401d-b4dc-4a4241519cf3" Description="Description for Variamos.DevOpsDsl.DevOpsHasApplication.DevOps" Name="DevOps" DisplayName="Dev Ops" PropertyName="Application" Multiplicity="ZeroOne" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Application">
          <RolePlayer>
            <DomainClassMoniker Name="DevOps" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="b56c4e9c-280f-426b-abda-7ed9a4bf27fe" Description="Description for Variamos.DevOpsDsl.DevOpsHasApplication.Application" Name="Application" DisplayName="Application" PropertyName="DevOps" Multiplicity="ZeroOne" PropagatesDelete="true" PropertyDisplayName="Dev Ops">
          <RolePlayer>
            <DomainClassMoniker Name="Application" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="c7d3eda3-836d-4ecf-9de9-0200d5296964" Description="Description for Variamos.DevOpsDsl.ApplicationHasDevopsCategories" Name="ApplicationHasDevopsCategories" DisplayName="Application Has Devops Categories" Namespace="Variamos.DevOpsDsl" IsEmbedding="true">
      <Source>
        <DomainRole Id="9186feaa-18d2-4605-be82-2cfed238e31a" Description="Description for Variamos.DevOpsDsl.ApplicationHasDevopsCategories.Application" Name="Application" DisplayName="Application" PropertyName="DevopsCategories" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Devops Categories">
          <RolePlayer>
            <DomainClassMoniker Name="Application" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="9b606d58-fb4a-4f24-be5b-6b64c8b17fb4" Description="Description for Variamos.DevOpsDsl.ApplicationHasDevopsCategories.DevopsCategory" Name="DevopsCategory" DisplayName="Devops Category" PropertyName="Application" Multiplicity="ZeroOne" PropagatesDelete="true" PropertyDisplayName="Application">
          <RolePlayer>
            <DomainClassMoniker Name="DevopsCategory" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="2cb28fd8-57e4-44ed-b2b2-56a6502d74ae" Description="Description for Variamos.DevOpsDsl.DevopsCategoryHasDevopsPracticed" Name="DevopsCategoryHasDevopsPracticed" DisplayName="Devops Category Has Devops Practiced" Namespace="Variamos.DevOpsDsl" IsEmbedding="true">
      <Source>
        <DomainRole Id="e344dbb9-a558-48e2-9619-ec09247baa48" Description="Description for Variamos.DevOpsDsl.DevopsCategoryHasDevopsPracticed.DevopsCategory" Name="DevopsCategory" DisplayName="Devops Category" PropertyName="DevopsPracticed" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Devops Practiced">
          <RolePlayer>
            <DomainClassMoniker Name="DevopsCategory" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="c302e51b-4217-4081-b26a-53fc61e86c07" Description="Description for Variamos.DevOpsDsl.DevopsCategoryHasDevopsPracticed.DevopsPractice" Name="DevopsPractice" DisplayName="Devops Practice" PropertyName="DevopsCategory" Multiplicity="ZeroOne" PropagatesDelete="true" PropertyDisplayName="Devops Category">
          <RolePlayer>
            <DomainClassMoniker Name="DevopsPractice" />
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
  </Types>
  <Shapes>
    <GeometryShape Id="1207c5ad-f64d-42ff-bb2c-a58667e83a9a" Description="Description for Variamos.DevOpsDsl.ApplicationShape" Name="ApplicationShape" DisplayName="Application Shape" Namespace="Variamos.DevOpsDsl" FixedTooltipText="Application Shape" InitialHeight="1" Geometry="Rectangle">
      <ShapeHasDecorators Position="InnerTopCenter" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="NameDecorator" DisplayName="Name Decorator" DefaultText="NameDecorator" FontStyle="Bold" />
      </ShapeHasDecorators>
      <ShapeHasDecorators Position="InnerBottomCenter" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="CloudDecorator" DisplayName="Cloud Decorator" DefaultText="CloudDecorator" />
      </ShapeHasDecorators>
    </GeometryShape>
    <GeometryShape Id="0587efb5-116e-4ee7-8e7e-db28cbbb693e" Description="Description for Variamos.DevOpsDsl.DevopsCategoryShape" Name="DevopsCategoryShape" DisplayName="Devops Category Shape" Namespace="Variamos.DevOpsDsl" FixedTooltipText="Devops Category Shape" InitialHeight="1" Geometry="Rectangle">
      <ShapeHasDecorators Position="InnerTopCenter" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="NameDecorator" DisplayName="Name Decorator" DefaultText="NameDecorator" FontStyle="Bold" />
      </ShapeHasDecorators>
    </GeometryShape>
    <GeometryShape Id="7ab8c839-c9eb-4642-a614-83f47a96ce8e" Description="Description for Variamos.DevOpsDsl.DevopsPracticeShape" Name="DevopsPracticeShape" DisplayName="Devops Practice Shape" Namespace="Variamos.DevOpsDsl" FixedTooltipText="Devops Practice Shape" InitialHeight="1" Geometry="Rectangle">
      <ShapeHasDecorators Position="InnerTopCenter" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="NameDecorator" DisplayName="Name Decorator" DefaultText="NameDecorator" />
      </ShapeHasDecorators>
    </GeometryShape>
  </Shapes>
  <Connectors>
    <Connector Id="5d5bbc30-416c-4619-ac6c-5abed766db48" Description="Description for Variamos.DevOpsDsl.ApplicationCategoryConnector" Name="ApplicationCategoryConnector" DisplayName="Application Category Connector" Namespace="Variamos.DevOpsDsl" FixedTooltipText="Application Category Connector" />
    <Connector Id="36d0816f-e8b9-46c8-a8f2-9082133923c7" Description="Description for Variamos.DevOpsDsl.CategoryPracticeConnector" Name="CategoryPracticeConnector" DisplayName="Category Practice Connector" Namespace="Variamos.DevOpsDsl" FixedTooltipText="Category Practice Connector" />
  </Connectors>
  <XmlSerializationBehavior Name="DevOpsDslSerializationBehavior" Namespace="Variamos.DevOpsDsl">
    <ClassData>
      <XmlClassData TypeName="DevOps" MonikerAttributeName="" SerializeId="true" MonikerElementName="devOpsMoniker" ElementName="devOps" MonikerTypeName="DevOpsMoniker">
        <DomainClassMoniker Name="DevOps" />
        <ElementData>
          <XmlRelationshipData UseFullForm="true" RoleElementName="application">
            <DomainRelationshipMoniker Name="DevOpsHasApplication" />
          </XmlRelationshipData>
          <XmlPropertyData XmlName="modelName">
            <DomainPropertyMoniker Name="DevOps/ModelName" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="DevOpsHasApplication" MonikerAttributeName="" SerializeId="true" MonikerElementName="devOpsHasApplicationMoniker" ElementName="devOpsHasApplication" MonikerTypeName="DevOpsHasApplicationMoniker">
        <DomainRelationshipMoniker Name="DevOpsHasApplication" />
      </XmlClassData>
      <XmlClassData TypeName="Application" MonikerAttributeName="" SerializeId="true" MonikerElementName="applicationMoniker" ElementName="application" MonikerTypeName="ApplicationMoniker">
        <DomainClassMoniker Name="Application" />
        <ElementData>
          <XmlRelationshipData UseFullForm="true" RoleElementName="devopsCategories">
            <DomainRelationshipMoniker Name="ApplicationHasDevopsCategories" />
          </XmlRelationshipData>
          <XmlPropertyData XmlName="applicationName">
            <DomainPropertyMoniker Name="Application/ApplicationName" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="cloudPlatform">
            <DomainPropertyMoniker Name="Application/CloudPlatform" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="ApplicationHasDevopsCategories" MonikerAttributeName="" SerializeId="true" MonikerElementName="applicationHasDevopsCategoriesMoniker" ElementName="applicationHasDevopsCategories" MonikerTypeName="ApplicationHasDevopsCategoriesMoniker">
        <DomainRelationshipMoniker Name="ApplicationHasDevopsCategories" />
      </XmlClassData>
      <XmlClassData TypeName="DevopsCategory" MonikerAttributeName="" SerializeId="true" MonikerElementName="devopsCategoryMoniker" ElementName="devopsCategory" MonikerTypeName="DevopsCategoryMoniker">
        <DomainClassMoniker Name="DevopsCategory" />
        <ElementData>
          <XmlRelationshipData UseFullForm="true" RoleElementName="devopsPracticed">
            <DomainRelationshipMoniker Name="DevopsCategoryHasDevopsPracticed" />
          </XmlRelationshipData>
          <XmlPropertyData XmlName="categoryName">
            <DomainPropertyMoniker Name="DevopsCategory/CategoryName" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="DevopsCategoryHasDevopsPracticed" MonikerAttributeName="" SerializeId="true" MonikerElementName="devopsCategoryHasDevopsPracticedMoniker" ElementName="devopsCategoryHasDevopsPracticed" MonikerTypeName="DevopsCategoryHasDevopsPracticedMoniker">
        <DomainRelationshipMoniker Name="DevopsCategoryHasDevopsPracticed" />
      </XmlClassData>
      <XmlClassData TypeName="DevopsPractice" MonikerAttributeName="" SerializeId="true" MonikerElementName="devopsPracticeMoniker" ElementName="devopsPractice" MonikerTypeName="DevopsPracticeMoniker">
        <DomainClassMoniker Name="DevopsPractice" />
        <ElementData>
          <XmlPropertyData XmlName="practiceName">
            <DomainPropertyMoniker Name="DevopsPractice/PracticeName" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="DevopsDiagram" MonikerAttributeName="" SerializeId="true" MonikerElementName="devopsDiagramMoniker" ElementName="devopsDiagram" MonikerTypeName="DevopsDiagramMoniker">
        <DiagramMoniker Name="DevopsDiagram" />
      </XmlClassData>
      <XmlClassData TypeName="ApplicationShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="applicationShapeMoniker" ElementName="applicationShape" MonikerTypeName="ApplicationShapeMoniker">
        <GeometryShapeMoniker Name="ApplicationShape" />
      </XmlClassData>
      <XmlClassData TypeName="DevopsCategoryShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="devopsCategoryShapeMoniker" ElementName="devopsCategoryShape" MonikerTypeName="DevopsCategoryShapeMoniker">
        <GeometryShapeMoniker Name="DevopsCategoryShape" />
      </XmlClassData>
      <XmlClassData TypeName="DevopsPracticeShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="devopsPracticeShapeMoniker" ElementName="devopsPracticeShape" MonikerTypeName="DevopsPracticeShapeMoniker">
        <GeometryShapeMoniker Name="DevopsPracticeShape" />
      </XmlClassData>
      <XmlClassData TypeName="ApplicationCategoryConnector" MonikerAttributeName="" SerializeId="true" MonikerElementName="applicationCategoryConnectorMoniker" ElementName="applicationCategoryConnector" MonikerTypeName="ApplicationCategoryConnectorMoniker">
        <ConnectorMoniker Name="ApplicationCategoryConnector" />
      </XmlClassData>
      <XmlClassData TypeName="CategoryPracticeConnector" MonikerAttributeName="" SerializeId="true" MonikerElementName="categoryPracticeConnectorMoniker" ElementName="categoryPracticeConnector" MonikerTypeName="CategoryPracticeConnectorMoniker">
        <ConnectorMoniker Name="CategoryPracticeConnector" />
      </XmlClassData>
    </ClassData>
  </XmlSerializationBehavior>
  <ExplorerBehavior Name="DevOpsDslExplorer" />
  <Diagram Id="5298a462-96a5-4839-a10b-cee1a4c3caa1" Description="Description for Variamos.DevOpsDsl.DevopsDiagram" Name="DevopsDiagram" DisplayName="Devops Diagram" Namespace="Variamos.DevOpsDsl">
    <Class>
      <DomainClassMoniker Name="DevOps" />
    </Class>
    <ShapeMaps>
      <ShapeMap>
        <DomainClassMoniker Name="Application" />
        <ParentElementPath>
          <DomainPath>DevOpsHasApplication.DevOps/!DevOps</DomainPath>
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
          <TextDecoratorMoniker Name="ApplicationShape/CloudDecorator" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Application/CloudPlatform" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <GeometryShapeMoniker Name="ApplicationShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="DevopsCategory" />
        <ParentElementPath>
          <DomainPath>ApplicationHasDevopsCategories.Application/!Application/DevOpsHasApplication.DevOps/!DevOps</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="DevopsCategoryShape/NameDecorator" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="DevopsCategory/CategoryName" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <GeometryShapeMoniker Name="DevopsCategoryShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="DevopsPractice" />
        <ParentElementPath>
          <DomainPath>DevopsCategoryHasDevopsPracticed.DevopsCategory/!DevopsCategory/ApplicationHasDevopsCategories.Application/!Application/DevOpsHasApplication.DevOps/!DevOps</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="DevopsPracticeShape/NameDecorator" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="DevopsPractice/PracticeName" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <GeometryShapeMoniker Name="DevopsPracticeShape" />
      </ShapeMap>
    </ShapeMaps>
    <ConnectorMaps>
      <ConnectorMap>
        <ConnectorMoniker Name="ApplicationCategoryConnector" />
        <DomainRelationshipMoniker Name="ApplicationHasDevopsCategories" />
      </ConnectorMap>
      <ConnectorMap>
        <ConnectorMoniker Name="CategoryPracticeConnector" />
        <DomainRelationshipMoniker Name="DevopsCategoryHasDevopsPracticed" />
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
    <ToolboxTab TabText="DevOpsDsl">
      <ElementTool Name="ApplicationElementTool" ToolboxIcon="Resources\ExampleShapeToolBitmap.bmp" Caption="ApplicationElementTool" Tooltip="Application Element Tool" HelpKeyword="ApplicationElementTool">
        <DomainClassMoniker Name="Application" />
      </ElementTool>
    </ToolboxTab>
    <Validation UsesMenu="false" UsesOpen="false" UsesSave="false" UsesLoad="false" />
    <DiagramMoniker Name="DevopsDiagram" />
  </Designer>
  <Explorer ExplorerGuid="4862bab5-3ef9-4f41-baf7-5415442935ef" Title="DevOpsDsl Explorer">
    <ExplorerBehaviorMoniker Name="DevOpsDsl/DevOpsDslExplorer" />
  </Explorer>
</Dsl>