﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using DslModeling = global::Microsoft.VisualStudio.Modeling;
using DslDesign = global::Microsoft.VisualStudio.Modeling.Design;
using DslDiagrams = global::Microsoft.VisualStudio.Modeling.Diagrams;
namespace Variamos.DevOpsDsl
{
	/// <summary>
	/// DomainModel DevOpsDslDomainModel
	/// Description for Variamos.DevOpsDsl.DevOpsDsl
	/// </summary>
	[DslDesign::DisplayNameResource("Variamos.DevOpsDsl.DevOpsDslDomainModel.DisplayName", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
	[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsDslDomainModel.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
	[global::System.CLSCompliant(true)]
	[DslModeling::DependsOnDomainModel(typeof(global::Microsoft.VisualStudio.Modeling.CoreDomainModel))]
	[DslModeling::DependsOnDomainModel(typeof(global::Microsoft.VisualStudio.Modeling.Diagrams.CoreDesignSurfaceDomainModel))]
	[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1506:AvoidExcessiveClassCoupling", Justification = "Generated code.")]
	[DslModeling::DomainObjectId("5af03ef8-bd8c-4744-90d5-5e9ee1e1d2aa")]
	public partial class DevOpsDslDomainModel : DslModeling::DomainModel
	{
		#region Constructor, domain model Id
	
		/// <summary>
		/// DevOpsDslDomainModel domain model Id.
		/// </summary>
		public static readonly global::System.Guid DomainModelId = new global::System.Guid(0x5af03ef8, 0xbd8c, 0x4744, 0x90, 0xd5, 0x5e, 0x9e, 0xe1, 0xe1, 0xd2, 0xaa);
	
		/// <summary>
		/// Constructor.
		/// </summary>
		/// <param name="store">Store containing the domain model.</param>
		public DevOpsDslDomainModel(DslModeling::Store store)
			: base(store, DomainModelId)
		{
			// Call the partial method to allow any required serialization setup to be done.
			this.InitializeSerialization(store);		
		}
		
	
		///<Summary>
		/// Defines a partial method that will be called from the constructor to
		/// allow any necessary serialization setup to be done.
		///</Summary>
		///<remarks>
		/// For a DSL created with the DSL Designer wizard, an implementation of this 
		/// method will be generated in the GeneratedCode\SerializationHelper.cs class.
		///</remarks>
		partial void InitializeSerialization(DslModeling::Store store);
	
	
		#endregion
		#region Domain model reflection
			
		/// <summary>
		/// Gets the list of generated domain model types (classes, rules, relationships).
		/// </summary>
		/// <returns>List of types.</returns>
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1506:AvoidExcessiveClassCoupling", Justification = "Generated code.")]	
		protected sealed override global::System.Type[] GetGeneratedDomainModelTypes()
		{
			return new global::System.Type[]
			{
				typeof(Application),
				typeof(Container),
				typeof(Practice),
				typeof(Sre),
				typeof(SLO),
				typeof(ApplicationHasContainers),
				typeof(ContainerHasPracticed),
				typeof(ApplicationHasSre),
				typeof(SreHasSLO),
				typeof(DevOpsDiagram),
				typeof(ApplicationContainerConnector),
				typeof(SreSloConnector),
				typeof(PracticeShape),
				typeof(ContainerShape),
				typeof(SloShape),
				typeof(SreShape),
				typeof(global::Variamos.DevOpsDsl.FixUpDiagram),
				typeof(global::Variamos.DevOpsDsl.ConnectorRolePlayerChanged),
			};
		}
		/// <summary>
		/// Gets the list of generated domain properties.
		/// </summary>
		/// <returns>List of property data.</returns>
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1506:AvoidExcessiveClassCoupling", Justification = "Generated code.")]	
		protected sealed override DomainMemberInfo[] GetGeneratedDomainProperties()
		{
			return new DomainMemberInfo[]
			{
				new DomainMemberInfo(typeof(Application), "ApplicationName", Application.ApplicationNameDomainPropertyId, typeof(Application.ApplicationNamePropertyHandler)),
				new DomainMemberInfo(typeof(Application), "CloudProvider", Application.CloudProviderDomainPropertyId, typeof(Application.CloudProviderPropertyHandler)),
				new DomainMemberInfo(typeof(Application), "ArchitecturalStyle", Application.ArchitecturalStyleDomainPropertyId, typeof(Application.ArchitecturalStylePropertyHandler)),
				new DomainMemberInfo(typeof(Application), "ModelVersion", Application.ModelVersionDomainPropertyId, typeof(Application.ModelVersionPropertyHandler)),
				new DomainMemberInfo(typeof(Container), "ContainerName", Container.ContainerNameDomainPropertyId, typeof(Container.ContainerNamePropertyHandler)),
				new DomainMemberInfo(typeof(Container), "ContainerType", Container.ContainerTypeDomainPropertyId, typeof(Container.ContainerTypePropertyHandler)),
				new DomainMemberInfo(typeof(Container), "ContainerFramework", Container.ContainerFrameworkDomainPropertyId, typeof(Container.ContainerFrameworkPropertyHandler)),
				new DomainMemberInfo(typeof(Practice), "PracticeType", Practice.PracticeTypeDomainPropertyId, typeof(Practice.PracticeTypePropertyHandler)),
				new DomainMemberInfo(typeof(Practice), "PracticeName", Practice.PracticeNameDomainPropertyId, typeof(Practice.PracticeNamePropertyHandler)),
				new DomainMemberInfo(typeof(Sre), "SreName", Sre.SreNameDomainPropertyId, typeof(Sre.SreNamePropertyHandler)),
				new DomainMemberInfo(typeof(SLO), "SloName", SLO.SloNameDomainPropertyId, typeof(SLO.SloNamePropertyHandler)),
				new DomainMemberInfo(typeof(SLO), "LowerBound", SLO.LowerBoundDomainPropertyId, typeof(SLO.LowerBoundPropertyHandler)),
				new DomainMemberInfo(typeof(SLO), "UpperBound", SLO.UpperBoundDomainPropertyId, typeof(SLO.UpperBoundPropertyHandler)),
				new DomainMemberInfo(typeof(SLO), "Description", SLO.DescriptionDomainPropertyId, typeof(SLO.DescriptionPropertyHandler)),
				new DomainMemberInfo(typeof(SLO), "Operator", SLO.OperatorDomainPropertyId, typeof(SLO.OperatorPropertyHandler)),
				new DomainMemberInfo(typeof(DevOpsDiagram), "DiamgramName", DevOpsDiagram.DiamgramNameDomainPropertyId, typeof(DevOpsDiagram.DiamgramNamePropertyHandler)),
			};
		}
		/// <summary>
		/// Gets the list of generated domain roles.
		/// </summary>
		/// <returns>List of role data.</returns>
		protected sealed override DomainRolePlayerInfo[] GetGeneratedDomainRoles()
		{
			return new DomainRolePlayerInfo[]
			{
				new DomainRolePlayerInfo(typeof(ApplicationHasContainers), "Application", ApplicationHasContainers.ApplicationDomainRoleId),
				new DomainRolePlayerInfo(typeof(ApplicationHasContainers), "Container", ApplicationHasContainers.ContainerDomainRoleId),
				new DomainRolePlayerInfo(typeof(ContainerHasPracticed), "Container", ContainerHasPracticed.ContainerDomainRoleId),
				new DomainRolePlayerInfo(typeof(ContainerHasPracticed), "Practice", ContainerHasPracticed.PracticeDomainRoleId),
				new DomainRolePlayerInfo(typeof(ApplicationHasSre), "Application", ApplicationHasSre.ApplicationDomainRoleId),
				new DomainRolePlayerInfo(typeof(ApplicationHasSre), "Sre", ApplicationHasSre.SreDomainRoleId),
				new DomainRolePlayerInfo(typeof(SreHasSLO), "Sre", SreHasSLO.SreDomainRoleId),
				new DomainRolePlayerInfo(typeof(SreHasSLO), "SLO", SreHasSLO.SLODomainRoleId),
			};
		}
		#endregion
		#region Factory methods
		private static global::System.Collections.Generic.Dictionary<global::System.Type, int> createElementMap;
	
		/// <summary>
		/// Creates an element of specified type.
		/// </summary>
		/// <param name="partition">Partition where element is to be created.</param>
		/// <param name="elementType">Element type which belongs to this domain model.</param>
		/// <param name="propertyAssignments">New element property assignments.</param>
		/// <returns>Created element.</returns>
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1506:AvoidExcessiveClassCoupling", Justification = "Generated code.")]	
		public sealed override DslModeling::ModelElement CreateElement(DslModeling::Partition partition, global::System.Type elementType, DslModeling::PropertyAssignment[] propertyAssignments)
		{
			if (elementType == null) throw new global::System.ArgumentNullException("elementType");
	
			if (createElementMap == null)
			{
				createElementMap = new global::System.Collections.Generic.Dictionary<global::System.Type, int>(12);
				createElementMap.Add(typeof(Application), 0);
				createElementMap.Add(typeof(Container), 1);
				createElementMap.Add(typeof(Practice), 2);
				createElementMap.Add(typeof(Sre), 3);
				createElementMap.Add(typeof(SLO), 4);
				createElementMap.Add(typeof(DevOpsDiagram), 5);
				createElementMap.Add(typeof(ApplicationContainerConnector), 6);
				createElementMap.Add(typeof(SreSloConnector), 7);
				createElementMap.Add(typeof(PracticeShape), 8);
				createElementMap.Add(typeof(ContainerShape), 9);
				createElementMap.Add(typeof(SloShape), 10);
				createElementMap.Add(typeof(SreShape), 11);
			}
			int index;
			if (!createElementMap.TryGetValue(elementType, out index))
			{
				// construct exception error message		
				string exceptionError = string.Format(
								global::System.Globalization.CultureInfo.CurrentCulture,
								global::Variamos.DevOpsDsl.DevOpsDslDomainModel.SingletonResourceManager.GetString("UnrecognizedElementType"),
								elementType.Name);
				throw new global::System.ArgumentException(exceptionError, "elementType");
			}
			switch (index)
			{
				case 0: return new Application(partition, propertyAssignments);
				case 1: return new Container(partition, propertyAssignments);
				case 2: return new Practice(partition, propertyAssignments);
				case 3: return new Sre(partition, propertyAssignments);
				case 4: return new SLO(partition, propertyAssignments);
				case 5: return new DevOpsDiagram(partition, propertyAssignments);
				case 6: return new ApplicationContainerConnector(partition, propertyAssignments);
				case 7: return new SreSloConnector(partition, propertyAssignments);
				case 8: return new PracticeShape(partition, propertyAssignments);
				case 9: return new ContainerShape(partition, propertyAssignments);
				case 10: return new SloShape(partition, propertyAssignments);
				case 11: return new SreShape(partition, propertyAssignments);
				default: return null;
			}
		}
	
		private static global::System.Collections.Generic.Dictionary<global::System.Type, int> createElementLinkMap;
	
		/// <summary>
		/// Creates an element link of specified type.
		/// </summary>
		/// <param name="partition">Partition where element is to be created.</param>
		/// <param name="elementLinkType">Element link type which belongs to this domain model.</param>
		/// <param name="roleAssignments">List of relationship role assignments for the new link.</param>
		/// <param name="propertyAssignments">New element property assignments.</param>
		/// <returns>Created element link.</returns>
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
		public sealed override DslModeling::ElementLink CreateElementLink(DslModeling::Partition partition, global::System.Type elementLinkType, DslModeling::RoleAssignment[] roleAssignments, DslModeling::PropertyAssignment[] propertyAssignments)
		{
			if (elementLinkType == null) throw new global::System.ArgumentNullException("elementLinkType");
			if (roleAssignments == null) throw new global::System.ArgumentNullException("roleAssignments");
	
			if (createElementLinkMap == null)
			{
				createElementLinkMap = new global::System.Collections.Generic.Dictionary<global::System.Type, int>(4);
				createElementLinkMap.Add(typeof(ApplicationHasContainers), 0);
				createElementLinkMap.Add(typeof(ContainerHasPracticed), 1);
				createElementLinkMap.Add(typeof(ApplicationHasSre), 2);
				createElementLinkMap.Add(typeof(SreHasSLO), 3);
			}
			int index;
			if (!createElementLinkMap.TryGetValue(elementLinkType, out index))
			{
				// construct exception error message
				string exceptionError = string.Format(
								global::System.Globalization.CultureInfo.CurrentCulture,
								global::Variamos.DevOpsDsl.DevOpsDslDomainModel.SingletonResourceManager.GetString("UnrecognizedElementLinkType"),
								elementLinkType.Name);
				throw new global::System.ArgumentException(exceptionError, "elementLinkType");
			
			}
			switch (index)
			{
				case 0: return new ApplicationHasContainers(partition, roleAssignments, propertyAssignments);
				case 1: return new ContainerHasPracticed(partition, roleAssignments, propertyAssignments);
				case 2: return new ApplicationHasSre(partition, roleAssignments, propertyAssignments);
				case 3: return new SreHasSLO(partition, roleAssignments, propertyAssignments);
				default: return null;
			}
		}
		#endregion
		#region Resource manager
		
		private static global::System.Resources.ResourceManager resourceManager;
		
		/// <summary>
		/// The base name of this model's resources.
		/// </summary>
		public const string ResourceBaseName = "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx";
		
		/// <summary>
		/// Gets the DomainModel's ResourceManager. If the ResourceManager does not already exist, then it is created.
		/// </summary>
		public override global::System.Resources.ResourceManager ResourceManager
		{
			[global::System.Diagnostics.DebuggerStepThrough]
			get
			{
				return DevOpsDslDomainModel.SingletonResourceManager;
			}
		}
	
		/// <summary>
		/// Gets the Singleton ResourceManager for this domain model.
		/// </summary>
		public static global::System.Resources.ResourceManager SingletonResourceManager
		{
			[global::System.Diagnostics.DebuggerStepThrough]
			get
			{
				if (DevOpsDslDomainModel.resourceManager == null)
				{
					DevOpsDslDomainModel.resourceManager = new global::System.Resources.ResourceManager(ResourceBaseName, typeof(DevOpsDslDomainModel).Assembly);
				}
				return DevOpsDslDomainModel.resourceManager;
			}
		}
		#endregion
		#region Copy/Remove closures
		/// <summary>
		/// CopyClosure cache
		/// </summary>
		private static DslModeling::IElementVisitorFilter copyClosure;
		/// <summary>
		/// DeleteClosure cache
		/// </summary>
		private static DslModeling::IElementVisitorFilter removeClosure;
		/// <summary>
		/// Returns an IElementVisitorFilter that corresponds to the ClosureType.
		/// </summary>
		/// <param name="type">closure type</param>
		/// <param name="rootElements">collection of root elements</param>
		/// <returns>IElementVisitorFilter or null</returns>
		public override DslModeling::IElementVisitorFilter GetClosureFilter(DslModeling::ClosureType type, global::System.Collections.Generic.ICollection<DslModeling::ModelElement> rootElements)
		{
			switch (type)
			{
				case DslModeling::ClosureType.CopyClosure:
					return DevOpsDslDomainModel.CopyClosure;
				case DslModeling::ClosureType.DeleteClosure:
					return DevOpsDslDomainModel.DeleteClosure;
			}
			return base.GetClosureFilter(type, rootElements);
		}
		/// <summary>
		/// CopyClosure cache
		/// </summary>
		private static DslModeling::IElementVisitorFilter CopyClosure
		{
			get
			{
				// Incorporate all of the closures from the models we extend
				if (DevOpsDslDomainModel.copyClosure == null)
				{
					DslModeling::ChainingElementVisitorFilter copyFilter = new DslModeling::ChainingElementVisitorFilter();
					copyFilter.AddFilter(new DevOpsDslCopyClosure());
					copyFilter.AddFilter(new DslModeling::CoreCopyClosure());
					copyFilter.AddFilter(new DslDiagrams::CoreDesignSurfaceCopyClosure());
					
					DevOpsDslDomainModel.copyClosure = copyFilter;
				}
				return DevOpsDslDomainModel.copyClosure;
			}
		}
		/// <summary>
		/// DeleteClosure cache
		/// </summary>
		private static DslModeling::IElementVisitorFilter DeleteClosure
		{
			get
			{
				// Incorporate all of the closures from the models we extend
				if (DevOpsDslDomainModel.removeClosure == null)
				{
					DslModeling::ChainingElementVisitorFilter removeFilter = new DslModeling::ChainingElementVisitorFilter();
					removeFilter.AddFilter(new DevOpsDslDeleteClosure());
					removeFilter.AddFilter(new DslModeling::CoreDeleteClosure());
					removeFilter.AddFilter(new DslDiagrams::CoreDesignSurfaceDeleteClosure());
		
					DevOpsDslDomainModel.removeClosure = removeFilter;
				}
				return DevOpsDslDomainModel.removeClosure;
			}
		}
		#endregion
		#region Diagram rule helpers
		/// <summary>
		/// Enables rules in this domain model related to diagram fixup for the given store.
		/// If diagram data will be loaded into the store, this method should be called first to ensure
		/// that the diagram behaves properly.
		/// </summary>
		public static void EnableDiagramRules(DslModeling::Store store)
		{
			if(store == null) throw new global::System.ArgumentNullException("store");
			
			DslModeling::RuleManager ruleManager = store.RuleManager;
			ruleManager.EnableRule(typeof(global::Variamos.DevOpsDsl.FixUpDiagram));
			ruleManager.EnableRule(typeof(global::Variamos.DevOpsDsl.ConnectorRolePlayerChanged));
		}
		
		/// <summary>
		/// Disables rules in this domain model related to diagram fixup for the given store.
		/// </summary>
		public static void DisableDiagramRules(DslModeling::Store store)
		{
			if(store == null) throw new global::System.ArgumentNullException("store");
			
			DslModeling::RuleManager ruleManager = store.RuleManager;
			ruleManager.DisableRule(typeof(global::Variamos.DevOpsDsl.FixUpDiagram));
			ruleManager.DisableRule(typeof(global::Variamos.DevOpsDsl.ConnectorRolePlayerChanged));
		}
		#endregion
	}
		
	#region Copy/Remove closure classes
	/// <summary>
	/// Remove closure visitor filter
	/// </summary>
	[global::System.CLSCompliant(true)]
	public partial class DevOpsDslDeleteClosure : DevOpsDslDeleteClosureBase, DslModeling::IElementVisitorFilter
	{
		/// <summary>
		/// Constructor
		/// </summary>
		public DevOpsDslDeleteClosure() : base()
		{
		}
	}
	
	/// <summary>
	/// Base class for remove closure visitor filter
	/// </summary>
	[global::System.CLSCompliant(true)]
	public partial class DevOpsDslDeleteClosureBase : DslModeling::IElementVisitorFilter
	{
		/// <summary>
		/// DomainRoles
		/// </summary>
		private global::System.Collections.Specialized.HybridDictionary domainRoles;
		/// <summary>
		/// Constructor
		/// </summary>
		public DevOpsDslDeleteClosureBase()
		{
			#region Initialize DomainData Table
			DomainRoles.Add(global::Variamos.DevOpsDsl.ApplicationHasContainers.ContainerDomainRoleId, true);
			DomainRoles.Add(global::Variamos.DevOpsDsl.ContainerHasPracticed.PracticeDomainRoleId, true);
			DomainRoles.Add(global::Variamos.DevOpsDsl.ApplicationHasSre.SreDomainRoleId, true);
			DomainRoles.Add(global::Variamos.DevOpsDsl.SreHasSLO.SLODomainRoleId, true);
			#endregion
		}
		/// <summary>
		/// Called to ask the filter if a particular relationship from a source element should be included in the traversal
		/// </summary>
		/// <param name="walker">ElementWalker that is traversing the model</param>
		/// <param name="sourceElement">Model Element playing the source role</param>
		/// <param name="sourceRoleInfo">DomainRoleInfo of the role that the source element is playing in the relationship</param>
		/// <param name="domainRelationshipInfo">DomainRelationshipInfo for the ElementLink in question</param>
		/// <param name="targetRelationship">Relationship in question</param>
		/// <returns>Yes if the relationship should be traversed</returns>
		public virtual DslModeling::VisitorFilterResult ShouldVisitRelationship(DslModeling::ElementWalker walker, DslModeling::ModelElement sourceElement, DslModeling::DomainRoleInfo sourceRoleInfo, DslModeling::DomainRelationshipInfo domainRelationshipInfo, DslModeling::ElementLink targetRelationship)
		{
			return DslModeling::VisitorFilterResult.Yes;
		}
		/// <summary>
		/// Called to ask the filter if a particular role player should be Visited during traversal
		/// </summary>
		/// <param name="walker">ElementWalker that is traversing the model</param>
		/// <param name="sourceElement">Model Element playing the source role</param>
		/// <param name="elementLink">Element Link that forms the relationship to the role player in question</param>
		/// <param name="targetDomainRole">DomainRoleInfo of the target role</param>
		/// <param name="targetRolePlayer">Model Element that plays the target role in the relationship</param>
		/// <returns></returns>
		public virtual DslModeling::VisitorFilterResult ShouldVisitRolePlayer(DslModeling::ElementWalker walker, DslModeling::ModelElement sourceElement, DslModeling::ElementLink elementLink, DslModeling::DomainRoleInfo targetDomainRole, DslModeling::ModelElement targetRolePlayer)
		{
			if (targetDomainRole == null) throw new global::System.ArgumentNullException("targetDomainRole");
			return this.DomainRoles.Contains(targetDomainRole.Id) ? DslModeling::VisitorFilterResult.Yes : DslModeling::VisitorFilterResult.DoNotCare;
		}
		/// <summary>
		/// DomainRoles
		/// </summary>
		private global::System.Collections.Specialized.HybridDictionary DomainRoles
		{
			get
			{
				if (this.domainRoles == null)
				{
					this.domainRoles = new global::System.Collections.Specialized.HybridDictionary();
				}
				return this.domainRoles;
			}
		}
	
	}
	/// <summary>
	/// Copy closure visitor filter
	/// </summary>
	[global::System.CLSCompliant(true)]
	public partial class DevOpsDslCopyClosure : DevOpsDslCopyClosureBase, DslModeling::IElementVisitorFilter
	{
		/// <summary>
		/// Constructor
		/// </summary>
		public DevOpsDslCopyClosure() : base()
		{
		}
	}
	/// <summary>
	/// Base class for copy closure visitor filter
	/// </summary>
	[global::System.CLSCompliant(true)]
	public partial class DevOpsDslCopyClosureBase : DslModeling::CopyClosureFilter, DslModeling::IElementVisitorFilter
	{
		/// <summary>
		/// Constructor
		/// </summary>
		public DevOpsDslCopyClosureBase():base()
		{
		}
	}
	#endregion
		
}
namespace Variamos.DevOpsDsl
{
	/// <summary>
	/// DomainEnumeration: CloudProvider
	/// Description for Variamos.DevOpsDsl.CloudProvider
	/// </summary>
	[global::System.CLSCompliant(true)]
	public enum CloudProvider
	{
		/// <summary>
		/// Azure
		/// Microsft Azure
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.CloudProvider/Azure.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		Azure,
		/// <summary>
		/// AWS
		/// Amazon Web Services
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.CloudProvider/AWS.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		AWS,
		/// <summary>
		/// GCP
		/// Google Cloud Platform
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.CloudProvider/GCP.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		GCP,
	}
}
namespace Variamos.DevOpsDsl
{
	/// <summary>
	/// DomainEnumeration: NodeType
	/// Description for Variamos.DevOpsDsl.NodeType
	/// </summary>
	[global::System.CLSCompliant(true)]
	public enum NodeType
	{
		/// <summary>
		/// Container
		/// Description for Variamos.DevOpsDsl.NodeType.Container
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.NodeType/Container.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		Container,
		/// <summary>
		/// Capability
		/// Description for Variamos.DevOpsDsl.NodeType.Capability
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.NodeType/Capability.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		Capability,
		/// <summary>
		/// Application
		/// Description for Variamos.DevOpsDsl.NodeType.Application
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.NodeType/Application.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		Application,
	}
}
namespace Variamos.DevOpsDsl
{
	/// <summary>
	/// DomainEnumeration: ContainerType
	/// Description for Variamos.DevOpsDsl.ContainerType
	/// </summary>
	[global::System.CLSCompliant(true)]
	public enum ContainerType
	{
		/// <summary>
		/// WebApplication
		/// Description for Variamos.DevOpsDsl.ContainerType.WebApplication
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.ContainerType/WebApplication.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		WebApplication = 1,
		/// <summary>
		/// Api
		/// Description for Variamos.DevOpsDsl.ContainerType.Api
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.ContainerType/Api.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		Api = 2,
		/// <summary>
		/// MobilApp
		/// Description for Variamos.DevOpsDsl.ContainerType.MobilApp
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.ContainerType/MobilApp.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		MobilApp = 0,
	}
}
namespace Variamos.DevOpsDsl
{
	/// <summary>
	/// DomainEnumeration: ArchitecturalStyles
	/// Description for Variamos.DevOpsDsl.ArchitecturalStyles
	/// </summary>
	[global::System.CLSCompliant(true)]
	public enum ArchitecturalStyles
	{
		/// <summary>
		/// NTierApplication
		/// Description for Variamos.DevOpsDsl.ArchitecturalStyles.NTierApplication
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.ArchitecturalStyles/NTierApplication.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		NTierApplication = 1,
		/// <summary>
		/// Microservices
		/// Description for Variamos.DevOpsDsl.ArchitecturalStyles.Microservices
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.ArchitecturalStyles/Microservices.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		Microservices = 2,
		/// <summary>
		/// WebQueueWorker
		/// Description for Variamos.DevOpsDsl.ArchitecturalStyles.WebQueueWorker
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.ArchitecturalStyles/WebQueueWorker.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		WebQueueWorker = 4,
		/// <summary>
		/// BigCompute
		/// Description for Variamos.DevOpsDsl.ArchitecturalStyles.BigCompute
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.ArchitecturalStyles/BigCompute.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		BigCompute = 0,
		/// <summary>
		/// BigData
		/// Description for Variamos.DevOpsDsl.ArchitecturalStyles.BigData
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.ArchitecturalStyles/BigData.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		BigData = 5,
		/// <summary>
		/// EventDriven
		/// Description for Variamos.DevOpsDsl.ArchitecturalStyles.EventDriven
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.ArchitecturalStyles/EventDriven.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		EventDriven = 3,
		/// <summary>
		/// EnumerationLiteral1
		/// Description for Variamos.DevOpsDsl.ArchitecturalStyles.EnumerationLiteral1
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.ArchitecturalStyles/EnumerationLiteral1.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		EnumerationLiteral1,
	}
}
namespace Variamos.DevOpsDsl
{
	/// <summary>
	/// DomainEnumeration: DevOpsPractices
	/// Description for Variamos.DevOpsDsl.DevOpsPractices
	/// </summary>
	[global::System.CLSCompliant(true)]
	public enum DevOpsPractices
	{
		/// <summary>
		/// CiBehaviorDrivenDevelopment
		/// Continuous Integration (CI): Behavior-driven development (BDD)
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsPractices/CiBehaviorDrivenDevelopment.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		CiBehaviorDrivenDevelopment = 0,
		/// <summary>
		/// CpInfrastructureAsCode
		/// Description for Variamos.DevOpsDsl.DevOpsPractices.CpInfrastructureAsCode
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsPractices/CpInfrastructureAsCode.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		CpInfrastructureAsCode = 1,
		/// <summary>
		/// CpStrategyPortofolioPlanning
		/// Continuous Planning (CP): Strategy and portofolio planning
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsPractices/CpStrategyPortofolioPlanning.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		CpStrategyPortofolioPlanning = 2,
		/// <summary>
		/// CpLeanProductPlanning
		/// Continuous Planning (CP): Lean product planning
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsPractices/CpLeanProductPlanning.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		CpLeanProductPlanning = 3,
		/// <summary>
		/// CpReleasePlanning
		/// Continuous Planning (CP): Release planning
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsPractices/CpReleasePlanning.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		CpReleasePlanning = 4,
		/// <summary>
		/// CpSprintPlanning
		/// Continuous Planning (CP): Sprint planning
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsPractices/CpSprintPlanning.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		CpSprintPlanning = 5,
		/// <summary>
		/// CpAgileRequirementManagement
		/// Continuous Planning (CP): Agile requirement management
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsPractices/CpAgileRequirementManagement.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		CpAgileRequirementManagement = 6,
		/// <summary>
		/// CpSecurityRequirement
		/// Continuous Planning (CP): Security requirement
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsPractices/CpSecurityRequirement.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		CpSecurityRequirement = 7,
		/// <summary>
		/// CpArchitectureDesign
		/// Continuous Planning (CP): Architecture design
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsPractices/CpArchitectureDesign.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		CpArchitectureDesign = 8,
		/// <summary>
		/// CpCapacityPlanning
		/// Continuous Planning (CP): Capacity planning
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsPractices/CpCapacityPlanning.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		CpCapacityPlanning = 9,
		/// <summary>
		/// CpUxArchitectureDesign
		/// Continuous Planning (CP): UX architecture design
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsPractices/CpUxArchitectureDesign.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		CpUxArchitectureDesign = 11,
		/// <summary>
		/// CpThreadModeling
		/// Continuous Planning (CP): Thread modeling
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsPractices/CpThreadModeling.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		CpThreadModeling = 12,
		/// <summary>
		/// CpValueStreamMapping
		/// Continuous Planning (CP): Value stream mapping
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsPractices/CpValueStreamMapping.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		CpValueStreamMapping = 13,
	}
}
namespace Variamos.DevOpsDsl
{
	/// <summary>
	/// DomainEnumeration: DevelopmentFrameworks
	/// Description for Variamos.DevOpsDsl.DevelopmentFrameworks
	/// </summary>
	[global::System.CLSCompliant(true)]
	public enum DevelopmentFrameworks
	{
		/// <summary>
		/// Java
		/// Description for Variamos.DevOpsDsl.DevelopmentFrameworks.Java
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevelopmentFrameworks/Java.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		Java = 0,
		/// <summary>
		/// DotNet
		/// Description for Variamos.DevOpsDsl.DevelopmentFrameworks.DotNet
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevelopmentFrameworks/DotNet.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		DotNet = 1,
		/// <summary>
		/// Spring
		/// Description for Variamos.DevOpsDsl.DevelopmentFrameworks.Spring
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevelopmentFrameworks/Spring.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		Spring = 2,
		/// <summary>
		/// NodeJS
		/// Description for Variamos.DevOpsDsl.DevelopmentFrameworks.NodeJS
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevelopmentFrameworks/NodeJS.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		NodeJS = 3,
		/// <summary>
		/// Python
		/// Description for Variamos.DevOpsDsl.DevelopmentFrameworks.Python
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevelopmentFrameworks/Python.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		Python = 4,
		/// <summary>
		/// React
		/// Description for Variamos.DevOpsDsl.DevelopmentFrameworks.React
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevelopmentFrameworks/React.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		React = 5,
		/// <summary>
		/// VueJS
		/// Description for Variamos.DevOpsDsl.DevelopmentFrameworks.VueJS
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevelopmentFrameworks/VueJS.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		VueJS = 6,
		/// <summary>
		/// Angular
		/// Description for Variamos.DevOpsDsl.DevelopmentFrameworks.Angular
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevelopmentFrameworks/Angular.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		Angular = 7,
		/// <summary>
		/// ReactNative
		/// Description for Variamos.DevOpsDsl.DevelopmentFrameworks.ReactNative
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevelopmentFrameworks/ReactNative.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		ReactNative = 7,
		/// <summary>
		/// Xcode
		/// Description for Variamos.DevOpsDsl.DevelopmentFrameworks.Xcode
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevelopmentFrameworks/Xcode.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		Xcode = 8,
	}
}
namespace Variamos.DevOpsDsl
{
	/// <summary>
	/// DomainEnumeration: SLI
	/// Description for Variamos.DevOpsDsl.SLI
	/// </summary>
	[global::System.CLSCompliant(true)]
	public enum SLI
	{
		/// <summary>
		/// RequestLatency
		/// How long it takes to return a response to a request, in seconds
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.SLI/RequestLatency.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		RequestLatency = 0,
		/// <summary>
		/// ErrorRate
		/// Expressed as a fraction of all requests received
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.SLI/ErrorRate.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		ErrorRate = 1,
		/// <summary>
		/// SystemThroughput
		/// Measured in requests per second (QPS)
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.SLI/SystemThroughput.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		SystemThroughput,
		/// <summary>
		/// Availability
		/// The fraction of the time that a service is usable
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.SLI/Availability.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		Availability,
	}
}
namespace Variamos.DevOpsDsl
{
	/// <summary>
	/// DomainEnumeration: ComparisonOperator
	/// Description for Variamos.DevOpsDsl.ComparisonOperator
	/// </summary>
	[global::System.CLSCompliant(true)]
	public enum ComparisonOperator
	{
		/// <summary>
		/// LessThan
		/// Less than
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.ComparisonOperator/LessThan.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		LessThan = 0,
		/// <summary>
		/// Between
		/// Between
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.ComparisonOperator/Between.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		Between = 1,
		/// <summary>
		/// GratherThan
		/// Grater than
		/// </summary>
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.ComparisonOperator/GratherThan.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		GratherThan = 2,
	}
}

