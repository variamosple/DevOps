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
namespace Variamos.DevOpsDsl
{
	/// <summary>
	/// DomainRelationship DevOpsHasApplications
	/// Description for Variamos.DevOpsDsl.DevOpsHasApplications
	/// </summary>
	[DslDesign::DisplayNameResource("Variamos.DevOpsDsl.DevOpsHasApplications.DisplayName", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
	[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsHasApplications.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
	[DslModeling::DomainModelOwner(typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel))]
	[global::System.CLSCompliant(true)]
	[DslModeling::DomainRelationship(IsEmbedding=true)]
	[DslModeling::DomainObjectId("b66acc16-ee54-4251-b928-007a38cc3e15")]
	public partial class DevOpsHasApplications : DslModeling::ElementLink
	{
		#region Constructors, domain class Id
		
		/// <summary>
		/// DevOpsHasApplications domain class Id.
		/// </summary>
		public static readonly new global::System.Guid DomainClassId = new global::System.Guid(0xb66acc16, 0xee54, 0x4251, 0xb9, 0x28, 0x00, 0x7a, 0x38, 0xcc, 0x3e, 0x15);
	
				
		/// <summary>
		/// Constructor
		/// Creates a DevOpsHasApplications link in the same Partition as the given DevOps
		/// </summary>
		/// <param name="source">DevOps to use as the source of the relationship.</param>
		/// <param name="target">Application to use as the target of the relationship.</param>
		public DevOpsHasApplications(DevOps source, Application target)
			: base((source != null ? source.Partition : null), new DslModeling::RoleAssignment[]{new DslModeling::RoleAssignment(DevOpsHasApplications.DevOpsDomainRoleId, source), new DslModeling::RoleAssignment(DevOpsHasApplications.ApplicationDomainRoleId, target)}, null)
		{
		}
		
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="store">Store where new link is to be created.</param>
		/// <param name="roleAssignments">List of relationship role assignments.</param>
		public DevOpsHasApplications(DslModeling::Store store, params DslModeling::RoleAssignment[] roleAssignments)
			: base(store != null ? store.DefaultPartitionForClass(DomainClassId) : null, roleAssignments, null)
		{
		}
		
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="store">Store where new link is to be created.</param>
		/// <param name="roleAssignments">List of relationship role assignments.</param>
		/// <param name="propertyAssignments">List of properties assignments to set on the new link.</param>
		public DevOpsHasApplications(DslModeling::Store store, DslModeling::RoleAssignment[] roleAssignments, DslModeling::PropertyAssignment[] propertyAssignments)
			: base(store != null ? store.DefaultPartitionForClass(DomainClassId) : null, roleAssignments, propertyAssignments)
		{
		}
		
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="partition">Partition where new link is to be created.</param>
		/// <param name="roleAssignments">List of relationship role assignments.</param>
		public DevOpsHasApplications(DslModeling::Partition partition, params DslModeling::RoleAssignment[] roleAssignments)
			: base(partition, roleAssignments, null)
		{
		}
		
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="partition">Partition where new link is to be created.</param>
		/// <param name="roleAssignments">List of relationship role assignments.</param>
		/// <param name="propertyAssignments">List of properties assignments to set on the new link.</param>
		public DevOpsHasApplications(DslModeling::Partition partition, DslModeling::RoleAssignment[] roleAssignments, DslModeling::PropertyAssignment[] propertyAssignments)
			: base(partition, roleAssignments, propertyAssignments)
		{
		}
		#endregion
		#region DevOps domain role code
		
		/// <summary>
		/// DevOps domain role Id.
		/// </summary>
		public static readonly global::System.Guid DevOpsDomainRoleId = new global::System.Guid(0x44f85076, 0xc197, 0x4de1, 0xaf, 0x0d, 0x7d, 0xec, 0xa5, 0x79, 0x33, 0x66);
		
		/// <summary>
		/// DomainRole DevOps
		/// Description for Variamos.DevOpsDsl.DevOpsHasApplications.DevOps
		/// </summary>
		[DslDesign::DisplayNameResource("Variamos.DevOpsDsl.DevOpsHasApplications/DevOps.DisplayName", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsHasApplications/DevOps.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		[DslModeling::DomainRole(DslModeling::DomainRoleOrder.Source, PropertyName = "Applications", PropertyDisplayNameKey="Variamos.DevOpsDsl.DevOpsHasApplications/DevOps.PropertyDisplayName",  PropagatesCopy = DslModeling::PropagatesCopyOption.PropagatesCopyToLinkAndOppositeRolePlayer, Multiplicity = DslModeling::Multiplicity.ZeroMany)]
		[DslModeling::DomainObjectId("44f85076-c197-4de1-af0d-7deca5793366")]
		public virtual DevOps DevOps
		{
			[global::System.Diagnostics.DebuggerStepThrough]
			get
			{
				return (DevOps)DslModeling::DomainRoleInfo.GetRolePlayer(this, DevOpsDomainRoleId);
			}
			[global::System.Diagnostics.DebuggerStepThrough]
			set
			{
				DslModeling::DomainRoleInfo.SetRolePlayer(this, DevOpsDomainRoleId, value);
			}
		}
				
		#endregion
		#region Static methods to access DevOps of a Application
		/// <summary>
		/// Gets DevOps.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		public static DevOps GetDevOps(Application element)
		{
			return DslModeling::DomainRoleInfo.GetLinkedElement(element, ApplicationDomainRoleId) as DevOps;
		}
		
		/// <summary>
		/// Sets DevOps.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		public static void SetDevOps(Application element, DevOps newDevOps)
		{
			DslModeling::DomainRoleInfo.SetLinkedElement(element, ApplicationDomainRoleId, newDevOps);
		}
		#endregion
		#region Application domain role code
		
		/// <summary>
		/// Application domain role Id.
		/// </summary>
		public static readonly global::System.Guid ApplicationDomainRoleId = new global::System.Guid(0x5b862f38, 0xad09, 0x4bb8, 0x9f, 0x80, 0x1b, 0x6e, 0x44, 0x39, 0x76, 0x33);
		
		/// <summary>
		/// DomainRole Application
		/// Description for Variamos.DevOpsDsl.DevOpsHasApplications.Application
		/// </summary>
		[DslDesign::DisplayNameResource("Variamos.DevOpsDsl.DevOpsHasApplications/Application.DisplayName", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsHasApplications/Application.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		[DslModeling::DomainRole(DslModeling::DomainRoleOrder.Target, PropertyName = "DevOps", PropertyDisplayNameKey="Variamos.DevOpsDsl.DevOpsHasApplications/Application.PropertyDisplayName", PropagatesDelete = true,  PropagatesCopy = DslModeling::PropagatesCopyOption.DoNotPropagateCopy, Multiplicity = DslModeling::Multiplicity.One)]
		[DslModeling::DomainObjectId("5b862f38-ad09-4bb8-9f80-1b6e44397633")]
		public virtual Application Application
		{
			[global::System.Diagnostics.DebuggerStepThrough]
			get
			{
				return (Application)DslModeling::DomainRoleInfo.GetRolePlayer(this, ApplicationDomainRoleId);
			}
			[global::System.Diagnostics.DebuggerStepThrough]
			set
			{
				DslModeling::DomainRoleInfo.SetRolePlayer(this, ApplicationDomainRoleId, value);
			}
		}
				
		#endregion
		#region Static methods to access Applications of a DevOps
		/// <summary>
		/// Gets a list of Applications.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		public static DslModeling::LinkedElementCollection<Application> GetApplications(DevOps element)
		{
			return GetRoleCollection<DslModeling::LinkedElementCollection<Application>, Application>(element, DevOpsDomainRoleId);
		}
		#endregion
		#region DevOps link accessor
		/// <summary>
		/// Get the list of DevOpsHasApplications links to a DevOps.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		public static global::System.Collections.ObjectModel.ReadOnlyCollection<global::Variamos.DevOpsDsl.DevOpsHasApplications> GetLinksToApplications ( global::Variamos.DevOpsDsl.DevOps devOpsInstance )
		{
			return DslModeling::DomainRoleInfo.GetElementLinks<global::Variamos.DevOpsDsl.DevOpsHasApplications>(devOpsInstance, global::Variamos.DevOpsDsl.DevOpsHasApplications.DevOpsDomainRoleId);
		}
		#endregion
		#region Application link accessor
		/// <summary>
		/// Get the DevOpsHasApplications link to a Application.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		public static global::Variamos.DevOpsDsl.DevOpsHasApplications GetLinkToDevOps (global::Variamos.DevOpsDsl.Application applicationInstance)
		{
			global::System.Collections.Generic.IList<global::Variamos.DevOpsDsl.DevOpsHasApplications> links = DslModeling::DomainRoleInfo.GetElementLinks<global::Variamos.DevOpsDsl.DevOpsHasApplications>(applicationInstance, global::Variamos.DevOpsDsl.DevOpsHasApplications.ApplicationDomainRoleId);
			global::System.Diagnostics.Debug.Assert(links.Count <= 1, "Multiplicity of Application not obeyed.");
			if ( links.Count == 0 )
			{
				return null;
			}
			else
			{
				return links[0];
			}
		}
		#endregion
		#region DevOpsHasApplications instance accessors
		
		/// <summary>
		/// Get any DevOpsHasApplications links between a given DevOps and a Application.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		public static global::System.Collections.ObjectModel.ReadOnlyCollection<global::Variamos.DevOpsDsl.DevOpsHasApplications> GetLinks( global::Variamos.DevOpsDsl.DevOps source, global::Variamos.DevOpsDsl.Application target )
		{
			global::System.Collections.Generic.List<global::Variamos.DevOpsDsl.DevOpsHasApplications> outLinks = new global::System.Collections.Generic.List<global::Variamos.DevOpsDsl.DevOpsHasApplications>();
			global::System.Collections.Generic.IList<global::Variamos.DevOpsDsl.DevOpsHasApplications> links = DslModeling::DomainRoleInfo.GetElementLinks<global::Variamos.DevOpsDsl.DevOpsHasApplications>(source, global::Variamos.DevOpsDsl.DevOpsHasApplications.DevOpsDomainRoleId);
			foreach ( global::Variamos.DevOpsDsl.DevOpsHasApplications link in links )
			{
				if ( target.Equals(link.Application) )
				{
					outLinks.Add(link);
				}
			}
			return outLinks.AsReadOnly();
		}
		/// <summary>
		/// Get the one DevOpsHasApplications link between a given DevOpsand a Application.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		public static global::Variamos.DevOpsDsl.DevOpsHasApplications GetLink( global::Variamos.DevOpsDsl.DevOps source, global::Variamos.DevOpsDsl.Application target )
		{
			global::System.Collections.Generic.IList<global::Variamos.DevOpsDsl.DevOpsHasApplications> links = DslModeling::DomainRoleInfo.GetElementLinks<global::Variamos.DevOpsDsl.DevOpsHasApplications>(source, global::Variamos.DevOpsDsl.DevOpsHasApplications.DevOpsDomainRoleId);
			foreach ( global::Variamos.DevOpsDsl.DevOpsHasApplications link in links )
			{
				if ( target.Equals(link.Application) )
				{
					return link;
				}
			}
			return null;
		}
		
		#endregion
	}
}
namespace Variamos.DevOpsDsl
{
	/// <summary>
	/// DomainRelationship ApplicationHasContainers
	/// Description for Variamos.DevOpsDsl.ApplicationHasContainers
	/// </summary>
	[DslDesign::DisplayNameResource("Variamos.DevOpsDsl.ApplicationHasContainers.DisplayName", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
	[DslDesign::DescriptionResource("Variamos.DevOpsDsl.ApplicationHasContainers.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
	[DslModeling::DomainModelOwner(typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel))]
	[global::System.CLSCompliant(true)]
	[DslModeling::DomainRelationship(IsEmbedding=true)]
	[DslModeling::DomainObjectId("1a31614f-2028-4783-9531-035dfea87223")]
	public partial class ApplicationHasContainers : DslModeling::ElementLink
	{
		#region Constructors, domain class Id
		
		/// <summary>
		/// ApplicationHasContainers domain class Id.
		/// </summary>
		public static readonly new global::System.Guid DomainClassId = new global::System.Guid(0x1a31614f, 0x2028, 0x4783, 0x95, 0x31, 0x03, 0x5d, 0xfe, 0xa8, 0x72, 0x23);
	
				
		/// <summary>
		/// Constructor
		/// Creates a ApplicationHasContainers link in the same Partition as the given Application
		/// </summary>
		/// <param name="source">Application to use as the source of the relationship.</param>
		/// <param name="target">Container to use as the target of the relationship.</param>
		public ApplicationHasContainers(Application source, Container target)
			: base((source != null ? source.Partition : null), new DslModeling::RoleAssignment[]{new DslModeling::RoleAssignment(ApplicationHasContainers.ApplicationDomainRoleId, source), new DslModeling::RoleAssignment(ApplicationHasContainers.ContainerDomainRoleId, target)}, null)
		{
		}
		
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="store">Store where new link is to be created.</param>
		/// <param name="roleAssignments">List of relationship role assignments.</param>
		public ApplicationHasContainers(DslModeling::Store store, params DslModeling::RoleAssignment[] roleAssignments)
			: base(store != null ? store.DefaultPartitionForClass(DomainClassId) : null, roleAssignments, null)
		{
		}
		
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="store">Store where new link is to be created.</param>
		/// <param name="roleAssignments">List of relationship role assignments.</param>
		/// <param name="propertyAssignments">List of properties assignments to set on the new link.</param>
		public ApplicationHasContainers(DslModeling::Store store, DslModeling::RoleAssignment[] roleAssignments, DslModeling::PropertyAssignment[] propertyAssignments)
			: base(store != null ? store.DefaultPartitionForClass(DomainClassId) : null, roleAssignments, propertyAssignments)
		{
		}
		
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="partition">Partition where new link is to be created.</param>
		/// <param name="roleAssignments">List of relationship role assignments.</param>
		public ApplicationHasContainers(DslModeling::Partition partition, params DslModeling::RoleAssignment[] roleAssignments)
			: base(partition, roleAssignments, null)
		{
		}
		
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="partition">Partition where new link is to be created.</param>
		/// <param name="roleAssignments">List of relationship role assignments.</param>
		/// <param name="propertyAssignments">List of properties assignments to set on the new link.</param>
		public ApplicationHasContainers(DslModeling::Partition partition, DslModeling::RoleAssignment[] roleAssignments, DslModeling::PropertyAssignment[] propertyAssignments)
			: base(partition, roleAssignments, propertyAssignments)
		{
		}
		#endregion
		#region Application domain role code
		
		/// <summary>
		/// Application domain role Id.
		/// </summary>
		public static readonly global::System.Guid ApplicationDomainRoleId = new global::System.Guid(0x55a60d90, 0x0958, 0x42c8, 0xb3, 0x2e, 0x3b, 0x9c, 0xad, 0x7a, 0x2c, 0xe7);
		
		/// <summary>
		/// DomainRole Application
		/// Description for Variamos.DevOpsDsl.ApplicationHasContainers.Application
		/// </summary>
		[DslDesign::DisplayNameResource("Variamos.DevOpsDsl.ApplicationHasContainers/Application.DisplayName", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.ApplicationHasContainers/Application.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		[DslModeling::DomainRole(DslModeling::DomainRoleOrder.Source, PropertyName = "Containers", PropertyDisplayNameKey="Variamos.DevOpsDsl.ApplicationHasContainers/Application.PropertyDisplayName",  PropagatesCopy = DslModeling::PropagatesCopyOption.PropagatesCopyToLinkAndOppositeRolePlayer, Multiplicity = DslModeling::Multiplicity.ZeroMany)]
		[DslModeling::DomainObjectId("55a60d90-0958-42c8-b32e-3b9cad7a2ce7")]
		public virtual Application Application
		{
			[global::System.Diagnostics.DebuggerStepThrough]
			get
			{
				return (Application)DslModeling::DomainRoleInfo.GetRolePlayer(this, ApplicationDomainRoleId);
			}
			[global::System.Diagnostics.DebuggerStepThrough]
			set
			{
				DslModeling::DomainRoleInfo.SetRolePlayer(this, ApplicationDomainRoleId, value);
			}
		}
				
		#endregion
		#region Static methods to access Application of a Container
		/// <summary>
		/// Gets Application.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		public static Application GetApplication(Container element)
		{
			return DslModeling::DomainRoleInfo.GetLinkedElement(element, ContainerDomainRoleId) as Application;
		}
		
		/// <summary>
		/// Sets Application.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		public static void SetApplication(Container element, Application newApplication)
		{
			DslModeling::DomainRoleInfo.SetLinkedElement(element, ContainerDomainRoleId, newApplication);
		}
		#endregion
		#region Container domain role code
		
		/// <summary>
		/// Container domain role Id.
		/// </summary>
		public static readonly global::System.Guid ContainerDomainRoleId = new global::System.Guid(0x7d65ec8e, 0x9f36, 0x4ae5, 0xb1, 0xab, 0x56, 0xd3, 0xf3, 0xee, 0xab, 0x77);
		
		/// <summary>
		/// DomainRole Container
		/// Description for Variamos.DevOpsDsl.ApplicationHasContainers.Container
		/// </summary>
		[DslDesign::DisplayNameResource("Variamos.DevOpsDsl.ApplicationHasContainers/Container.DisplayName", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.ApplicationHasContainers/Container.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		[DslModeling::DomainRole(DslModeling::DomainRoleOrder.Target, PropertyName = "Application", PropertyDisplayNameKey="Variamos.DevOpsDsl.ApplicationHasContainers/Container.PropertyDisplayName", PropagatesDelete = true,  PropagatesCopy = DslModeling::PropagatesCopyOption.DoNotPropagateCopy, Multiplicity = DslModeling::Multiplicity.One)]
		[DslModeling::DomainObjectId("7d65ec8e-9f36-4ae5-b1ab-56d3f3eeab77")]
		public virtual Container Container
		{
			[global::System.Diagnostics.DebuggerStepThrough]
			get
			{
				return (Container)DslModeling::DomainRoleInfo.GetRolePlayer(this, ContainerDomainRoleId);
			}
			[global::System.Diagnostics.DebuggerStepThrough]
			set
			{
				DslModeling::DomainRoleInfo.SetRolePlayer(this, ContainerDomainRoleId, value);
			}
		}
				
		#endregion
		#region Static methods to access Containers of a Application
		/// <summary>
		/// Gets a list of Containers.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		public static DslModeling::LinkedElementCollection<Container> GetContainers(Application element)
		{
			return GetRoleCollection<DslModeling::LinkedElementCollection<Container>, Container>(element, ApplicationDomainRoleId);
		}
		#endregion
		#region Application link accessor
		/// <summary>
		/// Get the list of ApplicationHasContainers links to a Application.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		public static global::System.Collections.ObjectModel.ReadOnlyCollection<global::Variamos.DevOpsDsl.ApplicationHasContainers> GetLinksToContainers ( global::Variamos.DevOpsDsl.Application applicationInstance )
		{
			return DslModeling::DomainRoleInfo.GetElementLinks<global::Variamos.DevOpsDsl.ApplicationHasContainers>(applicationInstance, global::Variamos.DevOpsDsl.ApplicationHasContainers.ApplicationDomainRoleId);
		}
		#endregion
		#region Container link accessor
		/// <summary>
		/// Get the ApplicationHasContainers link to a Container.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		public static global::Variamos.DevOpsDsl.ApplicationHasContainers GetLinkToApplication (global::Variamos.DevOpsDsl.Container containerInstance)
		{
			global::System.Collections.Generic.IList<global::Variamos.DevOpsDsl.ApplicationHasContainers> links = DslModeling::DomainRoleInfo.GetElementLinks<global::Variamos.DevOpsDsl.ApplicationHasContainers>(containerInstance, global::Variamos.DevOpsDsl.ApplicationHasContainers.ContainerDomainRoleId);
			global::System.Diagnostics.Debug.Assert(links.Count <= 1, "Multiplicity of Container not obeyed.");
			if ( links.Count == 0 )
			{
				return null;
			}
			else
			{
				return links[0];
			}
		}
		#endregion
		#region ApplicationHasContainers instance accessors
		
		/// <summary>
		/// Get any ApplicationHasContainers links between a given Application and a Container.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		public static global::System.Collections.ObjectModel.ReadOnlyCollection<global::Variamos.DevOpsDsl.ApplicationHasContainers> GetLinks( global::Variamos.DevOpsDsl.Application source, global::Variamos.DevOpsDsl.Container target )
		{
			global::System.Collections.Generic.List<global::Variamos.DevOpsDsl.ApplicationHasContainers> outLinks = new global::System.Collections.Generic.List<global::Variamos.DevOpsDsl.ApplicationHasContainers>();
			global::System.Collections.Generic.IList<global::Variamos.DevOpsDsl.ApplicationHasContainers> links = DslModeling::DomainRoleInfo.GetElementLinks<global::Variamos.DevOpsDsl.ApplicationHasContainers>(source, global::Variamos.DevOpsDsl.ApplicationHasContainers.ApplicationDomainRoleId);
			foreach ( global::Variamos.DevOpsDsl.ApplicationHasContainers link in links )
			{
				if ( target.Equals(link.Container) )
				{
					outLinks.Add(link);
				}
			}
			return outLinks.AsReadOnly();
		}
		/// <summary>
		/// Get the one ApplicationHasContainers link between a given Applicationand a Container.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		public static global::Variamos.DevOpsDsl.ApplicationHasContainers GetLink( global::Variamos.DevOpsDsl.Application source, global::Variamos.DevOpsDsl.Container target )
		{
			global::System.Collections.Generic.IList<global::Variamos.DevOpsDsl.ApplicationHasContainers> links = DslModeling::DomainRoleInfo.GetElementLinks<global::Variamos.DevOpsDsl.ApplicationHasContainers>(source, global::Variamos.DevOpsDsl.ApplicationHasContainers.ApplicationDomainRoleId);
			foreach ( global::Variamos.DevOpsDsl.ApplicationHasContainers link in links )
			{
				if ( target.Equals(link.Container) )
				{
					return link;
				}
			}
			return null;
		}
		
		#endregion
	}
}
