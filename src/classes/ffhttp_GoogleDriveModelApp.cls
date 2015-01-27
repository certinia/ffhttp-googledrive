/**
 * Copyright (c) 2014, FinancialForce.com, inc
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, 
 *   are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, 
 *      this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, 
 *      this list of conditions and the following disclaimer in the documentation 
 *      and/or other materials provided with the distribution.
 * - Neither the name of the FinancialForce.com, inc nor the names of its contributors 
 *      may be used to endorse or promote products derived from this software without 
 *      specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
 *  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
 *  THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 *  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 *  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**/

/**
 * ffhttp_GoogleDriveModelApp
 *
 * An object that represents the meta data for a Google Drive App.
 * https://developers.google.com/drive/v2/reference/apps#resource
 */
public with sharing class ffhttp_GoogleDriveModelApp extends ffhttp_GoogleDriveModelAbstractObject 
{
	//Icon categories
	public static final String APP_ICON_CATEGORY_APPLICATION = 'application';			//icon for the application
	public static final String APP_ICON_CATEGORY_DOCUMENT = 'document';					//icon for a file associated with the app
	public static final String APP_ICON_CATEGORY_DOCUMENT_SHARED = 'documentShared';	//icon for a shared file associated with the app

	//Instance variables
	private String id;							//The ID of the app.	
	private String name;						//The name of the app.	
	private String objectType;					//The type of object this app creates (e.g. Chart).
												//If empty, the app name should be used instead.
	private Boolean supportsCreate;				//Whether this app supports creating new objects.	
	private Boolean supportsImport;				//Whether this app supports importing Google Docs.	
	private Boolean installed;					//Whether the app is installed.	
	private Boolean authorized;					//Whether the app is authorized to access data on the user's Drive.	
	private Boolean useByDefault;				//Whether the app is selected as the default handler for the types it supports.	
	private String productUrl;					//A link to the product listing for this app.	
	private String[] primaryMimeTypes;			//The list of primary mime types.	
	private String[] secondaryMimeTypes;		//The list of secondary mime types.	
	private String[] primaryFileExtensions;		//The list of primary file extensions.	
	private String[] secondaryFileExtensions;	//The list of secondary file extensions.
	private Icon[] icons;						//The various icons for the app.
	private String shortDescription;			//A short description of the app.	
	private String longDescription;	 			//A long description of the app.
	private Boolean supportsMultiOpen;			//Whether this app supports opening more than one file.	
	private String productId;					//The ID of the product listing for this app.
	private String openUrlTemplate;				//The template url for opening files with this app. 
												//The template will contain {id} and/or {exportId} placeholders to 
												//be replaced by a file ID.					
	private String createUrl;					//The url to create a new file with this app.
	private String createInFolderTemplate;		//The template url to create a new file with this app in a given folder. 
												//The template will contain {folderId} to be replaced by the folder 
												//to create the new file in.						
	private Boolean supportsOfflineCreate ;		//Whether this app supports creating new files when offline.	
	private Boolean hasDriveWideScope;			//Whether the app has drive-wide scope. An app with drive-wide scope 
												//can access all files in the user's drive.
	
	/**
	 * Constructor
	 */
	public ffhttp_GoogleDriveModelApp()
	{
		super(KIND_DRIVE_APP);
	}
	
	/**
	 * Get/Sets
	 */
	public String getId() 
	{
		return id;
	}
	public ffhttp_GoogleDriveModelApp setId(String id) 
	{
		this.id = id;
		return this;
	}
	public String getName() 
	{
		return name;
	}
	public ffhttp_GoogleDriveModelApp setName(String name) 
	{
		this.name = name;
		return this;
	}
	public String getObjectType() 
	{
		return objectType;
	}
	public ffhttp_GoogleDriveModelApp setObjectType(String objectType) 
	{
		this.objectType = objectType;
		return this;
	}
	public Boolean getSupportsCreate() 
	{
		return supportsCreate;
	}
	public ffhttp_GoogleDriveModelApp setSupportsCreate(Boolean supportsCreate) 
	{
		this.supportsCreate = supportsCreate;
		return this;
	}
	public Boolean getSupportsImport() 
	{
		return supportsImport;
	}
	public ffhttp_GoogleDriveModelApp setSupportsImport(Boolean supportsImport) 
	{
		this.supportsImport = supportsImport;
		return this;
	}
	public Boolean getInstalled() 
	{
		return installed;
	}
	public ffhttp_GoogleDriveModelApp setInstalled(Boolean installed) 
	{
		this.installed = installed;
		return this;
	}
	public Boolean getAuthorized() 
	{
		return authorized;
	}
	public ffhttp_GoogleDriveModelApp setAuthorized(Boolean authorized) 
	{
		this.authorized = authorized;
		return this;
	}
	public Boolean getUseByDefault() 
	{
		return useByDefault;
	}
	public ffhttp_GoogleDriveModelApp setUseByDefault(Boolean useByDefault) 
	{
		this.useByDefault = useByDefault;
		return this;
	}
	public String getProductUrl() 
	{
		return productUrl;
	}
	public ffhttp_GoogleDriveModelApp setProductUrl(String productUrl) 
	{
		this.productUrl = productUrl;
		return this;
	}
	public String[] getPrimaryMimeTypes() 
	{
		return primaryMimeTypes;
	}
	public ffhttp_GoogleDriveModelApp setPrimaryMimeTypes(String[] primaryMimeTypes) 
	{
		this.primaryMimeTypes = primaryMimeTypes;
		return this;
	}
	public String[] getSecondaryMimeTypes() 
	{
		return secondaryMimeTypes;
	}
	public ffhttp_GoogleDriveModelApp setSecondaryMimeTypes(String[] secondaryMimeTypes) 
	{
		this.secondaryMimeTypes = secondaryMimeTypes;
		return this;
	}
	public String[] getPrimaryFileExtensions() 
	{
		return primaryFileExtensions;
	}
	public ffhttp_GoogleDriveModelApp setPrimaryFileExtensions(String[] primaryFileExtensions) 
	{
		this.primaryFileExtensions = primaryFileExtensions;
		return this;
	}
	public String[] getSecondaryFileExtensions()
	{
		return secondaryFileExtensions;
	}
	public ffhttp_GoogleDriveModelApp setSecondaryFileExtensions(String[] secondaryFileExtensions) 
	{
		this.secondaryFileExtensions = secondaryFileExtensions;
		return this;
	}
	public Icon[] getIcons() 
	{
		return icons;
	}
	public ffhttp_GoogleDriveModelApp setIcons(Icon[] icons) 
	{
		this.icons = icons;
		return this;
	}
	public String getShortDescription() 
	{
		return shortDescription;
	}
	public ffhttp_GoogleDriveModelApp setShortDescription(String shortDescription) 
	{
		this.shortDescription = shortDescription;
		return this;
	}
	public String getLongDescription() 
	{
		return longDescription;
	}
	public ffhttp_GoogleDriveModelApp setLongDescription(String longDescription) 
	{
		this.longDescription = longDescription;
		return this;
	}
	public Boolean getSupportsMultiOpen() 
	{
		return supportsMultiOpen;
	}
	public ffhttp_GoogleDriveModelApp setSupportsMultiOpen(Boolean supportsMultiOpen) 
	{
		this.supportsMultiOpen = supportsMultiOpen;
		return this;
	}
	public String getProductId() 
	{
		return productId;
	}
	public ffhttp_GoogleDriveModelApp setProductId(String productId) 
	{
		this.productId = productId;
		return this;
	}
	public String getOpenUrlTemplate() 
	{
		return openUrlTemplate;
	}
	public ffhttp_GoogleDriveModelApp setOpenUrlTemplate(String openUrlTemplate) 
	{
		this.openUrlTemplate = openUrlTemplate;
		return this;
	}
	public String getCreateUrl() 
	{
		return createUrl;
	}
	public ffhttp_GoogleDriveModelApp setCreateUrl(String createUrl) 
	{
		this.createUrl = createUrl;
		return this;
	}
	public String getCreateInFolderTemplate() 
	{
		return createInFolderTemplate;
	}
	public ffhttp_GoogleDriveModelApp setCreateInFolderTemplate(String createInFolderTemplate) 
	{
		this.createInFolderTemplate = createInFolderTemplate;
		return this;
	}
	public Boolean getSupportsOfflineCreate() 
	{
		return supportsOfflineCreate;
	}
	public ffhttp_GoogleDriveModelApp setSupportsOfflineCreate(Boolean supportsOfflineCreate) 
	{
		this.supportsOfflineCreate = supportsOfflineCreate;
		return this;
	}
	public Boolean getHasDriveWideScope() 
	{
		return hasDriveWideScope;
	}
	public ffhttp_GoogleDriveModelApp setHasDriveWideScope(Boolean hasDriveWideScope) 
	{
		this.hasDriveWideScope = hasDriveWideScope;
		return this;
	}
	
	/**
	 * Icon inner class
	 */ 
	public class Icon extends ffhttp_AbstractJsonSerializable
	{
		private String category;	//Category of the icon. Allowed values are application, document & documentShared.
		private Integer size;		//Size of the icon. Represented as the maximum of the width and height.	
		private String iconUrl; 	//URL for the icon.	
		
		/**
		 * Get/Sets
		 */
		public String getCategory() 
		{
			return category;
		}
		public Icon setCategory(String category) 
		{
			this.category = category;
			return this;
		}
		public Integer getSize() 
		{
			return size;
		}
		public Icon setSize(Integer size) 
		{
			this.size = size;
			return this;
		}
		public String getIconUrl() 
		{
			return iconUrl;
		}
		public Icon setIconUrl(String iconUrl) 
		{
			this.iconUrl = iconUrl;
			return this;
		}
	}
	
	/**
	 * Object to represent a list of Google Drive apps.
	 */
	public with sharing class ItemList extends ffhttp_GoogleDriveModelAbstractObject.AbstractList
	{
		List<ffhttp_GoogleDriveModelApp> items;
		
		/**
		 * Constructor
		 */
		public ItemList()
		{
			super(KIND_DRIVE_APP_LIST);
		}
			
		public override List<ffhttp_GoogleDriveModelAbstractObject> getItems() 
		{
			return (List<ffhttp_GoogleDriveModelApp>)items;
		}
	}
}
