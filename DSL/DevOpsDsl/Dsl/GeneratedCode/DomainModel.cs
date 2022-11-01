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
				typeof(DevOps),
				typeof(Application),
				typeof(DevopsCategory),
				typeof(DevopsPractice),
				typeof(DevOpsHasApplication),
				typeof(ApplicationHasDevopsCategories),
				typeof(DevopsCategoryHasDevopsPracticed),
				typeof(DevopsDiagram),
				typeof(ApplicationCategoryConnector),
				typeof(CategoryPracticeConnector),
				typeof(ApplicationShape),
				typeof(DevopsCategoryShape),
				typeof(DevopsPracticeShape),
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
				new DomainMemberInfo(typeof(DevOps), "ModelName", DevOps.ModelNameDomainPropertyId, typeof(DevOps.ModelNamePropertyHandler)),
				new DomainMemberInfo(typeof(Application), "ApplicationName", Application.ApplicationNameDomainPropertyId, typeof(Application.ApplicationNamePropertyHandler)),
				new DomainMemberInfo(typeof(Application), "CloudPlatform", Application.CloudPlatformDomainPropertyId, typeof(Application.CloudPlatformPropertyHandler)),
				new DomainMemberInfo(typeof(DevopsCategory), "CategoryName", DevopsCategory.CategoryNameDomainPropertyId, typeof(DevopsCategory.CategoryNamePropertyHandler)),
				new DomainMemberInfo(typeof(DevopsPractice), "PracticeName", DevopsPractice.PracticeNameDomainPropertyId, typeof(DevopsPractice.PracticeNamePropertyHandler)),
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
				new DomainRolePlayerInfo(typeof(DevOpsHasApplication), "DevOps", DevOpsHasApplication.DevOpsDomainRoleId),
				new DomainRolePlayerInfo(typeof(DevOpsHasApplication), "Application", DevOpsHasApplication.ApplicationDomainRoleId),
				new DomainRolePlayerInfo(typeof(ApplicationHasDevopsCategories), "Application", ApplicationHasDevopsCategories.ApplicationDomainRoleId),
				new DomainRolePlayerInfo(typeof(ApplicationHasDevopsCategories), "DevopsCategory", ApplicationHasDevopsCategories.DevopsCategoryDomainRoleId),
				new DomainRolePlayerInfo(typeof(DevopsCategoryHasDevopsPracticed), "DevopsCategory", DevopsCategoryHasDevopsPracticed.DevopsCategoryDomainRoleId),
				new DomainRolePlayerInfo(typeof(DevopsCategoryHasDevopsPracticed), "DevopsPractice", DevopsCategoryHasDevopsPracticed.DevopsPracticeDomainRoleId),
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
				createElementMap = new global::System.Collections.Generic.Dictionary<global::System.Type, int>(10);
				createElementMap.Add(typeof(DevOps), 0);
				createElementMap.Add(typeof(Application), 1);
				createElementMap.Add(typeof(DevopsCategory), 2);
				createElementMap.Add(typeof(DevopsPractice), 3);
				createElementMap.Add(typeof(DevopsDiagram), 4);
				createElementMap.Add(typeof(ApplicationCategoryConnector), 5);
				createElementMap.Add(typeof(CategoryPracticeConnector), 6);
				createElementMap.Add(typeof(ApplicationShape), 7);
				createElementMap.Add(typeof(DevopsCategoryShape), 8);
				createElementMap.Add(typeof(DevopsPracticeShape), 9);
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
				case 0: return new DevOps(partition, propertyAssignments);
				case 1: return new Application(partition, propertyAssignments);
				case 2: return new DevopsCategory(partition, propertyAssignments);
				case 3: return new DevopsPractice(partition, propertyAssignments);
				case 4: return new DevopsDiagram(partition, propertyAssignments);
				case 5: return new ApplicationCategoryConnector(partition, propertyAssignments);
				case 6: return new CategoryPracticeConnector(partition, propertyAssignments);
				case 7: return new ApplicationShape(partition, propertyAssignments);
				case 8: return new DevopsCategoryShape(partition, propertyAssignments);
				case 9: return new DevopsPracticeShape(partition, propertyAssignments);
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
				createElementLinkMap = new global::System.Collections.Generic.Dictionary<global::System.Type, int>(3);
				createElementLinkMap.Add(typeof(DevOpsHasApplication), 0);
				createElementLinkMap.Add(typeof(ApplicationHasDevopsCategories), 1);
				createElementLinkMap.Add(typeof(DevopsCategoryHasDevopsPracticed), 2);
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
				case 0: return new DevOpsHasApplication(partition, roleAssignments, propertyAssignments);
				case 1: return new ApplicationHasDevopsCategories(partition, roleAssignments, propertyAssignments);
				case 2: return new DevopsCategoryHasDevopsPracticed(partition, roleAssignments, propertyAssignments);
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
			DomainRoles.Add(global::Variamos.DevOpsDsl.DevOpsHasApplication.ApplicationDomainRoleId, true);
			DomainRoles.Add(global::Variamos.DevOpsDsl.ApplicationHasDevopsCategories.DevopsCategoryDomainRoleId, true);
			DomainRoles.Add(global::Variamos.DevOpsDsl.DevopsCategoryHasDevopsPracticed.DevopsPracticeDomainRoleId, true);
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

