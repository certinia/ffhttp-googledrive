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
 * ffhttp_GoogleDriveModelAbout
 *
 * An object that represents the meta data for the user information and settings of Google Drive.
 * https://developers.google.com/drive/v2/reference/about#resource
 */
public with sharing class ffhttp_GoogleDriveModelAbout extends ffhttp_GoogleDriveModelAbstractObject
{
	//Quota type statics
	public final static String QUOTA_TYPE_LIMITED = 'LIMITED';
	public final static String QUOTA_TYPE_UNLIMITED = 'UNLIMITED';
	
	//Instance variables
	private String etag;					//The ETag of the item.	
	private String selfLink;				//A link back to this item.	
	private String name;					//The name of the current user.	
	private Long quotaBytesTotal;			//The total number of quota bytes.	
	private Long quotaBytesUsed;			//The number of quota bytes used by Google Drive.
	private Long quotaBytesUsedInTrash;		//The number of quota bytes used by trashed items.
	private Long quotaBytesUsedAggregate;	//The number of quota bytes used by all Google apps (Drive, Picasa, etc.).	
	private Long largestChangeId;			//The largest change id.	
	private Long remainingChangeIds;		//The number of remaining change ids.	
	private String rootFolderId;			//The id of the root folder.	
	private String domainSharingPolicy;		//The domain sharing policy for the current user.
	private String permissionId;			//The current user's ID as visible in the permissions collection.
	private Boolean isCurrentAppInstalled; 	//A boolean indicating whether the authenticated app is installed
											//by the authenticated user.	
	private String languageCode;			//The user's language or locale code, as defined by BCP 47, with some 
											//extensions from Unicode's LDML format (http://www.unicode.org/reports/tr35/).	
	private String quotaType;				//The type of the user's storage quota. 
											//Possible values are: LIMITED, UNLIMITED						
	private Formats[] inputFormats;			//The allowable import formats.	
	private Formats[] exportFormats;		//The allowable export formats.
	private Feature[] features;				//List of additional features enabled on this account.
	private MaxUploadSize[] maxUploadSizes;	//List of max upload sizes for each file type. 
											//The most specific type takes precedence.		
											
	private QuotaBytesByService[] quotaBytesByService;	//The amount of storage quota used by different Google services.									
	private AdditionalRoleInfo[] additionalRoleInfo;	//Information about supported additional roles per file type. 
														//The most specific type takes precedence.
	private ffhttp_GoogleDriveModelUser user;			//The authenticated user.	
	
	/**
	 * Constructor
	 */
	public ffhttp_GoogleDriveModelAbout()
	{
		super(KIND_DRIVE_ABOUT);
	}
	
	/**
	 * Get/Set methods
	 */
	public String getEtag() 
	{
		return etag;
	}
	public ffhttp_GoogleDriveModelAbout setEtag(String etag) 
	{
		this.etag = etag;
		return this;
	}
	public String getSelfLink()
	{
		return selfLink;
	}
	public ffhttp_GoogleDriveModelAbout setSelfLink(String selfLink) 
	{
		this.selfLink = selfLink;
		return this;
	}
	public String getName() 
	{
		return name;
	}
	public ffhttp_GoogleDriveModelAbout setName(String name) 
	{
		this.name = name;
		return this;
	}
	public Long getQuotaBytesTotal() 
	{
		return quotaBytesTotal;
	}
	public ffhttp_GoogleDriveModelAbout setQuotaBytesTotal(Long quotaBytesTotal) 
	{
		this.quotaBytesTotal = quotaBytesTotal;
		return this;
	}
	public Long getQuotaBytesUsed() 
	{
		return quotaBytesUsed;
	}
	public ffhttp_GoogleDriveModelAbout setQuotaBytesUsed(Long quotaBytesUsed) 
	{
		this.quotaBytesUsed = quotaBytesUsed;
		return this;
	}
	public Long getQuotaBytesUsedInTrash() 
	{
		return quotaBytesUsedInTrash;
	}
	public ffhttp_GoogleDriveModelAbout setQuotaBytesUsedInTrash(Long quotaBytesUsedInTrash) 
	{
		this.quotaBytesUsedInTrash = quotaBytesUsedInTrash;
		return this;
	}
	public Long getQuotaBytesUsedAggregate() 
	{
		return quotaBytesUsedAggregate;
	}
	public ffhttp_GoogleDriveModelAbout setQuotaBytesUsedAggregate(Long quotaBytesUsedAggregate) 
	{
		this.quotaBytesUsedAggregate = quotaBytesUsedAggregate;
		return this;
	}
	public Long getLargestChangeId() 
	{
		return largestChangeId;
	}
	public ffhttp_GoogleDriveModelAbout setLargestChangeId(Long largestChangeId) 
	{
		this.largestChangeId = largestChangeId;
		return this;
	}
	public Long getRemainingChangeIds() 
	{
		return remainingChangeIds;
	}
	public ffhttp_GoogleDriveModelAbout setRemainingChangeIds(Long remainingChangeIds) 
	{
		this.remainingChangeIds = remainingChangeIds;
		return this;
	}
	public String getRootFolderId() 
	{
		return rootFolderId;
	}
	public ffhttp_GoogleDriveModelAbout setRootFolderId(String rootFolderId) 
	{
		this.rootFolderId = rootFolderId;
		return this;
	}
	public String getDomainSharingPolicy() 
	{
		return domainSharingPolicy;
	}
	public ffhttp_GoogleDriveModelAbout setDomainSharingPolicy(String domainSharingPolicy) 
	{
		this.domainSharingPolicy = domainSharingPolicy;
		return this;
	}
	public String getPermissionId() 
	{
		return permissionId;
	}
	public ffhttp_GoogleDriveModelAbout setPermissionId(String permissionId) 
	{
		this.permissionId = permissionId;
		return this;
	}
	public Boolean getIsCurrentAppInstalled() 
	{
		return isCurrentAppInstalled;
	}
	public ffhttp_GoogleDriveModelAbout setIsCurrentAppInstalled(Boolean isCurrentAppInstalled) 
	{
		this.isCurrentAppInstalled = isCurrentAppInstalled;
		return this;
	}
	public String getLanguageCode() 
	{
		return languageCode;
	}
	public ffhttp_GoogleDriveModelAbout setLanguageCode(String languageCode) 
	{
		this.languageCode = languageCode;
		return this;
	}
	public String getQuotaType() 
	{
		return quotaType;
	}
	public ffhttp_GoogleDriveModelAbout setQuotaType(String quotaType) 
	{
		this.quotaType = quotaType;
		return this;
	}
	public Formats[] getInputFormats() 
	{
		return inputFormats;
	}
	public ffhttp_GoogleDriveModelAbout setInputFormats(Formats[] inputFormats) 
	{
		this.inputFormats = inputFormats;
		return this;
	}
	public Formats[] getExportFormats() 
	{
		return exportFormats;
	}
	public ffhttp_GoogleDriveModelAbout setExportFormats(Formats[] exportFormats) 
	{
		this.exportFormats = exportFormats;
		return this;
	}
	public Feature[] getFeatures() 
	{
		return features;
	}
	public ffhttp_GoogleDriveModelAbout setFeatures(Feature[] features) 
	{
		this.features = features;
		return this;
	}
	public MaxUploadSize[] getMaxUploadSizes() 
	{
		return maxUploadSizes;
	}
	public ffhttp_GoogleDriveModelAbout setMaxUploadSizes(MaxUploadSize[] maxUploadSizes) 
	{
		this.maxUploadSizes = maxUploadSizes;
		return this;
	}
	public QuotaBytesByService[] getQuotaBytesByService() 
	{
		return quotaBytesByService;
	}
	public ffhttp_GoogleDriveModelAbout setQuotaBytesByService(QuotaBytesByService[] quotaBytesByService) 
	{
		this.quotaBytesByService = quotaBytesByService;
		return this;
	}
	public AdditionalRoleInfo[] getAdditionalRoleInfo() 
	{
		return additionalRoleInfo;
	}
	public ffhttp_GoogleDriveModelAbout setAdditionalRoleInfo(AdditionalRoleInfo[] additionalRoleInfo)
	{
		this.additionalRoleInfo = additionalRoleInfo;
		return this;
	}
	public ffhttp_GoogleDriveModelUser getUser() 
	{
		return user;
	}
	public ffhttp_GoogleDriveModelAbout setUser(ffhttp_GoogleDriveModelUser user) 
	{
		this.user = user;
		return this;
	}
	
	/**
	 * Inner class to wrap up information regarding Google Input/Export formats.
	 */
	public class Formats extends ffhttp_AbstractJsonSerializable 
	{	
		private String source;		//The content type to convert from
		private String[] targets;	//The possible content types to convert to.
		
		public String getSource() 
		{
			return source;
		}
		public Formats setSource(String source) 
		{
			this.source = source;
			return this;
		}
		public String[] getTargets() 
		{
			return targets;
		}
		public Formats setTargets(String[] targets) 
		{
			this.targets = targets;
			return this;
		}
	}
	
	/**
	 * Inner class to wrap up information regarding Google features.
	 */
	public class Feature extends ffhttp_AbstractJsonSerializable
	{
		private String featureName;	//The name of the feature.	
		private Double featureRate;	//The request limit rate for this feature, in queries per second.
		
		public String getFeatureName() 
		{
			return featureName;
		}
		public Feature setFeatureName(String featureName) 
		{
			this.featureName = featureName;
			return this;
		}
		public Double getFeatureRate() 
		{
			return featureRate;
		}
		public Feature setFeatureRate(Double featureRate) 
		{
			this.featureRate = featureRate;
			return this;
		}
	}
	
	/**
	 * Inner class to wrap up information regarding Google max upload size.
	 */
	public class MaxUploadSize extends ffhttp_AbstractJsonSerializable
	{
		private String type;	//The file type.	
		private Long size;		//The max upload size for this type.
		
		public String getType() 
		{
			return type;
		}
		public MaxUploadSize setType(String type) 
		{
			this.type = type;
			return this;
		}
		public Long getSize() 
		{
			return size;
		}
		public MaxUploadSize setSize(Long size) 
		{
			this.size = size;
			return this;
		}
	}
	
	/**
	 * Inner class to wrap up information regarding Google Service quotas.
	 */
	public class QuotaBytesByService extends ffhttp_AbstractJsonSerializable
	{
		private String serviceName; //The service's name, e.g. DRIVE, GMAIL, or PHOTOS.
		private Long bytesUsed;		//The storage quota bytes used by the service.
		
		public String getServiceName() 
		{
			return serviceName;
		}
		public QuotaBytesByService setServiceName(String serviceName) 
		{
			this.serviceName = serviceName;
			return this;
		}
		public Long getBytesUsed() 
		{
			return bytesUsed;
		}
		public QuotaBytesByService setBytesUsed(Long bytesUsed) 
		{
			this.bytesUsed = bytesUsed;
			return this;
		}
	}
	
	/**
	 * Inner class to wrap up information regarding Google additional roles.
	 */
	public class AdditionalRoleInfo extends ffhttp_AbstractJsonSerializable
	{
		private String type;							//The content type that this additional role info applies to.
		private AdditionalRoleInfo_RoleSet[] roleSets;	//The supported additional roles per primary role.	
		
		public String getType() 
		{
			return type;
		}
		public AdditionalRoleInfo setType(String type) 
		{
			this.type = type;
			return this;
		}
		public AdditionalRoleInfo_RoleSet[] getRoleSets() 
		{
			return roleSets;
		}
		public AdditionalRoleInfo setRoleSets(AdditionalRoleInfo_RoleSet[] roleSets) 
		{
			this.roleSets = roleSets;
			return this;
		}
	}
	
	public class AdditionalRoleInfo_RoleSet extends ffhttp_AbstractJsonSerializable
	{
		private String primaryRole;			//A primary permission role.	
		private String[] additionalRoles;	//The supported additional roles with the primary role.
		
		public String getPrimaryRole() 
		{
			return primaryRole;
		}
		public AdditionalRoleInfo_RoleSet setPrimaryRole(String primaryRole) 
		{
			this.primaryRole = primaryRole;
			return this;
		}
		public String[] getAdditionalRoles() 
		{
			return additionalRoles;
		}
		public AdditionalRoleInfo_RoleSet setAdditionalRoles(String[] additionalRoles) 
		{
			this.additionalRoles = additionalRoles;
			return this;
		}
	}
}
