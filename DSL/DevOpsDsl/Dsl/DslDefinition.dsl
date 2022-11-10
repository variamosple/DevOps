<?xml version="1.0" encoding="utf-8"?>
<Dsl xmlns:dm0="http://schemas.microsoft.com/VisualStudio/2008/DslTools/Core" dslVersion="1.0.0.0" Id="5af03ef8-bd8c-4744-90d5-5e9ee1e1d2aa" Description="Description for Variamos.DevOpsDsl.DevOpsDsl" Name="DevOpsDsl" DisplayName="DevOps Model" Namespace="Variamos.DevOpsDsl" ProductName="DevOpsDsl" CompanyName="Variamos" PackageGuid="dcd1f89d-000b-4058-8a43-beac92073e9f" PackageNamespace="Variamos.DevOpsDsl" xmlns="http://schemas.microsoft.com/VisualStudio/2005/DslTools/DslDefinitionModel">
  <Classes>
    <DomainClass Id="53fa3ae4-60e5-44d4-9a97-0d287f987aa9" Description="Application to be implemnted DevOps best practices" Name="Application" DisplayName="Application" Namespace="Variamos.DevOpsDsl">
      <Properties>
        <DomainProperty Id="e449a9e4-b5b2-4013-8a30-7ad6f145e609" Description="Name of the Application" Name="ApplicationName" DisplayName="Application Name" DefaultValue="My application" IsElementName="true">
          <Notes>Name of the Application</Notes>
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="0ad05fd2-69be-4ea1-abb1-d68bfdec89d9" Description="Cloud provider that host the application" Name="CloudProvider" DisplayName="Cloud Provider">
          <Type>
            <DomainEnumerationMoniker Name="CloudProvider" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="90ce1392-a03b-46df-b086-e79a8d97d857" Description="Description for Variamos.DevOpsDsl.Application.Architectural Style" Name="ArchitecturalStyle" DisplayName="Architectural Style">
          <Type>
            <DomainEnumerationMoniker Name="ArchitecturalStyles" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="bc7e168c-8c5d-428f-ba4e-427268b33f96" Description="Version of the model" Name="ModelVersion" DisplayName="Model Version" DefaultValue="0.0.0">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
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
        <ElementMergeDirective>
          <Index>
            <DomainClassMoniker Name="Sre" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>ApplicationHasSre.Sre</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
      </ElementMergeDirectives>
    </DomainClass>
    <DomainClass Id="89646196-a8a0-4186-a288-4384229596fd" Description="Description for Variamos.DevOpsDsl.Container" Name="Container" DisplayName="Container" Namespace="Variamos.DevOpsDsl">
      <Properties>
        <DomainProperty Id="7e652c65-8339-43a0-a5ca-5373d18d416d" Description="Description for Variamos.DevOpsDsl.Container.Container Name" Name="ContainerName" DisplayName="Container Name" DefaultValue="My container" IsElementName="true">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="dc7f5787-9f3a-4049-adcd-d9f9b406bd08" Description="Description for Variamos.DevOpsDsl.Container.Container Type" Name="ContainerType" DisplayName="Container Type">
          <Type>
            <DomainEnumerationMoniker Name="ContainerType" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="526dfc90-984b-4d31-8d8a-a8139cd3f40f" Description="Description for Variamos.DevOpsDsl.Container.Container Framework" Name="ContainerFramework" DisplayName="Container Framework">
          <Type>
            <DomainEnumerationMoniker Name="DevelopmentFrameworks" />
          </Type>
        </DomainProperty>
      </Properties>
      <ElementMergeDirectives>
        <ElementMergeDirective>
          <Index>
            <DomainClassMoniker Name="Practice" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>ContainerHasPracticed.Practiced</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
      </ElementMergeDirectives>
    </DomainClass>
    <DomainClass Id="3fba09f1-07e3-4ebf-8039-06613d70913a" Description="Description for Variamos.DevOpsDsl.Practice" Name="Practice" DisplayName="DevOps Practice" Namespace="Variamos.DevOpsDsl">
      <Properties>
        <DomainProperty Id="7fa1949c-3098-44bf-8744-69103252f3d1" Description="Description for Variamos.DevOpsDsl.Practice.Practice Type" Name="PracticeType" DisplayName="Practice Type">
          <Type>
            <DomainEnumerationMoniker Name="DevOpsPractices" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="68410d3a-4f59-4cfe-bb57-49ba196ab5c1" Description="Description for Variamos.DevOpsDsl.Practice.Practice Name" Name="PracticeName" DisplayName="Practice Name" DefaultValue="Practice.PracticeName" Kind="Calculated" IsElementName="true">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
    <DomainClass Id="cd85ddf3-cf78-4e6e-a2a9-53bd67fd1ca0" Description="Site Reliability Engineering settings for the application" Name="Sre" DisplayName="SRE Definition" Namespace="Variamos.DevOpsDsl">
      <Properties>
        <DomainProperty Id="42cd10a9-2f6e-4447-aa29-dd1ea3a4eb18" Description="Description for Variamos.DevOpsDsl.Sre.Sre Name" Name="SreName" DisplayName="Sre Name" DefaultValue="Application SRE" IsElementName="true">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
      <ElementMergeDirectives>
        <ElementMergeDirective>
          <Index>
            <DomainClassMoniker Name="SLO" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>SreHasSLO.SLO</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
      </ElementMergeDirectives>
    </DomainClass>
    <DomainClass Id="293b3fb7-811a-4759-8baa-2f7d8109a2b5" Description="Service Level Objetive" Name="SLO" DisplayName="SLO" Namespace="Variamos.DevOpsDsl">
      <Notes>Service Level Objetive</Notes>
      <Properties>
        <DomainProperty Id="f71cdc4e-bf61-4a61-8d00-c0968adf2193" Description="Description for Variamos.DevOpsDsl.SLO.Slo Name" Name="SloName" DisplayName="Slo Name">
          <Type>
            <DomainEnumerationMoniker Name="SLI" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="4a3ebddf-54b7-4aa5-a06e-0ed06b58b789" Description="Description for Variamos.DevOpsDsl.SLO.Lower Bound" Name="LowerBound" DisplayName="Lower Bound" DefaultValue="0">
          <Type>
            <ExternalTypeMoniker Name="/System/Double" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="5a5cfa5d-e4e0-49c0-913f-c76ab29aff9e" Description="Description for Variamos.DevOpsDsl.SLO.Upper Bound" Name="UpperBound" DisplayName="Upper Bound">
          <Type>
            <ExternalTypeMoniker Name="/System/Double" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="e674faf8-19f5-4427-b5f8-82e4f7c0cfbd" Description="Description for Variamos.DevOpsDsl.SLO.Description" Name="Description" DisplayName="Description">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="75c2f44a-0caa-41c6-b74f-8e9f812c42da" Description="Description for Variamos.DevOpsDsl.SLO.Operator" Name="Operator" DisplayName="Operator">
          <Type>
            <DomainEnumerationMoniker Name="ComparisonOperator" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
  </Classes>
  <Relationships>
    <DomainRelationship Id="b66acc16-ee54-4251-b928-007a38cc3e15" Description="Description for Variamos.DevOpsDsl.ApplicationHasContainers" Name="ApplicationHasContainers" DisplayName="DevOps Model" Namespace="Variamos.DevOpsDsl" IsEmbedding="true">
      <Source>
        <DomainRole Id="44f85076-c197-4de1-af0d-7deca5793366" Description="Description for Variamos.DevOpsDsl.ApplicationHasContainers.Application" Name="Application" DisplayName="Application" PropertyName="Containers" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Containers">
          <RolePlayer>
            <DomainClassMoniker Name="Application" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="5b862f38-ad09-4bb8-9f80-1b6e44397633" Description="Description for Variamos.DevOpsDsl.ApplicationHasContainers.Container" Name="Container" DisplayName="Container" PropertyName="Application" Multiplicity="One" PropagatesDelete="true" PropertyDisplayName="Application">
          <RolePlayer>
            <DomainClassMoniker Name="Container" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="1a31614f-2028-4783-9531-035dfea87223" Description="Description for Variamos.DevOpsDsl.ContainerHasPracticed" Name="ContainerHasPracticed" DisplayName="DevOps Model" Namespace="Variamos.DevOpsDsl" IsEmbedding="true">
      <Source>
        <DomainRole Id="55a60d90-0958-42c8-b32e-3b9cad7a2ce7" Description="Description for Variamos.DevOpsDsl.ContainerHasPracticed.Container" Name="Container" DisplayName="Container" PropertyName="Practiced" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Practiced">
          <RolePlayer>
            <DomainClassMoniker Name="Container" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="7d65ec8e-9f36-4ae5-b1ab-56d3f3eeab77" Description="Description for Variamos.DevOpsDsl.ContainerHasPracticed.Practice" Name="Practice" DisplayName="Practice" PropertyName="Container" Multiplicity="One" PropagatesDelete="true" PropertyDisplayName="Container">
          <RolePlayer>
            <DomainClassMoniker Name="Practice" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="d6178439-70f3-4caa-86c6-8a77bc9a297f" Description="Description for Variamos.DevOpsDsl.ApplicationHasSre" Name="ApplicationHasSre" DisplayName="DevOps Model" Namespace="Variamos.DevOpsDsl" IsEmbedding="true">
      <Source>
        <DomainRole Id="39c9fc53-52d0-4c99-90ed-4c9dd0353d1a" Description="Description for Variamos.DevOpsDsl.ApplicationHasSre.Application" Name="Application" DisplayName="Application" PropertyName="Sre" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Sre">
          <RolePlayer>
            <DomainClassMoniker Name="Application" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="e848aa64-843b-4900-9201-8be14b0a32eb" Description="Description for Variamos.DevOpsDsl.ApplicationHasSre.Sre" Name="Sre" DisplayName="Sre" PropertyName="Application" Multiplicity="One" PropagatesDelete="true" PropertyDisplayName="Application">
          <RolePlayer>
            <DomainClassMoniker Name="Sre" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="c4ce16a9-afe8-48a2-b947-7fae73bf2322" Description="Description for Variamos.DevOpsDsl.SreHasSLO" Name="SreHasSLO" DisplayName="DevOps Model" Namespace="Variamos.DevOpsDsl" IsEmbedding="true">
      <Source>
        <DomainRole Id="dd60049d-a5ce-4c63-875d-dc321715fc6d" Description="Description for Variamos.DevOpsDsl.SreHasSLO.Sre" Name="Sre" DisplayName="Sre" PropertyName="SLO" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="SLO">
          <RolePlayer>
            <DomainClassMoniker Name="Sre" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="c071c337-d176-40ea-ba34-15e340eadd41" Description="Description for Variamos.DevOpsDsl.SreHasSLO.SLO" Name="SLO" DisplayName="SLO" PropertyName="Sre" Multiplicity="One" PropagatesDelete="true" PropertyDisplayName="Sre">
          <RolePlayer>
            <DomainClassMoniker Name="SLO" />
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
    <DomainEnumeration Name="ContainerType" Namespace="Variamos.DevOpsDsl" Description="Description for Variamos.DevOpsDsl.ContainerType">
      <Literals>
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.ContainerType.WebApplication" Name="WebApplication" Value="1" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.ContainerType.Api" Name="Api" Value="2" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.ContainerType.MobilApp" Name="MobilApp" Value="0" />
      </Literals>
    </DomainEnumeration>
    <DomainEnumeration Name="ArchitecturalStyles" Namespace="Variamos.DevOpsDsl" Description="Description for Variamos.DevOpsDsl.ArchitecturalStyles">
      <Literals>
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.ArchitecturalStyles.NTierApplication" Name="NTierApplication" Value="1" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.ArchitecturalStyles.Microservices" Name="Microservices" Value="2" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.ArchitecturalStyles.WebQueueWorker" Name="WebQueueWorker" Value="4" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.ArchitecturalStyles.BigCompute" Name="BigCompute" Value="0" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.ArchitecturalStyles.BigData" Name="BigData" Value="5" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.ArchitecturalStyles.EventDriven" Name="EventDriven" Value="3" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.ArchitecturalStyles.EnumerationLiteral1" Name="EnumerationLiteral1" Value="" />
      </Literals>
    </DomainEnumeration>
    <DomainEnumeration Name="DevOpsPractices" Namespace="Variamos.DevOpsDsl" Description="Description for Variamos.DevOpsDsl.DevOpsPractices">
      <Literals>
        <EnumerationLiteral Description="Continuous Integration (CI): Behavior-driven development (BDD)" Name="CiBehaviorDrivenDevelopment" Value="0" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.DevOpsPractices.CpInfrastructureAsCode" Name="CpInfrastructureAsCode" Value="1" />
        <EnumerationLiteral Description="Continuous Planning (CP): Strategy and portofolio planning" Name="CpStrategyPortofolioPlanning" Value="2" />
        <EnumerationLiteral Description="Continuous Planning (CP): Lean product planning" Name="CpLeanProductPlanning" Value="3" />
        <EnumerationLiteral Description="Continuous Planning (CP): Release planning" Name="CpReleasePlanning" Value="4" />
        <EnumerationLiteral Description="Continuous Planning (CP): Sprint planning" Name="CpSprintPlanning" Value="5" />
        <EnumerationLiteral Description="Continuous Planning (CP): Agile requirement management" Name="CpAgileRequirementManagement" Value="6" />
        <EnumerationLiteral Description="Continuous Planning (CP): Security requirement" Name="CpSecurityRequirement" Value="7" />
        <EnumerationLiteral Description="Continuous Planning (CP): Architecture design" Name="CpArchitectureDesign" Value="8" />
        <EnumerationLiteral Description="Continuous Planning (CP): Capacity planning" Name="CpCapacityPlanning" Value="9" />
        <EnumerationLiteral Description="Continuous Planning (CP): UX architecture design" Name="CpUxArchitectureDesign" Value="11" />
        <EnumerationLiteral Description="Continuous Planning (CP): Thread modeling" Name="CpThreadModeling" Value="12" />
        <EnumerationLiteral Description="Continuous Planning (CP): Value stream mapping" Name="CpValueStreamMapping" Value="13" />
      </Literals>
    </DomainEnumeration>
    <DomainEnumeration Name="DevelopmentFrameworks" Namespace="Variamos.DevOpsDsl" Description="Description for Variamos.DevOpsDsl.DevelopmentFrameworks">
      <Literals>
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.DevelopmentFrameworks.Java" Name="Java" Value="0" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.DevelopmentFrameworks.DotNet" Name="DotNet" Value="1" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.DevelopmentFrameworks.Spring" Name="Spring" Value="2" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.DevelopmentFrameworks.NodeJS" Name="NodeJS" Value="3" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.DevelopmentFrameworks.Python" Name="Python" Value="4" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.DevelopmentFrameworks.React" Name="React" Value="5" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.DevelopmentFrameworks.VueJS" Name="VueJS" Value="6" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.DevelopmentFrameworks.Angular" Name="Angular" Value="7" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.DevelopmentFrameworks.ReactNative" Name="ReactNative" Value="7" />
        <EnumerationLiteral Description="Description for Variamos.DevOpsDsl.DevelopmentFrameworks.Xcode" Name="Xcode" Value="8" />
      </Literals>
    </DomainEnumeration>
    <DomainEnumeration Name="SLI" Namespace="Variamos.DevOpsDsl" Description="Description for Variamos.DevOpsDsl.SLI">
      <Literals>
        <EnumerationLiteral Description="How long it takes to return a response to a request, in seconds" Name="RequestLatency" Value="0">
          <Notes>How long it takes to return a response to a request, in seconds</Notes>
        </EnumerationLiteral>
        <EnumerationLiteral Description="Expressed as a fraction of all requests received" Name="ErrorRate" Value="1">
          <Notes>Expressed as a fraction of all requests received</Notes>
        </EnumerationLiteral>
        <EnumerationLiteral Description="Measured in requests per second (QPS)" Name="SystemThroughput" Value="">
          <Notes>Measured in requests per second (QPS)</Notes>
        </EnumerationLiteral>
        <EnumerationLiteral Description="The fraction of the time that a service is usable" Name="Availability" Value="">
          <Notes>The fraction of the time that a service is usable</Notes>
        </EnumerationLiteral>
      </Literals>
    </DomainEnumeration>
    <DomainEnumeration Name="ComparisonOperator" Namespace="Variamos.DevOpsDsl" Description="Description for Variamos.DevOpsDsl.ComparisonOperator">
      <Literals>
        <EnumerationLiteral Description="Less than" Name="LessThan" Value="0" />
        <EnumerationLiteral Description="Between" Name="Between" Value="1" />
        <EnumerationLiteral Description="Grater than" Name="GratherThan" Value="2" />
      </Literals>
    </DomainEnumeration>
  </Types>
  <Shapes>
    <GeometryShape Id="d7e872c2-b2b8-408a-8805-304f48a2f8cc" Description="Description for Variamos.DevOpsDsl.PracticeShape" Name="PracticeShape" DisplayName="Practice Shape" Namespace="Variamos.DevOpsDsl" FixedTooltipText="Practice Shape" InitialHeight="1" Geometry="Rectangle">
      <ShapeHasDecorators Position="InnerTopCenter" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="NameDecorator" DisplayName="Name Decorator" DefaultText="NameDecorator" FontStyle="Bold" FontSize="10" />
      </ShapeHasDecorators>
      <ShapeHasDecorators Position="Center" HorizontalOffset="0" VerticalOffset="0">
        <IconDecorator Name="IconDecorator" DisplayName="Icon Decorator" DefaultIcon="Resources\DevOpsIcon.png" />
      </ShapeHasDecorators>
    </GeometryShape>
    <GeometryShape Id="1f477189-8a64-42e2-994b-b0c1e42e32f1" Description="Description for Variamos.DevOpsDsl.ContainerShape" Name="ContainerShape" DisplayName="Container Shape" Namespace="Variamos.DevOpsDsl" FixedTooltipText="Container Shape" InitialHeight="1" Geometry="Rectangle">
      <ShapeHasDecorators Position="InnerTopCenter" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="NameDecorator" DisplayName="Name Decorator" DefaultText="NameDecorator" FontStyle="Bold" FontSize="12" />
      </ShapeHasDecorators>
      <ShapeHasDecorators Position="InnerBottomCenter" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="ContinerTypeDecorator" DisplayName="Continer Type Decorator" DefaultText="ContinerTypeDecorator" />
      </ShapeHasDecorators>
      <ShapeHasDecorators Position="InnerBottomLeft" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="FrameworkDecorator" DisplayName="Framework Decorator" DefaultText="FrameworkDecorator" />
      </ShapeHasDecorators>
      <ShapeHasDecorators Position="Center" HorizontalOffset="0" VerticalOffset="0">
        <IconDecorator Name="IconDecorator" DisplayName="Icon Decorator" DefaultIcon="Resources\ProcessorIcon_9.png" />
      </ShapeHasDecorators>
    </GeometryShape>
    <GeometryShape Id="09345c75-0057-4454-bf2f-67b9116f8717" Description="Description for Variamos.DevOpsDsl.SloShape" Name="SloShape" DisplayName="Slo Shape" Namespace="Variamos.DevOpsDsl" FixedTooltipText="Slo Shape" InitialHeight="1" Geometry="Rectangle">
      <ShapeHasDecorators Position="InnerTopCenter" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="NameDecorator" DisplayName="Name Decorator" DefaultText="NameDecorator" FontStyle="Bold" FontSize="12" />
      </ShapeHasDecorators>
      <ShapeHasDecorators Position="InnerBottomLeft" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="LowerBoundDecorator" DisplayName="Lower Bound Decorator" DefaultText="LowerBoundDecorator" />
      </ShapeHasDecorators>
      <ShapeHasDecorators Position="InnerBottomRight" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="UpperDecorator" DisplayName="Upper Decorator" DefaultText="UpperDecorator" />
      </ShapeHasDecorators>
      <ShapeHasDecorators Position="InnerBottomCenter" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="OperatorDecorator" DisplayName="Operator Decorator" DefaultText="OperatorDecorator" />
      </ShapeHasDecorators>
      <ShapeHasDecorators Position="Center" HorizontalOffset="0" VerticalOffset="0">
        <IconDecorator Name="IconDecorator" DisplayName="Icon Decorator" DefaultIcon="Resources\SloIcon.png" />
      </ShapeHasDecorators>
    </GeometryShape>
    <GeometryShape Id="6353d8f5-88c0-4a44-a0db-20c490f838f7" Description="Description for Variamos.DevOpsDsl.SreShape" Name="SreShape" DisplayName="Sre Shape" Namespace="Variamos.DevOpsDsl" FixedTooltipText="Sre Shape" InitialHeight="1" Geometry="Rectangle">
      <ShapeHasDecorators Position="InnerTopCenter" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="NameDecorator" DisplayName="Name Decorator" DefaultText="NameDecorator" FontStyle="Bold" FontSize="12" />
      </ShapeHasDecorators>
      <ShapeHasDecorators Position="Center" HorizontalOffset="0" VerticalOffset="0">
        <IconDecorator Name="IconDecorator" DisplayName="Icon Decorator" DefaultIcon="Resources\SreIcon.png" />
      </ShapeHasDecorators>
    </GeometryShape>
  </Shapes>
  <Connectors>
    <Connector Id="2e9b8dab-b453-4eac-95e4-4bcd75e4c400" Description="Description for Variamos.DevOpsDsl.ApplicationContainerConnector" Name="ApplicationContainerConnector" DisplayName="Application Container Connector" Namespace="Variamos.DevOpsDsl" FixedTooltipText="Application Container Connector" RoutingStyle="Straight" />
    <Connector Id="737a3e1f-5d9b-4fcb-90e9-8ddc4ee3dbc7" Description="Description for Variamos.DevOpsDsl.SreSloConnector" Name="SreSloConnector" DisplayName="Sre Slo Connector" Namespace="Variamos.DevOpsDsl" FixedTooltipText="Sre Slo Connector" />
  </Connectors>
  <XmlSerializationBehavior Name="DevOpsDslSerializationBehavior" Namespace="Variamos.DevOpsDsl">
    <ClassData>
      <XmlClassData TypeName="DevOpsDiagram" MonikerAttributeName="" SerializeId="true" MonikerElementName="devOpsDiagramMoniker" ElementName="devOpsDiagram" MonikerTypeName="DevOpsDiagramMoniker">
        <DiagramMoniker Name="DevOpsDiagram" />
        <ElementData>
          <XmlPropertyData XmlName="diamgramName">
            <DomainPropertyMoniker Name="DevOpsDiagram/DiamgramName" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="PracticeShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="practiceShapeMoniker" ElementName="practiceShape" MonikerTypeName="PracticeShapeMoniker">
        <GeometryShapeMoniker Name="PracticeShape" />
      </XmlClassData>
      <XmlClassData TypeName="Application" MonikerAttributeName="" SerializeId="true" MonikerElementName="applicationMoniker" ElementName="application" MonikerTypeName="ApplicationMoniker">
        <DomainClassMoniker Name="Application" />
        <ElementData>
          <XmlRelationshipData UseFullForm="true" RoleElementName="containers">
            <DomainRelationshipMoniker Name="ApplicationHasContainers" />
          </XmlRelationshipData>
          <XmlPropertyData XmlName="applicationName">
            <DomainPropertyMoniker Name="Application/ApplicationName" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="cloudProvider">
            <DomainPropertyMoniker Name="Application/CloudProvider" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="architecturalStyle">
            <DomainPropertyMoniker Name="Application/ArchitecturalStyle" />
          </XmlPropertyData>
          <XmlRelationshipData UseFullForm="true" RoleElementName="sre">
            <DomainRelationshipMoniker Name="ApplicationHasSre" />
          </XmlRelationshipData>
          <XmlPropertyData XmlName="modelVersion">
            <DomainPropertyMoniker Name="Application/ModelVersion" />
          </XmlPropertyData>
        </ElementData>
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
          <XmlRelationshipData UseFullForm="true" RoleElementName="practiced">
            <DomainRelationshipMoniker Name="ContainerHasPracticed" />
          </XmlRelationshipData>
          <XmlPropertyData XmlName="containerType">
            <DomainPropertyMoniker Name="Container/ContainerType" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="containerFramework">
            <DomainPropertyMoniker Name="Container/ContainerFramework" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="ContainerShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="containerShapeMoniker" ElementName="containerShape" MonikerTypeName="ContainerShapeMoniker">
        <GeometryShapeMoniker Name="ContainerShape" />
      </XmlClassData>
      <XmlClassData TypeName="ContainerHasPracticed" MonikerAttributeName="" SerializeId="true" MonikerElementName="containerHasPracticedMoniker" ElementName="containerHasPracticed" MonikerTypeName="ContainerHasPracticedMoniker">
        <DomainRelationshipMoniker Name="ContainerHasPracticed" />
      </XmlClassData>
      <XmlClassData TypeName="Practice" MonikerAttributeName="" SerializeId="true" MonikerElementName="practiceMoniker" ElementName="practice" MonikerTypeName="PracticeMoniker">
        <DomainClassMoniker Name="Practice" />
        <ElementData>
          <XmlPropertyData XmlName="practiceType">
            <DomainPropertyMoniker Name="Practice/PracticeType" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="practiceName" Representation="Ignore">
            <DomainPropertyMoniker Name="Practice/PracticeName" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="ApplicationContainerConnector" MonikerAttributeName="" SerializeId="true" MonikerElementName="applicationContainerConnectorMoniker" ElementName="applicationContainerConnector" MonikerTypeName="ApplicationContainerConnectorMoniker">
        <ConnectorMoniker Name="ApplicationContainerConnector" />
      </XmlClassData>
      <XmlClassData TypeName="ApplicationHasSre" MonikerAttributeName="" SerializeId="true" MonikerElementName="applicationHasSreMoniker" ElementName="applicationHasSre" MonikerTypeName="ApplicationHasSreMoniker">
        <DomainRelationshipMoniker Name="ApplicationHasSre" />
      </XmlClassData>
      <XmlClassData TypeName="Sre" MonikerAttributeName="" SerializeId="true" MonikerElementName="sreMoniker" ElementName="sre" MonikerTypeName="SreMoniker">
        <DomainClassMoniker Name="Sre" />
        <ElementData>
          <XmlRelationshipData UseFullForm="true" RoleElementName="sLO">
            <DomainRelationshipMoniker Name="SreHasSLO" />
          </XmlRelationshipData>
          <XmlPropertyData XmlName="sreName">
            <DomainPropertyMoniker Name="Sre/SreName" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="SreHasSLO" MonikerAttributeName="" SerializeId="true" MonikerElementName="sreHasSLOMoniker" ElementName="sreHasSLO" MonikerTypeName="SreHasSLOMoniker">
        <DomainRelationshipMoniker Name="SreHasSLO" />
      </XmlClassData>
      <XmlClassData TypeName="SLO" MonikerAttributeName="" SerializeId="true" MonikerElementName="sLOMoniker" ElementName="sLO" MonikerTypeName="SLOMoniker">
        <DomainClassMoniker Name="SLO" />
        <ElementData>
          <XmlPropertyData XmlName="sloName">
            <DomainPropertyMoniker Name="SLO/SloName" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="lowerBound">
            <DomainPropertyMoniker Name="SLO/LowerBound" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="upperBound">
            <DomainPropertyMoniker Name="SLO/UpperBound" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="description">
            <DomainPropertyMoniker Name="SLO/Description" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="operator">
            <DomainPropertyMoniker Name="SLO/Operator" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="SloShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="sloShapeMoniker" ElementName="sloShape" MonikerTypeName="SloShapeMoniker">
        <GeometryShapeMoniker Name="SloShape" />
      </XmlClassData>
      <XmlClassData TypeName="SreShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="sreShapeMoniker" ElementName="sreShape" MonikerTypeName="SreShapeMoniker">
        <GeometryShapeMoniker Name="SreShape" />
      </XmlClassData>
      <XmlClassData TypeName="SreSloConnector" MonikerAttributeName="" SerializeId="true" MonikerElementName="sreSloConnectorMoniker" ElementName="sreSloConnector" MonikerTypeName="SreSloConnectorMoniker">
        <ConnectorMoniker Name="SreSloConnector" />
      </XmlClassData>
    </ClassData>
  </XmlSerializationBehavior>
  <ExplorerBehavior Name="DevOpsDslExplorer" />
  <Diagram Id="aa0ce2b2-1fa5-458a-82dd-05d3b4d5e591" Description="Description for Variamos.DevOpsDsl.DevOpsDiagram" Name="DevOpsDiagram" DisplayName="DevOps Diagram" Namespace="Variamos.DevOpsDsl">
    <Properties>
      <DomainProperty Id="5613bec2-725d-4f55-8ee8-0f27bc54f13a" Description="Name of the diagram" Name="DiamgramName" DisplayName="Diamgram Name" DefaultValue="My diagram">
        <Type>
          <ExternalTypeMoniker Name="/System/String" />
        </Type>
      </DomainProperty>
    </Properties>
    <Class>
      <DomainClassMoniker Name="Application" />
    </Class>
    <ShapeMaps>
      <ShapeMap>
        <DomainClassMoniker Name="Container" />
        <ParentElementPath>
          <DomainPath>ApplicationHasContainers.Application/!Application</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="ContainerShape/NameDecorator" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Container/ContainerName" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <DecoratorMap>
          <TextDecoratorMoniker Name="ContainerShape/ContinerTypeDecorator" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Container/ContainerType" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <DecoratorMap>
          <TextDecoratorMoniker Name="ContainerShape/FrameworkDecorator" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Container/ContainerFramework" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <GeometryShapeMoniker Name="ContainerShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="Practice" />
        <ParentElementPath>
          <DomainPath>ContainerHasPracticed.Container/!Container/ApplicationHasContainers.Application/!Application</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="PracticeShape/NameDecorator" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Practice/PracticeType" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <DecoratorMap>
          <TextDecoratorMoniker Name="ContainerShape/NameDecorator" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Practice/PracticeType" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <GeometryShapeMoniker Name="PracticeShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="Sre" />
        <ParentElementPath>
          <DomainPath>ApplicationHasSre.Application/!Application</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="SreShape/NameDecorator" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Sre/SreName" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <GeometryShapeMoniker Name="SreShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="SLO" />
        <ParentElementPath>
          <DomainPath>SreHasSLO.Sre/!Sre/ApplicationHasSre.Application/!Application</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="SloShape/NameDecorator" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="SLO/SloName" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <DecoratorMap>
          <TextDecoratorMoniker Name="SloShape/LowerBoundDecorator" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="SLO/LowerBound" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <DecoratorMap>
          <TextDecoratorMoniker Name="SloShape/OperatorDecorator" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="SLO/Operator" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <DecoratorMap>
          <TextDecoratorMoniker Name="SloShape/UpperDecorator" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="SLO/UpperBound" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <GeometryShapeMoniker Name="SloShape" />
      </ShapeMap>
    </ShapeMaps>
    <ConnectorMaps>
      <ConnectorMap>
        <ConnectorMoniker Name="ApplicationContainerConnector" />
        <DomainRelationshipMoniker Name="ContainerHasPracticed" />
      </ConnectorMap>
      <ConnectorMap>
        <ConnectorMoniker Name="SreSloConnector" />
        <DomainRelationshipMoniker Name="SreHasSLO" />
      </ConnectorMap>
    </ConnectorMaps>
  </Diagram>
  <Designer CopyPasteGeneration="CopyPasteOnly" FileExtension="DevOpsDsl" EditorGuid="35fae0cc-3108-4123-8cf1-c38d1633276a">
    <RootClass>
      <DomainClassMoniker Name="Application" />
    </RootClass>
    <XmlSerializationDefinition CustomPostLoad="false">
      <XmlSerializationBehaviorMoniker Name="DevOpsDslSerializationBehavior" />
    </XmlSerializationDefinition>
    <ToolboxTab TabText="DevOpsDsl" />
    <Validation UsesMenu="false" UsesOpen="false" UsesSave="false" UsesLoad="false" />
    <DiagramMoniker Name="DevOpsDiagram" />
  </Designer>
  <Explorer ExplorerGuid="4862bab5-3ef9-4f41-baf7-5415442935ef" Title="DevOps DSL">
    <ExplorerBehaviorMoniker Name="DevOpsDsl/DevOpsDslExplorer" />
  </Explorer>
</Dsl>