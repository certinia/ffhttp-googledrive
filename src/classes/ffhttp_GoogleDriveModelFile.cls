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
 * ffhttp_GoogleDriveModelFile
 *
 * An object that represents the meta data for a file or directory in Google Drive.
 * https://developers.google.com/drive/v2/reference/files#resource
 */
public with sharing class ffhttp_GoogleDriveModelFile extends ffhttp_GoogleDriveModelAbstractObject
{
	//Instance variables
	private String id;						//The ID of the file.	
	private String etag;					//ETag of the file.	
	private String selfLink;				//A link back to this file.	
	private String title;					//The title of the file. Used to identify file or folder name.
	private String mimeType;				//The MIME type of the file. This is only mutable on update when uploading new content. 
											//This field can be left blank, and the mimetype will be determined from the uploaded 
											//content's MIME type.
	private String description;				//A short description of the file.
	private Labels labels;					//A group of labels for the file.	
	private DateTime createdDate;			//Create time for this file (formatted RFC 3339 timestamp).	
	private DateTime modifiedDate;			//Last time this file was modified by anyone (formatted RFC 3339 timestamp). 
											//This is only mutable on update when the setModifiedDate parameter is set.
	private DateTime modifiedByMeDate;		//Last time this file was modified by the user (formatted RFC 3339 timestamp). 
											//Note that setting modifiedDate will also update the modifiedByMe date for the user 
											//which set the date.	
	private String downloadUrl;				//Short lived download URL for the file. 
											//This is only populated for files with content stored in Drive.	
	private String fileExtension;			//The file extension used when downloading this file. 
											//This field is read only. 
											//To set the extension, include it in the title when creating the file. 
											//This is only populated for files with content stored in Drive.	
	private String md5Checksum;				//An MD5 checksum for the content of this file. 
											//This is populated only for files with content stored in Drive.									
	private Long fileSize;					//The size of the file in bytes. 
											//This is only populated for files with content stored in Drive.							
	private String alternateLink;			//A link for opening the file in a relevant Google editor or viewer.	
	private String embedLink;				//A link for embedding the file.	
	private DateTime sharedWithMeDate;		//Time at which this file was shared with the user (formatted RFC 3339 timestamp).	
	private String originalFilename;		//The original filename if the file was uploaded manually, or the original title if 
											//the file was inserted through the API. 
											//Note that renames of the title will not change the original filename.
											//This will only be populated on files with content stored in Drive.													
	private Long quotaBytesUsed;			//The number of quota bytes used by this file.	
	private String[] ownerNames;			//Name(s) of the owner(s) of this file.	
	private String lastModifyingUserName;	//Name of the last user to modify this file.
	private Boolean editable;				//Whether the file can be edited by the current user.
	private Boolean writersCanShare;		//Whether writers can share the document with other users.
	private String thumbnailLink;			//A link to the file's thumbnail.	
	private DateTime lastViewedByMeDate;	//Last time this file was viewed by the user (formatted RFC 3339 timestamp).
	private String webContentLink;			//A link for downloading the content of the file in a browser using 
											//cookie based authentication. In cases where the content is shared 
											//publicly, the content can be downloaded without any credentials.					
	private Boolean explicitlyTrashed;		//Whether this file has been explicitly trashed, as opposed to recursively trashed. 
											//This will only be populated if the file is trashed.	
	private String webViewLink;				//A link only available on public folders for viewing their static 
											//web assets (HTML, CSS, JS, etc) via Google Drive's Website Hosting.	
	private String iconLink;				//A link to the file's icon.	
	private Boolean shared;					//Whether the file has been shared.	
	private Boolean appDataContents;		//Whether this file is in the Application Data folder.
	private String defaultOpenWithLink;		//A link to open this file with the user's default app for this file. 
											//Only populated when the drive.apps.readonly scope is used.								
	private String headRevisionId;			//The ID of the file's head revision. 
											//This will only be populated for files with content stored in Drive.	
	private Boolean copyable;				//Whether the file can be copied by the current user.	
	private DateTime markedViewedByMeDate;	//Time this file was explicitly marked viewed by the user (formatted RFC 3339 timestamp).
	private Long version;					//A monotonically increasing version number for the file. 
											//This reflects every change made to the file on the server, 
											//even those not visible to the requesting user.	
	
	private Map<String, String> exportLinks;	//Links for exporting Google Docs to specific formats.	
	private Map<String, String> openWithLinks;	//A map of the id of each of the user's apps to a link to open this file with that app. 
												//Only populated when the drive.apps.readonly scope is used.
	
	private ffhttp_GoogleDriveModelUser[] owners;				//The owner(s) of this file.
	private ffhttp_GoogleDriveModelUser lastModifyingUser;		//The last user to modify this file.	
	private ffhttp_GoogleDriveModelUser sharingUser;			//User that shared the item with the current user, if available.
	private ffhttp_GoogleDriveModelPermission userPermission;	//The permissions for the authenticated user on this file.
	private ffhttp_GoogleDriveModelPermission[] permissions;	//The list of permissions for users with access to this file.	
	private ffhttp_GoogleDriveModelProperty[] properties;		//The list of properties.
	private ffhttp_GoogleDriveModelParent[] parents;			//Collection of parent folders which contain this file.
																//Setting this field will put the file in all of the provided folders.
																//On insert, if no folders are provided, 
																//the file will be placed in the default root folder.
	private Thumbnail thumbnail;								//Thumbnail for the file. Only accepted on upload and for files 
																//that are not already thumbnailed by Google.															
	private IndexableText indexableText;						//Indexable text attributes for the file. 
																//This property can only be written, and is not 
																//returned by files.get. For more information, 
																//see Saving indexable text.	
	private ImageMediaMetadata imageMediaMetadata;				//Metadata about image media. 
																//This will only be present for image types, 
																//and its contents will depend on what can be 
																//parsed from the image content.				
	private VideoMediaMetadata videoMediaMetadata;				//Metadata about video media. 
																//This will only be present for video types.
	
	/**
	 * Constructor
	 */
	public ffhttp_GoogleDriveModelFile()
	{
		super(KIND_DRIVE_FILE);
	}
	
	/**
	 * Get/Sets
	 */
	public String getId() 
	{
		return id;
	}
	public ffhttp_GoogleDriveModelFile setId(String id) 
	{
		this.id = id;
		return this;
	}
	public String getEtag() 
	{
		return etag;
	}
	public ffhttp_GoogleDriveModelFile setEtag(String etag) 
	{
		this.etag = etag;
		return this;
	}
	public String getSelfLink() 
	{
		return selfLink;
	}
	public ffhttp_GoogleDriveModelFile setSelfLink(String selfLink) 
	{
		this.selfLink = selfLink;
		return this;
	}
	public String getTitle() 
	{
		return title;
	}
	public ffhttp_GoogleDriveModelFile setTitle(String title) 
	{
		this.title = title;
		return this;
	}
	public String getMimeType() 
	{
		return mimeType;
	}
	public ffhttp_GoogleDriveModelFile setMimeType(String mimeType) 
	{
		this.mimeType = mimeType;
		return this;
	}
	public String getDescription() 
	{
		return description;
	}
	public ffhttp_GoogleDriveModelFile setDescription(String description)
	{
		this.description = description;
		return this;
	}
	public Labels getLabels()
	{
		return labels;
	}
	public ffhttp_GoogleDriveModelFile setLabels(Labels labels)
	{
		this.labels = labels;
		return this;
	}
	public DateTime getCreatedDate()
	{
		return createdDate;
	}
	public ffhttp_GoogleDriveModelFile setCreatedDate(DateTime createdDate)
	{
		this.createdDate = createdDate;
		return this;
	}
	public DateTime getModifiedDate()
	{
		return modifiedDate;
	}
	public ffhttp_GoogleDriveModelFile setModifiedDate(DateTime modifiedDate)
	{
		this.modifiedDate = modifiedDate;
		return this;
	}
	public DateTime getModifiedByMeDate()
	{
		return modifiedByMeDate;
	}
	public ffhttp_GoogleDriveModelFile setModifiedByMeDate(DateTime modifiedByMeDate)
	{
		this.modifiedByMeDate = modifiedByMeDate;
		return this;
	}
	public String getDownloadUrl()
	{
		return downloadUrl;
	}
	public ffhttp_GoogleDriveModelFile setDownloadUrl(String downloadUrl)
	{
		this.downloadUrl = downloadUrl;
		return this;
	}
	public String getFileExtension()
	{
		return fileExtension;
	}
	public ffhttp_GoogleDriveModelFile setFileExtension(String fileExtension)
	{
		this.fileExtension = fileExtension;
		return this;
	}
	public String getMd5Checksum()
	{
		return md5Checksum;
	}
	public ffhttp_GoogleDriveModelFile setMd5Checksum(String md5Checksum)
	{
		this.md5Checksum = md5Checksum;
		return this;
	}
	public Long getFileSize()
	{
		return fileSize;
	}
	public ffhttp_GoogleDriveModelFile setFileSize(Long fileSize)
	{
		this.fileSize = fileSize;
		return this;
	}
	public String getAlternateLink()
	{
		return alternateLink;
	}
	public ffhttp_GoogleDriveModelFile setAlternateLink(String alternateLink)
	{
		this.alternateLink = alternateLink;
		return this;
	}
	public String getEmbedLink()
	{
		return embedLink;
	}
	public ffhttp_GoogleDriveModelFile setEmbedLink(String embedLink)
	{
		this.embedLink = embedLink;
		return this;
	}
	public DateTime getSharedWithMeDate()
	{
		return sharedWithMeDate;
	}
	public ffhttp_GoogleDriveModelFile setSharedWithMeDate(DateTime sharedWithMeDate)
	{
		this.sharedWithMeDate = sharedWithMeDate;
		return this;
	}
	public String getOriginalFilename()
	{
		return originalFilename;
	}
	public ffhttp_GoogleDriveModelFile setOriginalFilename(String originalFilename)
	{
		this.originalFilename = originalFilename;
		return this;
	}
	public Long getQuotaBytesUsed()
	{
		return quotaBytesUsed;
	}
	public ffhttp_GoogleDriveModelFile setQuotaBytesUsed(Long quotaBytesUsed)
	{
		this.quotaBytesUsed = quotaBytesUsed;
		return this;
	}
	public String[] getOwnerNames()
	{
		return ownerNames;
	}
	public ffhttp_GoogleDriveModelFile setOwnerNames(String[] ownerNames)
	{
		this.ownerNames = ownerNames;
		return this;
	}
	public String getLastModifyingUserName()
	{
		return lastModifyingUserName;
	}
	public ffhttp_GoogleDriveModelFile setLastModifyingUserName(String lastModifyingUserName)
	{
		this.lastModifyingUserName = lastModifyingUserName;
		return this;
	}
	public Boolean getEditable()
	{
		return editable;
	}
	public ffhttp_GoogleDriveModelFile setEditable(Boolean editable)
	{
		this.editable = editable;
		return this;
	}
	public Boolean getWritersCanShare()
	{
		return writersCanShare;
	}
	public ffhttp_GoogleDriveModelFile setWritersCanShare(Boolean writersCanShare)
	{
		this.writersCanShare = writersCanShare;
		return this;
	}
	public String getThumbnailLink()
	{
		return thumbnailLink;
	}
	public ffhttp_GoogleDriveModelFile setThumbnailLink(String thumbnailLink)
	{
		this.thumbnailLink = thumbnailLink;
		return this;
	}
	public DateTime getLastViewedByMeDate()
	{
		return lastViewedByMeDate;
	}
	public ffhttp_GoogleDriveModelFile setLastViewedByMeDate(DateTime lastViewedByMeDate)
	{
		this.lastViewedByMeDate = lastViewedByMeDate;
		return this;
	}
	public String getWebContentLink()
	{
		return webContentLink;
	}
	public ffhttp_GoogleDriveModelFile setWebContentLink(String webContentLink)
	{
		this.webContentLink = webContentLink;
		return this;
	}
	public Boolean getExplicitlyTrashed()
	{
		return explicitlyTrashed;
	}
	public ffhttp_GoogleDriveModelFile setExplicitlyTrashed(Boolean explicitlyTrashed)
	{
		this.explicitlyTrashed = explicitlyTrashed;
		return this;
	}
	public String getWebViewLink()
	{
		return webViewLink;
	}
	public ffhttp_GoogleDriveModelFile setWebViewLink(String webViewLink)
	{
		this.webViewLink = webViewLink;
		return this;
	}
	public String getIconLink()
	{
		return iconLink;
	}
	public ffhttp_GoogleDriveModelFile setIconLink(String iconLink)
	{
		this.iconLink = iconLink;
		return this;
	}
	public Boolean getShared()
	{
		return shared;
	}
	public ffhttp_GoogleDriveModelFile setShared(Boolean shared)
	{
		this.shared = shared;
		return this;
	}
	public Boolean getAppDataContents()
	{
		return appDataContents;
	}
	public ffhttp_GoogleDriveModelFile setAppDataContents(Boolean appDataContents)
	{
		this.appDataContents = appDataContents;
		return this;
	}
	public String getDefaultOpenWithLink()
	{
		return defaultOpenWithLink;
	}
	public ffhttp_GoogleDriveModelFile setDefaultOpenWithLink(String defaultOpenWithLink)
	{
		this.defaultOpenWithLink = defaultOpenWithLink;
		return this;
	}
	public String getHeadRevisionId()
	{
		return headRevisionId;
	}
	public ffhttp_GoogleDriveModelFile setHeadRevisionId(String headRevisionId)
	{
		this.headRevisionId = headRevisionId;
		return this;
	}
	public Boolean getCopyable()
	{
		return copyable;
	}
	public ffhttp_GoogleDriveModelFile setCopyable(Boolean copyable)
	{
		this.copyable = copyable;
		return this;
	}
	public DateTime getMarkedViewedByMeDate()
	{
		return markedViewedByMeDate;
	}
	public ffhttp_GoogleDriveModelFile setMarkedViewedByMeDate(DateTime markedViewedByMeDate)
	{
		this.markedViewedByMeDate = markedViewedByMeDate;
		return this;
	}
	public Long getVersion()
	{
		return version;
	}
	public ffhttp_GoogleDriveModelFile setVersion(Long version)
	{
		this.version = version;
		return this;
	}
	public Map<String, String> getExportLinks()
	{
		return exportLinks;
	}
	public ffhttp_GoogleDriveModelFile setExportLinks(Map<String, String> exportLinks)
	{
		this.exportLinks = exportLinks;
		return this;
	}
	public Map<String, String> getOpenWithLinks()
	{
		return openWithLinks;
	}
	public ffhttp_GoogleDriveModelFile setOpenWithLinks(Map<String, String> openWithLinks)
	{
		this.openWithLinks = openWithLinks;
		return this;
	}
	public ffhttp_GoogleDriveModelUser[] getOwners()
	{
		return owners;
	}
	public ffhttp_GoogleDriveModelFile setOwners(ffhttp_GoogleDriveModelUser[] owners)
	{
		this.owners = owners;
		return this;
	}
	public ffhttp_GoogleDriveModelUser getLastModifyingUser()
	{
		return lastModifyingUser;
	}
	public ffhttp_GoogleDriveModelFile setLastModifyingUser(ffhttp_GoogleDriveModelUser lastModifyingUser)
	{
		this.lastModifyingUser = lastModifyingUser;
		return this;
	}
	public ffhttp_GoogleDriveModelUser getSharingUser()
	{
		return sharingUser;
	}
	public ffhttp_GoogleDriveModelFile setSharingUser(ffhttp_GoogleDriveModelUser sharingUser)
	{
		this.sharingUser = sharingUser;
		return this;
	}
	public ffhttp_GoogleDriveModelPermission getUserPermission()
	{
		return userPermission;
	}
	public ffhttp_GoogleDriveModelFile setUserPermission(ffhttp_GoogleDriveModelPermission userPermission)
	{
		this.userPermission = userPermission;
		return this;
	}
	public ffhttp_GoogleDriveModelPermission[] getPermissions()
	{
		return permissions;
	}
	public ffhttp_GoogleDriveModelFile setPermissions(ffhttp_GoogleDriveModelPermission[] permissions)
	{
		this.permissions = permissions;
		return this;
	}
	public ffhttp_GoogleDriveModelProperty[] getProperties()
	{
		return properties;
	}
	public ffhttp_GoogleDriveModelFile setProperties(ffhttp_GoogleDriveModelProperty[] properties)
	{
		this.properties = properties;
		return this;
	}
	public ffhttp_GoogleDriveModelParent[] getParents()
	{
		return parents;
	}
	public ffhttp_GoogleDriveModelFile setParents(ffhttp_GoogleDriveModelParent[] parents)
	{
		this.parents = parents;
		return this;
	}
	public Thumbnail getThumbnail()
	{
		return thumbnail;
	}
	public ffhttp_GoogleDriveModelFile setThumbnail(Thumbnail thumbnail)
	{
		this.thumbnail = thumbnail;
		return this;
	}
	public IndexableText getIndexableText()
	{
		return indexableText;
	}
	public ffhttp_GoogleDriveModelFile setIndexableText(IndexableText indexableText)
	{
		this.indexableText = indexableText;
		return this;
	}
	public ImageMediaMetadata getImageMediaMetadata()
	{
		return imageMediaMetadata;
	}
	public ffhttp_GoogleDriveModelFile setImageMediaMetadata(ImageMediaMetadata imageMediaMetadata)
	{
		this.imageMediaMetadata = imageMediaMetadata;
		return this;
	}
	public VideoMediaMetadata getVideoMediaMetadata()
	{
		return videoMediaMetadata;
	}
	public ffhttp_GoogleDriveModelFile setVideoMediaMetadata(VideoMediaMetadata videoMediaMetadata)
	{
		this.videoMediaMetadata = videoMediaMetadata;
		return this;
	}
	
	/**
	 * Inner classes
	 */
	public class Labels extends ffhttp_AbstractJsonSerializable
	{
		private Boolean starred;		//Whether this file is starred by the user.
		private Boolean trashed;		//Whether this file has been trashed.
		private Boolean restricted;		//Whether viewers are prevented from downloading this file.
		private Boolean viewed;			//Whether this file has been viewed by this user.	
		
		public Boolean getStarred()
		{
			return starred;
		}
		public Labels setStarred(Boolean starred)
		{
			this.starred = starred;
			return this;
		}
		public Boolean getTrashed()
		{
			return trashed;
		}
		public Labels setTrashed(Boolean trashed)
		{
			this.trashed = trashed;
			return this;
		}
		public Boolean getRestricted()
		{
			return restricted;
		}
		public Labels setRestricted(Boolean restricted)
		{
			this.restricted = restricted;
			return this;
		}
		public Boolean getViewed()
		{
			return viewed;
		}
		public Labels setViewed(Boolean viewed)
		{
			this.viewed = viewed;
			return this;
		}
	}

	public class ImageMediaMetadata extends ffhttp_AbstractJsonSerializable
	{
		private Integer width;				//The width of the image in pixels.	
		private Integer height;				//The height of the image in pixels.	
		private Integer rotation;			//The rotation in clockwise degrees from the image's original orientation.	
		private String dateTaken;			//The date and time the photo was taken (EXIF format timestamp).	
		private String cameraMake;			//The make of the camera used to create the photo.	
		private String cameraModel;			//The model of the camera used to create the photo.	
		private Double exposureTime;		//The length of the exposure, in seconds.	
		private Double aperture;			//The aperture used to create the photo (f-number).	
		private Boolean flashUsed;			//Whether a flash was used to create the photo.	
		private Double focalLength;			//The focal length used to create the photo, in millimeters.	
		private Integer isoSpeed;			//The ISO speed used to create the photo.	
		private String meteringMode; 		//The metering mode used to create the photo.	
		private String sensor;				//The type of sensor used to create the photo.	
		private String exposureMode;		//The exposure mode used to create the photo.	
		private String colorSpace;			//The color space of the photo.	
		private String whiteBalance;		//The white balance mode used to create the photo.	
		private Double exposureBias;		//The exposure bias of the photo (APEX value).	
		private Double maxApertureValue;	//The smallest f-number of the lens at the focal length used to create the photo (APEX value).	
		private Integer subjectDistance;	//The distance to the subject of the photo, in meters.	
		private String lens;				//The lens used to create the photo.
		
		private ImageMediaMetadata_Location location;	//Geographic location information stored in the image.
		
		/**
		 * Get/Sets
		 */
		public Integer getWidth()
		{
			return width;
		}
		public ImageMediaMetadata setWidth(Integer width)
		{
			this.width = width;
			return this;
		}
		public Integer getHeight()
		{
			return height;
		}
		public ImageMediaMetadata setHeight(Integer height)
		{
			this.height = height;
			return this;
		}
		public Integer getRotation()
		{
			return rotation;
		}
		public ImageMediaMetadata setRotation(Integer rotation)
		{
			this.rotation = rotation;
			return this;
		}
		public String getDateTaken()
		{
			return dateTaken;
		}
		public ImageMediaMetadata setDateTaken(String dateTaken)
		{
			this.dateTaken = dateTaken;
			return this;
		}
		public String getCameraMake()
		{
			return cameraMake;
		}
		public ImageMediaMetadata setCameraMake(String cameraMake)
		{
			this.cameraMake = cameraMake;
			return this;
		}
		public String getCameraModel()
		{
			return cameraModel;
		}
		public ImageMediaMetadata setCameraModel(String cameraModel)
		{
			this.cameraModel = cameraModel;
			return this;
		}
		public Double getExposureTime()
		{
			return exposureTime;
		}
		public ImageMediaMetadata setExposureTime(Double exposureTime)
		{
			this.exposureTime = exposureTime;
			return this;
		}
		public Double getAperture()
		{
			return aperture;
		}
		public ImageMediaMetadata setAperture(Double aperture)
		{
			this.aperture = aperture;
			return this;
		}
		public Boolean getFlashUsed()
		{
			return flashUsed;
		}
		public ImageMediaMetadata setFlashUsed(Boolean flashUsed)
		{
			this.flashUsed = flashUsed;
			return this;
		}
		public Double getFocalLength()
		{
			return focalLength;
		}
		public ImageMediaMetadata setFocalLength(Double focalLength)
		{
			this.focalLength = focalLength;
			return this;
		}
		public Integer getIsoSpeed()
		{
			return isoSpeed;
		}
		public ImageMediaMetadata setIsoSpeed(Integer isoSpeed)
		{
			this.isoSpeed = isoSpeed;
			return this;
		}
		public String getMeteringMode()
		{
			return meteringMode;
		}
		public ImageMediaMetadata setMeteringMode(String meteringMode)
		{
			this.meteringMode = meteringMode;
			return this;
		}
		public String getSensor()
		{
			return sensor;
		}
		public ImageMediaMetadata setSensor(String sensor)
		{
			this.sensor = sensor;
			return this;
		}
		public String getExposureMode()
		{
			return exposureMode;
		}
		public ImageMediaMetadata setExposureMode(String exposureMode)
		{
			this.exposureMode = exposureMode;
			return this;
		}
		public String getColorSpace()
		{
			return colorSpace;
		}
		public ImageMediaMetadata setColorSpace(String colorSpace)
		{
			this.colorSpace = colorSpace;
			return this;
		}
		public String getWhiteBalance()
		{
			return whiteBalance;
		}
		public ImageMediaMetadata setWhiteBalance(String whiteBalance)
		{
			this.whiteBalance = whiteBalance;
			return this;
		}
		public Double getExposureBias()
		{
			return exposureBias;
		}
		public ImageMediaMetadata setExposureBias(Double exposureBias)
		{
			this.exposureBias = exposureBias;
			return this;
		}
		public Double getMaxApertureValue()
		{
			return maxApertureValue;
		}
		public ImageMediaMetadata setMaxApertureValue(Double maxApertureValue)
		{
			this.maxApertureValue = maxApertureValue;
			return this;
		}
		public Integer getSubjectDistance()
		{
			return subjectDistance;
		}
		public ImageMediaMetadata setSubjectDistance(Integer subjectDistance)
		{
			this.subjectDistance = subjectDistance;
			return this;
		}
		public String getLens()
		{
			return lens;
		}
		public ImageMediaMetadata setLens(String lens)
		{
			this.lens = lens;
			return this;
		}
		public ImageMediaMetadata_Location getLocation()
		{
			return location;
		}
		public ImageMediaMetadata setLocation(ImageMediaMetadata_Location location)
		{
			this.location = location;
			return this;
		}
	}
	
	public class ImageMediaMetadata_Location extends ffhttp_AbstractJsonSerializable
	{
		private Double latitude;		//The latitude stored in the image.	
		private Double longitude;		//The longitude stored in the image.	
		private Double altitude;		//The altitude stored in the image.	
		
		public Double getLatitude()
		{
			return latitude;
		}
		public ImageMediaMetadata_Location setLatitude(Double latitude)
		{
			this.latitude = latitude;
			return this;
		}
		public Double getLongitude()
		{
			return longitude;
		}
		public ImageMediaMetadata_Location setLongitude(Double longitude)
		{
			this.longitude = longitude;
			return this;
		}
		public Double getAltitude()
		{
			return altitude;
		}
		public ImageMediaMetadata_Location setAltitude(Double altitude)
		{
			this.altitude = altitude;
			return this;
		}
	}
	
	public class VideoMediaMetadata extends ffhttp_AbstractJsonSerializable
	{
		private Integer width;			//The width of the video in pixels.	
		private Integer height;			//The height of the video in pixels.	
		private Long durationMillis;	//The duration of the video in milliseconds.	
		
		public Integer getWidth()
		{
			return width;
		}
		public VideoMediaMetadata setWidth(Integer width)
		{
			this.width = width;
			return this;
		}
		public Integer getHeight()
		{
			return height;
		}
		public VideoMediaMetadata setHeight(Integer height)
		{
			this.height = height;
			return this;
		}
		public Long getDurationMillis()
		{
			return durationMillis;
		}
		public VideoMediaMetadata setDurationMillis(Long durationMillis)
		{
			this.durationMillis = durationMillis;
			return this;
		}
	}
	
	public class Thumbnail extends ffhttp_AbstractJsonSerializable
	{
		private String image;			//The URL-safe Base64 encoded bytes of the thumbnail image.	
		private String mimeType;		//The MIME type of the thumbnail.
		
		public String getImage()
		{
			return image;
		}
		public Thumbnail setImage(String image)
		{
			this.image = image;
			return this;
		}
		public String getMimeType()
		{
			return mimeType;
		}
		public Thumbnail setMimeType(String mimeType)
		{
			this.mimeType = mimeType;
			return this;
		}	
	}
	
	public class IndexableText extends ffhttp_AbstractJsonSerializable
	{
		private String text; 			//The text to be indexed for this file.
		
		public String getText()
		{
			return text;
		}
		public IndexableText setText(String text)
		{
			this.text = text;
			return this;
		}
	}
	
	/**
	 * Object to represent a list of Google Drive files.
	 */
	public with sharing class ItemList extends ffhttp_GoogleDriveModelAbstractObject.AbstractList
	{
		List<ffhttp_GoogleDriveModelFile> items;
			
		/**
		 * Constructor
		 */
		public ItemList()
		{
			super(KIND_DRIVE_FILE_LIST);
		}
		
		public override List<ffhttp_GoogleDriveModelAbstractObject> getItems()
		{
			return (List<ffhttp_GoogleDriveModelFile>)this.items;
		}
	}
}
