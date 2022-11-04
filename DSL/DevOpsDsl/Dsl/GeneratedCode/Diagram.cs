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

[module: global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1506:AvoidExcessiveClassCoupling", Scope = "type", Target = "Variamos.DevOpsDsl.DevOpsDiagram")]

namespace Variamos.DevOpsDsl
{
	/// <summary>
	/// DomainClass DevOpsDiagram
	/// Description for Variamos.DevOpsDsl.DevOpsDiagram
	/// </summary>
	[DslDesign::DisplayNameResource("Variamos.DevOpsDsl.DevOpsDiagram.DisplayName", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
	[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsDiagram.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
	[DslModeling::DomainModelOwner(typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel))]
	[global::System.CLSCompliant(true)]
	[DslModeling::DomainObjectId("aa0ce2b2-1fa5-458a-82dd-05d3b4d5e591")]
	public partial class DevOpsDiagram : DslDiagrams::Diagram
	{
		#region Diagram boilerplate
		private static DslDiagrams::StyleSet classStyleSet;
		private static global::System.Collections.Generic.IList<DslDiagrams::ShapeField> shapeFields;
		/// <summary>
		/// Per-class style set for this shape.
		/// </summary>
		protected override DslDiagrams::StyleSet ClassStyleSet
		{
			get
			{
				if (classStyleSet == null)
				{
					classStyleSet = CreateClassStyleSet();
				}
				return classStyleSet;
			}
		}
		
		/// <summary>
		/// Per-class ShapeFields for this shape
		/// </summary>
		public override global::System.Collections.Generic.IList<DslDiagrams::ShapeField> ShapeFields
		{
			get
			{
				if (shapeFields == null)
				{
					shapeFields = CreateShapeFields();
				}
				return shapeFields;
			}
		}
		#endregion
		#region Toolbox filters
		private static global::System.ComponentModel.ToolboxItemFilterAttribute[] toolboxFilters = new global::System.ComponentModel.ToolboxItemFilterAttribute[] {
					new global::System.ComponentModel.ToolboxItemFilterAttribute(global::Variamos.DevOpsDsl.DevOpsDslToolboxHelperBase.ToolboxFilterString, global::System.ComponentModel.ToolboxItemFilterType.Require) };
		
		/// <summary>
		/// Toolbox item filter attributes for this diagram.
		/// </summary>
		public override global::System.Collections.ICollection TargetToolboxItemFilterAttributes
		{
			get
			{
				return toolboxFilters;
			}
		}
		#endregion
		#region Auto-placement
		/// <summary>
		/// Indicate that child shapes should added through view fixup should be placed automatically.
		/// </summary>
		public override bool ShouldAutoPlaceChildShapes
		{
			get
			{
				return true;
			}
		}
		#endregion
		#region Shape mapping
		/// <summary>
		/// Called during view fixup to ask the parent whether a shape should be created for the given child element.
		/// </summary>
		/// <remarks>
		/// Always return true, since we assume there is only one diagram per model file for DSL scenarios.
		/// </remarks>
		protected override bool ShouldAddShapeForElement(DslModeling::ModelElement element)
		{
			return true;
		}
		
		/// <summary>
		/// Called during view fixup to configure the given child element, after it has been created.
		/// </summary>
		/// <remarks>
		/// Custom code for choosing the shapes attached to either end of a connector is called from here.
		/// </remarks>
		protected override void OnChildConfiguring(DslDiagrams::ShapeElement child, bool createdDuringViewFixup)
		{
			DslDiagrams::NodeShape sourceShape;
			DslDiagrams::NodeShape targetShape;
			DslDiagrams::BinaryLinkShape connector = child as DslDiagrams::BinaryLinkShape;
			if(connector == null)
			{
				base.OnChildConfiguring(child, createdDuringViewFixup);
				return;
			}
			this.GetSourceAndTargetForConnector(connector, out sourceShape, out targetShape);
			
			global::System.Diagnostics.Debug.Assert(sourceShape != null && targetShape != null, "Unable to find source and target shapes for connector.");
			connector.Connect(sourceShape, targetShape);
		}
		
		/// <summary>
		/// helper method to find the shapes for either end of a connector, including calling the user's custom code
		/// </summary>
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
		internal void GetSourceAndTargetForConnector(DslDiagrams::BinaryLinkShape connector, out DslDiagrams::NodeShape sourceShape, out DslDiagrams::NodeShape targetShape)
		{
			sourceShape = null;
			targetShape = null;
			
			if (sourceShape == null || targetShape == null)
			{
				DslDiagrams::NodeShape[] endShapes = GetEndShapesForConnector(connector);
				if(sourceShape == null)
				{
					sourceShape = endShapes[0];
				}
				if(targetShape == null)
				{
					targetShape = endShapes[1];
				}
			}
		}
		
		/// <summary>
		/// Helper method to find shapes for either end of a connector by looking for shapes associated with either end of the relationship mapped to the connector.
		/// </summary>
		private DslDiagrams::NodeShape[] GetEndShapesForConnector(DslDiagrams::BinaryLinkShape connector)
		{
			DslModeling::ElementLink link = connector.ModelElement as DslModeling::ElementLink;
			DslDiagrams::NodeShape sourceShape = null, targetShape = null;
			if (link != null)
			{
				global::System.Collections.ObjectModel.ReadOnlyCollection<DslModeling::ModelElement> linkedElements = link.LinkedElements;
				if (linkedElements.Count == 2)
				{
					DslDiagrams::Diagram currentDiagram = this.Diagram;
					DslModeling::LinkedElementCollection<DslDiagrams::PresentationElement> presentationElements = DslDiagrams::PresentationViewsSubject.GetPresentation(linkedElements[0]);
					foreach (DslDiagrams::PresentationElement presentationElement in presentationElements)
					{
						DslDiagrams::NodeShape shape = presentationElement as DslDiagrams::NodeShape;
						if (shape != null && shape.Diagram == currentDiagram)
						{
							sourceShape = shape;
							break;
						}
					}
					
					presentationElements = DslDiagrams::PresentationViewsSubject.GetPresentation(linkedElements[1]);
					foreach (DslDiagrams::PresentationElement presentationElement in presentationElements)
					{
						DslDiagrams::NodeShape shape = presentationElement as DslDiagrams::NodeShape;
						if (shape != null && shape.Diagram == currentDiagram)
						{
							targetShape = shape;
							break;
						}
					}
		
				}
			}
			
			return new DslDiagrams::NodeShape[] { sourceShape, targetShape };
		}
		
		/// <summary>
		/// Creates a new shape for the given model element as part of view fixup
		/// </summary>
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily", Justification = "Generated code.")]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1506:AvoidExcessiveClassCoupling", Justification = "Generated code.")]
		protected override DslDiagrams::ShapeElement CreateChildShape(DslModeling::ModelElement element)
		{
			if(element is global::Variamos.DevOpsDsl.Container)
			{
				global::Variamos.DevOpsDsl.ContainerShape newShape = new global::Variamos.DevOpsDsl.ContainerShape(this.Partition);
				if(newShape != null) newShape.Size = newShape.DefaultSize; // set default shape size
				return newShape;
			}
			if(element is global::Variamos.DevOpsDsl.Practice)
			{
				global::Variamos.DevOpsDsl.PracticeShape newShape = new global::Variamos.DevOpsDsl.PracticeShape(this.Partition);
				if(newShape != null) newShape.Size = newShape.DefaultSize; // set default shape size
				return newShape;
			}
			if(element is global::Variamos.DevOpsDsl.Sre)
			{
				global::Variamos.DevOpsDsl.SreShape newShape = new global::Variamos.DevOpsDsl.SreShape(this.Partition);
				if(newShape != null) newShape.Size = newShape.DefaultSize; // set default shape size
				return newShape;
			}
			if(element is global::Variamos.DevOpsDsl.SLO)
			{
				global::Variamos.DevOpsDsl.SloShape newShape = new global::Variamos.DevOpsDsl.SloShape(this.Partition);
				if(newShape != null) newShape.Size = newShape.DefaultSize; // set default shape size
				return newShape;
			}
			if(element is global::Variamos.DevOpsDsl.ContainerHasPracticed)
			{
				global::Variamos.DevOpsDsl.ApplicationContainerConnector newShape = new global::Variamos.DevOpsDsl.ApplicationContainerConnector(this.Partition);
				return newShape;
			}
			if(element is global::Variamos.DevOpsDsl.SreHasSLO)
			{
				global::Variamos.DevOpsDsl.SreSloConnector newShape = new global::Variamos.DevOpsDsl.SreSloConnector(this.Partition);
				return newShape;
			}
			return base.CreateChildShape(element);
		}
		#endregion
		#region Decorator mapping
		/// <summary>
		/// Initialize shape decorator mappings.  This is done here rather than in individual shapes because decorator maps
		/// are defined per diagram type rather than per shape type.
		/// </summary>
		protected override void InitializeShapeFields(global::System.Collections.Generic.IList<DslDiagrams::ShapeField> shapeFields)
		{
			base.InitializeShapeFields(shapeFields);
			global::Variamos.DevOpsDsl.ContainerShape.DecoratorsInitialized += ContainerShapeDecoratorMap.OnDecoratorsInitialized;
			global::Variamos.DevOpsDsl.PracticeShape.DecoratorsInitialized += PracticeShapeDecoratorMap.OnDecoratorsInitialized;
			global::Variamos.DevOpsDsl.SreShape.DecoratorsInitialized += SreShapeDecoratorMap.OnDecoratorsInitialized;
			global::Variamos.DevOpsDsl.SloShape.DecoratorsInitialized += SloShapeDecoratorMap.OnDecoratorsInitialized;
		}
		
		/// <summary>
		/// Class containing decorator path traversal methods for ContainerShape.
		/// </summary>
		internal static partial class ContainerShapeDecoratorMap
		{
			/// <summary>
			/// Event handler called when decorator initialization is complete for ContainerShape.  Adds decorator mappings for this shape or connector.
			/// </summary>
			public static void OnDecoratorsInitialized(object sender, global::System.EventArgs e)
			{
				DslDiagrams::ShapeElement shape = (DslDiagrams::ShapeElement)sender;
				DslDiagrams::AssociatedPropertyInfo propertyInfo;
				
				propertyInfo = new DslDiagrams::AssociatedPropertyInfo(global::Variamos.DevOpsDsl.Container.ContainerNameDomainPropertyId);
				DslDiagrams::ShapeElement.FindDecorator(shape.Decorators, "NameDecorator").AssociateValueWith(shape.Store, propertyInfo);
				
				propertyInfo = new DslDiagrams::AssociatedPropertyInfo(global::Variamos.DevOpsDsl.Container.ContainerTypeDomainPropertyId);
				DslDiagrams::ShapeElement.FindDecorator(shape.Decorators, "ContinerTypeDecorator").AssociateValueWith(shape.Store, propertyInfo);
				
				propertyInfo = new DslDiagrams::AssociatedPropertyInfo(global::Variamos.DevOpsDsl.Container.ContainerFrameworkDomainPropertyId);
				DslDiagrams::ShapeElement.FindDecorator(shape.Decorators, "FrameworkDecorator").AssociateValueWith(shape.Store, propertyInfo);
			}
		}
		
		/// <summary>
		/// Class containing decorator path traversal methods for PracticeShape.
		/// </summary>
		internal static partial class PracticeShapeDecoratorMap
		{
			/// <summary>
			/// Event handler called when decorator initialization is complete for PracticeShape.  Adds decorator mappings for this shape or connector.
			/// </summary>
			public static void OnDecoratorsInitialized(object sender, global::System.EventArgs e)
			{
				DslDiagrams::ShapeElement shape = (DslDiagrams::ShapeElement)sender;
				DslDiagrams::AssociatedPropertyInfo propertyInfo;
				
				propertyInfo = new DslDiagrams::AssociatedPropertyInfo(global::Variamos.DevOpsDsl.Practice.PracticeNameDomainPropertyId);
				DslDiagrams::ShapeElement.FindDecorator(shape.Decorators, "NameDecorator").AssociateValueWith(shape.Store, propertyInfo);
				
				propertyInfo = new DslDiagrams::AssociatedPropertyInfo(global::Variamos.DevOpsDsl.Practice.PracticeNameDomainPropertyId);
				DslDiagrams::ShapeElement.FindDecorator(shape.Decorators, "NameDecorator").AssociateValueWith(shape.Store, propertyInfo);
			}
		}
		
		/// <summary>
		/// Class containing decorator path traversal methods for SreShape.
		/// </summary>
		internal static partial class SreShapeDecoratorMap
		{
			/// <summary>
			/// Event handler called when decorator initialization is complete for SreShape.  Adds decorator mappings for this shape or connector.
			/// </summary>
			public static void OnDecoratorsInitialized(object sender, global::System.EventArgs e)
			{
				DslDiagrams::ShapeElement shape = (DslDiagrams::ShapeElement)sender;
				DslDiagrams::AssociatedPropertyInfo propertyInfo;
				
				propertyInfo = new DslDiagrams::AssociatedPropertyInfo(global::Variamos.DevOpsDsl.Sre.SreNameDomainPropertyId);
				DslDiagrams::ShapeElement.FindDecorator(shape.Decorators, "NameDecorator").AssociateValueWith(shape.Store, propertyInfo);
			}
		}
		
		/// <summary>
		/// Class containing decorator path traversal methods for SloShape.
		/// </summary>
		internal static partial class SloShapeDecoratorMap
		{
			/// <summary>
			/// Event handler called when decorator initialization is complete for SloShape.  Adds decorator mappings for this shape or connector.
			/// </summary>
			public static void OnDecoratorsInitialized(object sender, global::System.EventArgs e)
			{
				DslDiagrams::ShapeElement shape = (DslDiagrams::ShapeElement)sender;
				DslDiagrams::AssociatedPropertyInfo propertyInfo;
				
				propertyInfo = new DslDiagrams::AssociatedPropertyInfo(global::Variamos.DevOpsDsl.SLO.SloNameDomainPropertyId);
				DslDiagrams::ShapeElement.FindDecorator(shape.Decorators, "NameDecorator").AssociateValueWith(shape.Store, propertyInfo);
				
				propertyInfo = new DslDiagrams::AssociatedPropertyInfo(global::Variamos.DevOpsDsl.SLO.LowerBoundDomainPropertyId);
				DslDiagrams::ShapeElement.FindDecorator(shape.Decorators, "LowerBoundDecorator").AssociateValueWith(shape.Store, propertyInfo);
				
				propertyInfo = new DslDiagrams::AssociatedPropertyInfo(global::Variamos.DevOpsDsl.SLO.OperatorDomainPropertyId);
				DslDiagrams::ShapeElement.FindDecorator(shape.Decorators, "OperatorDecorator").AssociateValueWith(shape.Store, propertyInfo);
				
				propertyInfo = new DslDiagrams::AssociatedPropertyInfo(global::Variamos.DevOpsDsl.SLO.UpperBoundDomainPropertyId);
				DslDiagrams::ShapeElement.FindDecorator(shape.Decorators, "UpperDecorator").AssociateValueWith(shape.Store, propertyInfo);
			}
		}
		
		#endregion
		#region Constructors, domain class Id
	
		/// <summary>
		/// DevOpsDiagram domain class Id.
		/// </summary>
		public static readonly new global::System.Guid DomainClassId = new global::System.Guid(0xaa0ce2b2, 0x1fa5, 0x458a, 0x82, 0xdd, 0x05, 0xd3, 0xb4, 0xd5, 0xe5, 0x91);
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="store">Store where new element is to be created.</param>
		/// <param name="propertyAssignments">List of domain property id/value pairs to set once the element is created.</param>
		public DevOpsDiagram(DslModeling::Store store, params DslModeling::PropertyAssignment[] propertyAssignments)
			: this(store != null ? store.DefaultPartitionForClass(DomainClassId) : null, propertyAssignments)
		{
		}
		
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="partition">Partition where new element is to be created.</param>
		/// <param name="propertyAssignments">List of domain property id/value pairs to set once the element is created.</param>
		public DevOpsDiagram(DslModeling::Partition partition, params DslModeling::PropertyAssignment[] propertyAssignments)
			: base(partition, propertyAssignments)
		{
		}
		#endregion
		#region DiamgramName domain property code
		
		/// <summary>
		/// DiamgramName domain property Id.
		/// </summary>
		public static readonly global::System.Guid DiamgramNameDomainPropertyId = new global::System.Guid(0x5613bec2, 0x725d, 0x4f55, 0x8e, 0xe8, 0x0f, 0x27, 0xbc, 0x54, 0xf1, 0x3a);
		
		/// <summary>
		/// Storage for DiamgramName
		/// </summary>
		private global::System.String diamgramNamePropertyStorage = "My diagram";
		
		/// <summary>
		/// Gets or sets the value of DiamgramName domain property.
		/// Name of the diagram
		/// </summary>
		[DslDesign::DisplayNameResource("Variamos.DevOpsDsl.DevOpsDiagram/DiamgramName.DisplayName", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		[DslDesign::DescriptionResource("Variamos.DevOpsDsl.DevOpsDiagram/DiamgramName.Description", typeof(global::Variamos.DevOpsDsl.DevOpsDslDomainModel), "Variamos.DevOpsDsl.GeneratedCode.DomainModelResx")]
		[global::System.ComponentModel.DefaultValue("My diagram")]
		[DslModeling::DomainObjectId("5613bec2-725d-4f55-8ee8-0f27bc54f13a")]
		public global::System.String DiamgramName
		{
			[global::System.Diagnostics.DebuggerStepThrough]
			get
			{
				return diamgramNamePropertyStorage;
			}
			[global::System.Diagnostics.DebuggerStepThrough]
			set
			{
				DiamgramNamePropertyHandler.Instance.SetValue(this, value);
			}
		}
		/// <summary>
		/// Value handler for the DevOpsDiagram.DiamgramName domain property.
		/// </summary>
		internal sealed partial class DiamgramNamePropertyHandler : DslModeling::DomainPropertyValueHandler<DevOpsDiagram, global::System.String>
		{
			private DiamgramNamePropertyHandler() { }
		
			/// <summary>
			/// Gets the singleton instance of the DevOpsDiagram.DiamgramName domain property value handler.
			/// </summary>
			public static readonly DiamgramNamePropertyHandler Instance = new DiamgramNamePropertyHandler();
		
			/// <summary>
			/// Gets the Id of the DevOpsDiagram.DiamgramName domain property.
			/// </summary>
			public sealed override global::System.Guid DomainPropertyId
			{
				[global::System.Diagnostics.DebuggerStepThrough]
				get
				{
					return DiamgramNameDomainPropertyId;
				}
			}
			
			/// <summary>
			/// Gets a strongly-typed value of the property on specified element.
			/// </summary>
			/// <param name="element">Element which owns the property.</param>
			/// <returns>Property value.</returns>
			public override sealed global::System.String GetValue(DevOpsDiagram element)
			{
				if (element == null) throw new global::System.ArgumentNullException("element");
				return element.diamgramNamePropertyStorage;
			}
		
			/// <summary>
			/// Sets property value on an element.
			/// </summary>
			/// <param name="element">Element which owns the property.</param>
			/// <param name="newValue">New property value.</param>
			public override sealed void SetValue(DevOpsDiagram element, global::System.String newValue)
			{
				if (element == null) throw new global::System.ArgumentNullException("element");
		
				global::System.String oldValue = GetValue(element);
				if (newValue != oldValue)
				{
					ValueChanging(element, oldValue, newValue);
					element.diamgramNamePropertyStorage = newValue;
					ValueChanged(element, oldValue, newValue);
				}
			}
		}
		
		#endregion
	}
}
namespace Variamos.DevOpsDsl
{
	
		/// <summary>
		/// Double derived implementation for the rule that initiates view fixup when an element that has an associated shape is added to the model.
		/// This now enables the DSL author to everride the SkipFixUp() method 
		/// </summary>
		internal partial class FixUpDiagramBase : DslModeling::AddRule
		{
			protected virtual bool SkipFixup(DslModeling::ModelElement childElement)
			{
				return childElement.IsDeleted;
			}
		}
	
		/// <summary>
		/// Rule that initiates view fixup when an element that has an associated shape is added to the model. 
		/// </summary>
		[DslModeling::RuleOn(typeof(global::Variamos.DevOpsDsl.Container), FireTime = DslModeling::TimeToFire.TopLevelCommit, Priority = DslDiagrams::DiagramFixupConstants.AddShapeParentExistRulePriority, InitiallyDisabled=true)]
		[DslModeling::RuleOn(typeof(global::Variamos.DevOpsDsl.Practice), FireTime = DslModeling::TimeToFire.TopLevelCommit, Priority = DslDiagrams::DiagramFixupConstants.AddShapeParentExistRulePriority, InitiallyDisabled=true)]
		[DslModeling::RuleOn(typeof(global::Variamos.DevOpsDsl.Sre), FireTime = DslModeling::TimeToFire.TopLevelCommit, Priority = DslDiagrams::DiagramFixupConstants.AddShapeParentExistRulePriority, InitiallyDisabled=true)]
		[DslModeling::RuleOn(typeof(global::Variamos.DevOpsDsl.SLO), FireTime = DslModeling::TimeToFire.TopLevelCommit, Priority = DslDiagrams::DiagramFixupConstants.AddShapeParentExistRulePriority, InitiallyDisabled=true)]
		[DslModeling::RuleOn(typeof(global::Variamos.DevOpsDsl.ContainerHasPracticed), FireTime = DslModeling::TimeToFire.TopLevelCommit, Priority = DslDiagrams::DiagramFixupConstants.AddConnectionRulePriority, InitiallyDisabled=true)]
		[DslModeling::RuleOn(typeof(global::Variamos.DevOpsDsl.SreHasSLO), FireTime = DslModeling::TimeToFire.TopLevelCommit, Priority = DslDiagrams::DiagramFixupConstants.AddConnectionRulePriority, InitiallyDisabled=true)]
		internal sealed partial class FixUpDiagram : FixUpDiagramBase
		{
			[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
			public override void ElementAdded(DslModeling::ElementAddedEventArgs e)
			{
				if(e == null) throw new global::System.ArgumentNullException("e");
			
				DslModeling::ModelElement childElement = e.ModelElement;
				if (this.SkipFixup(childElement))
					return;
				DslModeling::ModelElement parentElement;
				if(childElement is DslModeling::ElementLink)
				{
					parentElement = GetParentForRelationship((DslModeling::ElementLink)childElement);
				} else
				if(childElement is global::Variamos.DevOpsDsl.Container)
				{
					parentElement = GetParentForContainer((global::Variamos.DevOpsDsl.Container)childElement);
				} else
				if(childElement is global::Variamos.DevOpsDsl.Practice)
				{
					parentElement = GetParentForPractice((global::Variamos.DevOpsDsl.Practice)childElement);
				} else
				if(childElement is global::Variamos.DevOpsDsl.Sre)
				{
					parentElement = GetParentForSre((global::Variamos.DevOpsDsl.Sre)childElement);
				} else
				if(childElement is global::Variamos.DevOpsDsl.SLO)
				{
					parentElement = GetParentForSLO((global::Variamos.DevOpsDsl.SLO)childElement);
				} else
				{
					parentElement = null;
				}
				
				if(parentElement != null)
				{
					DslDiagrams::Diagram.FixUpDiagram(parentElement, childElement);
				}
			}
			public static global::Variamos.DevOpsDsl.Application GetParentForContainer( global::Variamos.DevOpsDsl.Container root )
			{
				// Segments 0 and 1
				global::Variamos.DevOpsDsl.Application result = root.Application;
				if ( result == null ) return null;
				return result;
			}
			public static global::Variamos.DevOpsDsl.Application GetParentForPractice( global::Variamos.DevOpsDsl.Practice root )
			{
				// Segments 0 and 1
				global::Variamos.DevOpsDsl.Container root2 = root.Container;
				if ( root2 == null ) return null;
				// Segments 2 and 3
				global::Variamos.DevOpsDsl.Application result = root2.Application;
				if ( result == null ) return null;
				return result;
			}
			public static global::Variamos.DevOpsDsl.Application GetParentForSre( global::Variamos.DevOpsDsl.Sre root )
			{
				// Segments 0 and 1
				global::Variamos.DevOpsDsl.Application result = root.Application;
				if ( result == null ) return null;
				return result;
			}
			public static global::Variamos.DevOpsDsl.Application GetParentForSLO( global::Variamos.DevOpsDsl.SLO root )
			{
				// Segments 0 and 1
				global::Variamos.DevOpsDsl.Sre root2 = root.Sre;
				if ( root2 == null ) return null;
				// Segments 2 and 3
				global::Variamos.DevOpsDsl.Application result = root2.Application;
				if ( result == null ) return null;
				return result;
			}
			private static DslModeling::ModelElement GetParentForRelationship(DslModeling::ElementLink elementLink)
			{
				global::System.Collections.ObjectModel.ReadOnlyCollection<DslModeling::ModelElement> linkedElements = elementLink.LinkedElements;
	
				if (linkedElements.Count == 2)
				{
					DslDiagrams::ShapeElement sourceShape = linkedElements[0] as DslDiagrams::ShapeElement;
					DslDiagrams::ShapeElement targetShape = linkedElements[1] as DslDiagrams::ShapeElement;
	
					if(sourceShape == null)
					{
						DslModeling::LinkedElementCollection<DslDiagrams::PresentationElement> presentationElements = DslDiagrams::PresentationViewsSubject.GetPresentation(linkedElements[0]);
						foreach (DslDiagrams::PresentationElement presentationElement in presentationElements)
						{
							DslDiagrams::ShapeElement shape = presentationElement as DslDiagrams::ShapeElement;
							if (shape != null)
							{
								sourceShape = shape;
								break;
							}
						}
					}
					
					if(targetShape == null)
					{
						DslModeling::LinkedElementCollection<DslDiagrams::PresentationElement> presentationElements = DslDiagrams::PresentationViewsSubject.GetPresentation(linkedElements[1]);
						foreach (DslDiagrams::PresentationElement presentationElement in presentationElements)
						{
							DslDiagrams::ShapeElement shape = presentationElement as DslDiagrams::ShapeElement;
							if (shape != null)
							{
								targetShape = shape;
								break;
							}
						}
					}
					
					if(sourceShape == null || targetShape == null)
					{
						global::System.Diagnostics.Debug.Fail("Unable to find source and/or target shape for view fixup.");
						return null;
					}
	
					DslDiagrams::ShapeElement sourceParent = sourceShape.ParentShape;
					DslDiagrams::ShapeElement targetParent = targetShape.ParentShape;
	
					while (sourceParent != targetParent && sourceParent != null)
					{
						DslDiagrams::ShapeElement curParent = targetParent;
						while (sourceParent != curParent && curParent != null)
						{
							curParent = curParent.ParentShape;
						}
	
						if(sourceParent == curParent)
						{
							break;
						}
						else
						{
							sourceParent = sourceParent.ParentShape;
						}
					}
	
					while (sourceParent != null)
					{
						// ensure that the parent can parent connectors (i.e., a diagram or a swimlane).
						if(sourceParent is DslDiagrams::Diagram || sourceParent is DslDiagrams::SwimlaneShape)
						{
							break;
						}
						else
						{
							sourceParent = sourceParent.ParentShape;
						}
					}
	
					global::System.Diagnostics.Debug.Assert(sourceParent != null && sourceParent.ModelElement != null, "Unable to find common parent for view fixup.");
					return sourceParent.ModelElement;
				}
	
				return null;
			}
		}
		
	
		/// <summary>
		/// Reroute a connector when the role players of its underlying relationship change
		/// </summary>
		[DslModeling::RuleOn(typeof(global::Variamos.DevOpsDsl.ContainerHasPracticed), FireTime = DslModeling::TimeToFire.TopLevelCommit, Priority = DslDiagrams::DiagramFixupConstants.AddConnectionRulePriority, InitiallyDisabled=true)]
		[DslModeling::RuleOn(typeof(global::Variamos.DevOpsDsl.SreHasSLO), FireTime = DslModeling::TimeToFire.TopLevelCommit, Priority = DslDiagrams::DiagramFixupConstants.AddConnectionRulePriority, InitiallyDisabled=true)]
		internal sealed class ConnectorRolePlayerChanged : DslModeling::RolePlayerChangeRule
		{
			/// <summary>
			/// Reroute a connector when the role players of its underlying relationship change
			/// </summary>
			public override void RolePlayerChanged(DslModeling::RolePlayerChangedEventArgs e)
			{
				if (e == null) throw new global::System.ArgumentNullException("e");
	
				global::System.Collections.ObjectModel.ReadOnlyCollection<DslDiagrams::PresentationViewsSubject> connectorLinks = DslDiagrams::PresentationViewsSubject.GetLinksToPresentation(e.ElementLink);
				foreach (DslDiagrams::PresentationViewsSubject connectorLink in connectorLinks)
				{
					// Fix up any binary link shapes attached to the element link.
					DslDiagrams::BinaryLinkShape linkShape = connectorLink.Presentation as DslDiagrams::BinaryLinkShape;
					if (linkShape != null)
					{
						global::Variamos.DevOpsDsl.DevOpsDiagram diagram = linkShape.Diagram as global::Variamos.DevOpsDsl.DevOpsDiagram;
						if (diagram != null)
						{
							if (e.NewRolePlayer != null)
							{
								DslDiagrams::NodeShape fromShape;
								DslDiagrams::NodeShape toShape;
								diagram.GetSourceAndTargetForConnector(linkShape, out fromShape, out toShape);
								if (fromShape != null && toShape != null)
								{
									if (!object.Equals(fromShape, linkShape.FromShape))
									{
										linkShape.FromShape = fromShape;
									}
									if (!object.Equals(linkShape.ToShape, toShape))
									{
										linkShape.ToShape = toShape;
									}
								}
								else
								{
									// delete the connector if we cannot find an appropriate target shape.
									linkShape.Delete();
								}
							}
							else
							{
								// delete the connector if the new role player is null.
								linkShape.Delete();
							}
						}
					}
				}
			}
		}
	}