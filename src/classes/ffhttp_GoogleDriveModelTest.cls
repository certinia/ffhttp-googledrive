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
 * ffhttp_GoogleDriveModelTest
 *
 * Test class for the GoogleDriveModel classes
 */
@isTest
private class ffhttp_GoogleDriveModelTest 
{
	static testMethod void ffhttp_GoogleDriveModelAbout()
	{
		//Create all the required sub-classes
		ffhttp_GoogleDriveModelUser user = createUser();
		
		ffhttp_GoogleDriveModelAbout.AdditionalRoleInfo_RoleSet roleSet = new ffhttp_GoogleDriveModelAbout.AdditionalRoleInfo_RoleSet();
		roleSet.setPrimaryRole('reader').setAdditionalRoles(new String[]{'commenter'});
		
		ffhttp_GoogleDriveModelAbout.AdditionalRoleInfo roleInfo = new ffhttp_GoogleDriveModelAbout.AdditionalRoleInfo();
		roleInfo.setType('application/vnd.google-apps.drawing')
			    .setRoleSets(new ffhttp_GoogleDriveModelAbout.AdditionalRoleInfo_RoleSet[]{roleSet});
		
		ffhttp_GoogleDriveModelAbout.Formats format = new ffhttp_GoogleDriveModelAbout.Formats();
		format.setSource('application/vnd.openxmlformats-officedocument.wordprocessingml.document')
			  .setTargets(new String[]{'application/vnd.google-apps.document'});
		
		ffhttp_GoogleDriveModelAbout.Feature feature = new ffhttp_GoogleDriveModelAbout.Feature();
		feature.setFeatureName('translation').setFeatureRate(2);
		
		ffhttp_GoogleDriveModelAbout.MaxUploadSize maxUploadSize = new ffhttp_GoogleDriveModelAbout.MaxUploadSize();
		maxUploadSize.setType('application/vnd.google-apps.document').setSize(10485760);
		
		ffhttp_GoogleDriveModelAbout.QuotaBytesByService quotaBytesByService = new ffhttp_GoogleDriveModelAbout.QuotaBytesByService();
		quotaBytesByService.setServiceName('DRIVE').setBytesUsed(70729294);
		
		//Create the about class. Chain the set calls so that we can check that we correctly return the about object.
		ffhttp_GoogleDriveModelAbout about = new ffhttp_GoogleDriveModelAbout();
		about.setEtag('"zyC8bkiH7Ao6tgclLWg5GHEYlAM/1m3rn2_HidxfB7hlHBSp-U1ARVI"')
			 .setSelfLink('https://www.googleapis.com/drive/v2/about')
			 .setName('Matthew Wood')
			 .setUser(user)
			 .setQuotaBytesTotal(32212254720L)
			 .setQuotaBytesUsed(70843597)
			 .setQuotaBytesUsedAggregate(70843597)
			 .setQuotaBytesUsedInTrash(0)
			 .setQuotaType(ffhttp_GoogleDriveModelAbout.QUOTA_TYPE_LIMITED)
			 .setQuotaBytesByService(new List<ffhttp_GoogleDriveModelAbout.QuotaBytesByService>{quotaBytesByService})
			 .setMaxUploadSizes(new List<ffhttp_GoogleDriveModelAbout.MaxUploadSize>{maxUploadSize})
			 .setFeatures(new List<ffhttp_GoogleDriveModelAbout.Feature>{feature})
			 .setLargestChangeId(6989)
			 .setRemainingChangeIds(578456)
			 .setRootFolderId('0AN43_02Tka2HUk9PVB')
			 .setInputFormats(new List<ffhttp_GoogleDriveModelAbout.Formats>{format})
			 .setExportFormats(new List<ffhttp_GoogleDriveModelAbout.Formats>{format})
			 .setAdditionalRoleInfo(new List<ffhttp_GoogleDriveModelAbout.AdditionalRoleInfo>{roleInfo})
			 .setDomainSharingPolicy('allowedWithWarning')
			 .setPermissionId('13098600474491268344')
			 .setIsCurrentAppInstalled(false)
			 .setLanguageCode('en-GB');
		
		//Assert that we get the appropriate return values.
		System.assertEquals(about.getKind(), 'drive#about');
		System.assertEquals(about.getEtag(), '"zyC8bkiH7Ao6tgclLWg5GHEYlAM/1m3rn2_HidxfB7hlHBSp-U1ARVI"');
		System.assertEquals(about.getSelfLink(), 'https://www.googleapis.com/drive/v2/about');
		System.assertEquals(about.getName(), 'Matthew Wood');
		System.assertEquals(about.getQuotaBytesTotal(), 32212254720L);	
		System.assertEquals(about.getQuotaBytesUsed(), 70843597);
		System.assertEquals(about.getQuotaBytesUsedAggregate(), 70843597);
		System.assertEquals(about.getQuotaBytesUsedInTrash(), 0);
		System.assertEquals(about.getQuotaType(), 'LIMITED');
		System.assertEquals(about.getQuotaBytesByService()[0].getServiceName(), 'DRIVE');
		System.assertEquals(about.getQuotaBytesByService()[0].getBytesUsed(), 70729294);
		System.assertEquals(about.getMaxUploadSizes()[0].getType(), 'application/vnd.google-apps.document');
		System.assertEquals(about.getMaxUploadSizes()[0].getSize(), 10485760);
		System.assertEquals(about.getFeatures()[0].getFeatureName(), 'translation');
		System.assertEquals(about.getFeatures()[0].getFeatureRate(), 2);
		System.assertEquals(about.getLargestChangeId(), 6989);
		System.assertEquals(about.getRemainingChangeIds(), 578456);
		System.assertEquals(about.getRootFolderId(), '0AN43_02Tka2HUk9PVB');
		System.assertEquals(about.getInputFormats()[0].getSource(), 'application/vnd.openxmlformats-officedocument.wordprocessingml.document');
		System.assertEquals(about.getInputFormats()[0].getTargets()[0], 'application/vnd.google-apps.document');
		System.assertEquals(about.getExportFormats()[0].getSource(), 'application/vnd.openxmlformats-officedocument.wordprocessingml.document');
		System.assertEquals(about.getExportFormats()[0].getTargets()[0], 'application/vnd.google-apps.document');
		System.assertEquals(about.getAdditionalRoleInfo()[0].getType(), 'application/vnd.google-apps.drawing');
		System.assertEquals(about.getAdditionalRoleInfo()[0].getRoleSets()[0].getPrimaryRole(), 'reader');
		System.assertEquals(about.getAdditionalRoleInfo()[0].getRoleSets()[0].getAdditionalRoles()[0], 'commenter');
		System.assertEquals(about.getDomainSharingPolicy(), 'allowedWithWarning');
		System.assertEquals(about.getPermissionId(), '13098600474491268344');
		System.assertEquals(about.getIsCurrentAppInstalled(), false);
		System.assertEquals(about.getLanguageCode(), 'en-GB');
		
		assertUser(about.getUser());
	}
	
	static testMethod void ffhttp_GoogleDriveModelApiChannel()
	{
		ffhttp_GoogleDriveModelApiChannel apiChannel = new ffhttp_GoogleDriveModelApiChannel();
		apiChannel.setId('0AN43_02Tka2HUk9PVB')
				  .setResourceId('0AN43_02Tka2HUk9PCD')
				  .setResourceUri('Resource Uri')
				  .setToken('Test Token')
				  .setExpiration(7531897698L);
		
		System.assertEquals(apiChannel.getKind(), 'api#channel');
		System.assertEquals(apiChannel.getId(), '0AN43_02Tka2HUk9PVB');
		System.assertEquals(apiChannel.getResourceId(), '0AN43_02Tka2HUk9PCD');		
		System.assertEquals(apiChannel.getResourceUri(), 'Resource Uri');
		System.assertEquals(apiChannel.getToken(), 'Test Token');
		System.assertEquals(apiChannel.getExpiration(), 7531897698L);
	}
	
	static testMethod void ffhttp_GoogleDriveModelApp()
	{
		//Create all the required sub-classes
		ffhttp_GoogleDriveModelApp.Icon icon = new ffhttp_GoogleDriveModelApp.Icon();
		icon.setCategory(ffhttp_GoogleDriveModelApp.APP_ICON_CATEGORY_APPLICATION)
			.setSize(128)
			.setIconUrl('https://lh5.googleusercontent.com/-u9Rz7gYnVcs/UNSsZ-O9sGI/AAAAAAAAAwk/ZQXrgfA3l2w/s128-c-k/icon_11_drawing_xl128.png');
		
		//Create the app class. Chain the set calls so that we can check that we correctly return the app object.
		ffhttp_GoogleDriveModelApp app = new ffhttp_GoogleDriveModelApp();
		app.setId('952342923413')
		   .setName('Google Drawings')
		   .setObjectType('Drawing')
		   .setSupportsCreate(true)
		   .setSupportsImport(false)
		   .setSupportsMultiOpen(false)
		   .setSupportsOfflineCreate(true)
		   .setInstalled(true)
		   .setAuthorized(false)
		   .setUseByDefault(true)
		   .setProductUrl('https://chrome.google.com/webstore/detail/mkaakpdehdafacodkgkpghoibnmamcme')
		   .setHasDriveWideScope(false)
		   .setUseByDefault(true)
		   .setProductId('mkaakpdehdafacodkgkpghoibnmamcme')
		   .setOpenUrlTemplate('https://docs.google.com/a/financialforce.com/drawings/d/{ids}/edit?usp=drive_web')
		   .setCreateUrl('https://docs.google.com/a/financialforce.com/drawings/create?usp=drive_web')
		   .setCreateInFolderTemplate('https://docs.google.com/a/financialforce.com/drawings/create?usp=drive_web&folder={folderId}')
		   .setIcons(new List<ffhttp_GoogleDriveModelApp.Icon>{icon})
		   .setShortDescription('Drawing application')
		   .setLongDescription('Default Google drawing application')
		   .setPrimaryMimeTypes(new List<String>{'application/vnd.google-apps.drawing'})
		   .setSecondaryMimeTypes(new List<String>{'application/vnd.msword'})
		   .setPrimaryFileExtensions(new List<String>{'docx'})
		   .setSecondaryFileExtensions(new List<String>{'doc'});

		//Assert that we get the appropriate return values.
		System.assertEquals(app.getKind(), 'drive#app');
		System.assertEquals(app.getId(), '952342923413');
		System.assertEquals(app.getName(), 'Google Drawings');
		System.assertEquals(app.getObjectType(), 'Drawing');
		System.assertEquals(app.getSupportsCreate(), true);
		System.assertEquals(app.getSupportsImport(), false);
		System.assertEquals(app.getSupportsMultiOpen(), false);
		System.assertEquals(app.getSupportsOfflineCreate(), true);
		System.assertEquals(app.getInstalled(), true);
		System.assertEquals(app.getAuthorized(), false);
		System.assertEquals(app.getUseByDefault(), true);
		System.assertEquals(app.getProductUrl(), 'https://chrome.google.com/webstore/detail/mkaakpdehdafacodkgkpghoibnmamcme');
		System.assertEquals(app.getHasDriveWideScope(), false);
		System.assertEquals(app.getUseByDefault(), true);
		System.assertEquals(app.getProductId(), 'mkaakpdehdafacodkgkpghoibnmamcme');
		System.assertEquals(app.getOpenUrlTemplate(), 'https://docs.google.com/a/financialforce.com/drawings/d/{ids}/edit?usp=drive_web');
		System.assertEquals(app.getCreateUrl(), 'https://docs.google.com/a/financialforce.com/drawings/create?usp=drive_web');
		System.assertEquals(app.getCreateInFolderTemplate(), 'https://docs.google.com/a/financialforce.com/drawings/create?usp=drive_web&folder={folderId}');
		System.assertEquals(app.getIcons()[0].getCategory(), 'application');
		System.assertEquals(app.getIcons()[0].getSize(), 128);
		System.assertEquals(app.getIcons()[0].getIconUrl(), 'https://lh5.googleusercontent.com/-u9Rz7gYnVcs/UNSsZ-O9sGI/AAAAAAAAAwk/ZQXrgfA3l2w/s128-c-k/icon_11_drawing_xl128.png');
		System.assertEquals(app.getShortDescription(), 'Drawing application');
		System.assertEquals(app.getLongDescription(), 'Default Google drawing application');
		System.assertEquals(app.getPrimaryMimeTypes()[0], 'application/vnd.google-apps.drawing');
		System.assertEquals(app.getSecondaryMimeTypes()[0], 'application/vnd.msword');
		System.assertEquals(app.getPrimaryFileExtensions()[0], 'docx');
		System.assertEquals(app.getSecondaryFileExtensions()[0], 'doc');
	}
	
	static testMethod void ffhttp_GoogleDriveModelAppItemList()
	{
		ffhttp_GoogleDriveModelApp.ItemList appList = new ffhttp_GoogleDriveModelApp.ItemList();
		applist.setEtag('TestEtag')
			   .setSelfLink('TestSelfLink')
			   .setNextPageToken('TestPageToken')
			   .setNextLink('TestNextLink');
		
	 	System.assertEquals(appList.getKind(), 'drive#appList');
	 	System.assertEquals(appList.getItems(), null);
	 	System.assertEquals(appList.getEtag(), 'TestEtag');
	 	System.assertEquals(appList.getSelfLink(), 'TestSelfLink');
	 	System.assertEquals(appList.getNextPageToken(), 'TestPageToken');
	 	System.assertEquals(appList.getNextLink(), 'TestNextLink');
	}
	
	static testMethod void ffhttp_GoogleDriveModelChange()
	{
		//Create the change class. Chain the set calls so that we can check that we correctly return the change object.
		ffhttp_GoogleDriveModelChange change = new ffhttp_GoogleDriveModelChange();
		change.setId(685)
			  .setFileId('0B943_02Tka2HV0xGalhIZkQ0M0E')
			  .setSelfLink('https://www.googleapis.com/drive/v2/changes/685')
			  .setDeleted(true)
			  .setModificationDate(DateTime.newInstance(2014, 09, 22))
			  .setFile(null);
			  
		//Assert that we get the appropriate return values.
		System.assertEquals(change.getKind(), 'drive#change');
		System.assertEquals(change.getId(), 685);
		System.assertEquals(change.getFileId(), '0B943_02Tka2HV0xGalhIZkQ0M0E');
		System.assertEquals(change.getSelfLink(), 'https://www.googleapis.com/drive/v2/changes/685');
		System.assertEquals(change.getDeleted(), true);
		System.assertEquals(change.getModificationDate(), DateTime.newInstance(2014, 09, 22));
		System.assertEquals(change.getFile(), null);
	}
	
	static testMethod void ffhttp_GoogleDriveModelChangeItemList()
	{
		ffhttp_GoogleDriveModelChange.ItemList appList = new ffhttp_GoogleDriveModelChange.ItemList();
	 	System.assertEquals(appList.getKind(), 'drive#changeList');
	 	System.assertEquals(appList.getItems(), null);
	}
	
	static testMethod void ffhttp_GoogleDriveModelChild()
	{
		//Create the child class. Chain the set calls so that we can check that we correctly return the child object.
		ffhttp_GoogleDriveModelChild child = new ffhttp_GoogleDriveModelChild();
		child.setId('0B943_02Tka2HSk9zRDBYdHdCWms')
			 .setSelfLink('https://www.googleapis.com/drive/v2/files/0B943_02Tka2HbWRNNXl6dy1sNFk/children/0B943_02Tka2HSk9zRDBYdHdCWms')
			 .setChildLink('https://www.googleapis.com/drive/v2/files/0B943_02Tka2HSk9zRDBYdHdCWms');
		
		//Assert that we get the appropriate return values.
		System.assertEquals(child.getKind(), 'drive#childReference');
		System.assertEquals(child.getId(), '0B943_02Tka2HSk9zRDBYdHdCWms');
		System.assertEquals(child.getSelfLink(), 'https://www.googleapis.com/drive/v2/files/0B943_02Tka2HbWRNNXl6dy1sNFk/children/0B943_02Tka2HSk9zRDBYdHdCWms');
		System.assertEquals(child.getChildlink(), 'https://www.googleapis.com/drive/v2/files/0B943_02Tka2HSk9zRDBYdHdCWms');	
	}
	
	static testMethod void ffhttp_GoogleDriveModelChildItemList()
	{
		ffhttp_GoogleDriveModelChild.ItemList childList = new ffhttp_GoogleDriveModelChild.ItemList();
	 	System.assertEquals(childList.getKind(), 'drive#childList');
	 	System.assertEquals(childList.getItems(), null);
	}
	
	static testMethod void ffhttp_GoogleDriveModelChannelStop()
	{
		//Create the channelStop class. Chain the set calls so that we can check that we correctly return the channelStop object.
		ffhttp_GoogleDriveModelChannelStop channelStop = new ffhttp_GoogleDriveModelChannelStop();
		channelStop.setId('0B943_02Tka2HV0xGalhIZkQ0M0E')
				   .setResourceId('0B943_02Tka2HV1xGalhIZkQ0M0E');
	
		//Assert that we get the appropriate return values.
		System.assertEquals(channelStop.getId(), '0B943_02Tka2HV0xGalhIZkQ0M0E');
	 	System.assertEquals(channelStop.getResourceId(), '0B943_02Tka2HV1xGalhIZkQ0M0E');
	}
	
	static testMethod void ffhttp_GoogleDriveModelComment()
	{
		//Create all the required sub-classes
		ffhttp_GoogleDriveModelUser user = createUser();
		
		ffhttp_GoogleDriveModelComment.Context commentContext = new ffhttp_GoogleDriveModelComment.Context();
		commentContext.setType('text/html');
		commentContext.setValue('Test value');
		
		//Create the comment class. Chain the set calls so that we can check that we correctly return the comment object.
		ffhttp_GoogleDriveModelComment comment = new ffhttp_GoogleDriveModelComment();
		comment.setSelfLink('CommentLink')
			   .setCommentId('AAAAAMX42Dk')
			   .setCreatedDate(DateTime.newInstance(2014, 8, 4))
			   .setModifiedDate(DateTime.newInstance(2014, 8, 7))
			   .setHtmlContent('Test html comment content')
			   .setContent('Test comment content')
			   .setDeleted(false)
			   .setStatus(ffhttp_GoogleDriveModelComment.COMMENT_STATUS_OPEN)
			   .setAnchor('kix.i7xnronk8c1u')
			   .setFileId('sFlw-1kZn-ix-juGgCsd5gQ')
			   .setFileTitle('Test file')
			   .setContext(commentContext)
			   .setAuthor(user)
			   .setReplies(new List<ffhttp_GoogleDriveModelReply>{createReply()});
			   
		//Assert that we get the appropriate return values.
		System.assertEquals(comment.getKind(), 'drive#comment');
		System.assertEquals(comment.getSelfLink(), 'CommentLink');
		System.assertEquals(comment.getCommentId(), 'AAAAAMX42Dk');
		System.assertEquals(comment.getCreatedDate(), DateTime.newInstance(2014, 8, 4));
		System.assertEquals(comment.getModifiedDate(), DateTime.newInstance(2014, 8, 7));
		System.assertEquals(comment.getHtmlContent(), 'Test html comment content');
		System.assertEquals(comment.getContent(), 'Test comment content');
		System.assertEquals(comment.getDeleted(), false);
		System.assertEquals(comment.getStatus(), 'open');
		System.assertEquals(comment.getAnchor(), 'kix.i7xnronk8c1u');
		System.assertEquals(comment.getFileId(), 'sFlw-1kZn-ix-juGgCsd5gQ');
		System.assertEquals(comment.getFileTitle(), 'Test file');
		System.assertEquals(comment.getContext().getType(), 'text/html');
		System.assertEquals(comment.getContext().getValue(), 'Test value');
		System.assertEquals(comment.getReplies()[0].getKind(), 'drive#commentReply');
		
		assertUser(comment.getAuthor());
	}
	
	static testMethod void ffhttp_GoogleDriveModelCommentItemList()
	{
		ffhttp_GoogleDriveModelComment.ItemList commentList = new ffhttp_GoogleDriveModelComment.ItemList();
	 	System.assertEquals(commentList.getKind(), 'drive#commentList');
	 	System.assertEquals(commentList.getItems(), null);
	}
	
	static testMethod void ffhttp_GoogleDriveModelReply()
	{
		//Create the reply class. Chain the set calls so that we can check that we correctly return the reply object.
		ffhttp_GoogleDriveModelReply reply = createReply();
		
		//Assert that we get the appropriate return values.
		System.assertEquals(reply.getKind(), 'drive#commentReply');
		System.assertEquals(reply.getReplyId(), 'AAAAAMX42D4');
		System.assertEquals(reply.getCreatedDate(), DateTime.newInstance(2014, 8, 5));
		System.assertEquals(reply.getModifiedDate(), DateTime.newInstance(2014, 9, 4));
		System.assertEquals(reply.getHtmlContent(), 'Test html reply content');
		System.assertEquals(reply.getContent(), 'Test reply comment');
		System.assertEquals(reply.getDeleted() , false);
		System.assertEquals(reply.getVerb(), 'resolve');
		
		assertUser(reply.getAuthor());
	}
	
	static testMethod void ffhttp_GoogleDriveModelReplyItemList()
	{
		ffhttp_GoogleDriveModelReply.ItemList replyList = new ffhttp_GoogleDriveModelReply.ItemList();
	 	System.assertEquals(replyList.getKind(), 'drive#commentReplyList');
	 	System.assertEquals(replyList.getItems(), null);
	}
	
	/**
	 * Creates a default reply
	 */
	private static ffhttp_GoogleDriveModelReply createReply()
	{
		//Create all the required sub-classes
		ffhttp_GoogleDriveModelUser user = createUser();
		
		//Create the reply class. Chain the set calls so that we can check that we correctly return the reply object.
		ffhttp_GoogleDriveModelReply reply = new ffhttp_GoogleDriveModelReply();
		reply.setReplyId('AAAAAMX42D4')
			 .setCreatedDate(DateTime.newInstance(2014, 8, 5))
			 .setModifiedDate(DateTime.newInstance(2014, 9, 4))
			 .setHtmlContent('Test html reply content')
			 .setContent('Test reply comment')
			 .setDeleted(false)
			 .setVerb(ffhttp_GoogleDriveModelReply.VERB_RESOLVE)
			 .setAuthor(user);
			 
		return reply;
	}
	
	static testMethod void ffhttp_GoogleDriveModelError()
	{	
		//Create the error class. Chain the set calls so that we can check that we correctly return the error object.
		ffhttp_GoogleDriveModelError error = new ffhttp_GoogleDriveModelError();
		error.setCode(404).setMessage('Not Found');
		
		//Assert that we get the appropriate return values.
		System.assertEquals(error.getCode(), 404);
		System.assertEquals(error.getMessage(), 'Not Found');
	}
	
	static testMethod void ffhttp_GoogleDriveModelFile()
	{
		//Create all the required sub-classes
		ffhttp_GoogleDriveModelPermission userPermission = createPermission();
		ffhttp_GoogleDriveModelProperty property = createProperty();
		ffhttp_GoogleDriveModelParent parent = createParent();
		ffhttp_GoogleDriveModelUser owner = createUser();
		ffhttp_GoogleDriveModelUser lastModifyingUser = createUser();
		ffhttp_GoogleDriveModelUser sharingUser = createUser();
		
		ffhttp_GoogleDriveModelFile.Labels fileLabels = new ffhttp_GoogleDriveModelFile.Labels();
		fileLabels.setStarred(false)
				  .setTrashed(false)
				  .setRestricted(false)
				  .setViewed(false);
		
		ffhttp_GoogleDriveModelFile.ImageMediaMetadata imageMediaMetaData = createImageMediaMetaData();
		
		ffhttp_GoogleDriveModelFile.VideoMediaMetadata videoMediaMetaData = new ffhttp_GoogleDriveModelFile.VideoMediaMetadata();
		videoMediaMetaData.setWidth(720);
		videoMediaMetaData.setHeight(480);	
		videoMediaMetaData.setDurationMillis(30000);
		
		ffhttp_GoogleDriveModelFile.Thumbnail thumbnail = new ffhttp_GoogleDriveModelFile.Thumbnail();
		thumbnail.setImage('Test')
				 .setMimeType('image/jpeg');
				 
		ffhttp_GoogleDriveModelFile.IndexableText indexableText = new ffhttp_GoogleDriveModelFile.IndexableText();
		indexableText.setText('Test Index');
		
		//Create the file class. Chain the set calls so that we can check that we correctly return the file object.
		ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
		file.setId('0B943_02Tka2HV0xGalhIZkQ0M0E')
			.setEtag('"M4l5RvCt2StP2jOGfgyJPGdTZTc/MTQwOTA1Nzk3NjAwMA"')
			.setSelfLink('https://www.googleapis.com/drive/v2/files/0B943_02Tka2HbjRnUm9fbkVqUkk')
			.setWebContentLink('https://docs.google.com/a/financialforce.com/uc?id=0B943_02Tka2HbjRnUm9fbkVqUkk&export=download')
  			.setAlternateLink('https://docs.google.com/a/financialforce.com/file/d/0B943_02Tka2HbjRnUm9fbkVqUkk/edit?usp=drivesdk')
   			.setEmbedLink('https://docs.google.com/a/financialforce.com/document/d/1i28zwVvJTLLLXV-q-a06Zj4TRMyNW4saU4qKYmTOVjs/preview')
   			.setIconLink('https://ssl.gstatic.com/docs/doclist/images/icon_11_image_list.png')
   			.setThumbnailLink('https://lh3.googleusercontent.com/kQjvgOD2cOx62HfZwIZAPPQapX-QWwtejNOQ1IZ7zFpXPyCY5rMZvQO4a9aPu2BjYbywsA=s220')
   			.setWebViewLink('https://docs.google.com/a/financialforce.com/document/d/1i28zwVvJTLLLXV-q-a06Zj4TRMyNW4saU4qKYmTOVjt/preview')
   			.setDefaultOpenWithLink('https://docs.google.com/a/financialforce.com/uc?id=0B943_02Tka2HbjRnUm9fbkVqUkl')
   			.setTitle('DSCN3227.JPG')
   			.setMimeType('image/jpeg')
   			.setDescription('Test Description')
			.setLabels(fileLabels)
			.setCreatedDate(DateTime.newInstance(2014, 10, 01))
			.setModifiedDate(DateTime.newInstance(2014, 10, 02))
			.setModifiedByMeDate(DateTime.newInstance(2014, 10, 03))
			.setSharedWithMeDate(DateTime.newInstance(2014, 10, 04))
			.setLastViewedByMeDate(DateTime.newInstance(2014, 10, 05))
			.setMarkedViewedByMeDate(DateTime.newInstance(2014, 10, 06))
			.setFileExtension('jpg')
			.setMd5CheckSum('33b43ff55d2c0f16aecc99ac03356934')
			.setFileSize(84435)
			.setOriginalFileName('DSCN3228.JPG')
			.setQuotaBytesUsed(84436)
			.setOwnerNames(new String[]{'Matthew Wood'})
			.setExportLinks(new Map<String, String>{'Export Link 1' => 'Test Export'})
			.setOpenWithLinks(new Map<String, String>{'Link 1' => 'Test Link'})
			.setOwners(new ffhttp_GoogleDriveModelUser[]{owner})
			.setWritersCanShare(false)
			.setLastModifyingUserName('David Smith')
			.setEditable(false)
			.setExplicitlyTrashed(false)
			.setShared(true)
			.setAppDataContents(false)
			.setHeadRevisionId('0B943_02Tka2HalJ0ZEIxWEk0MGNIQjJHQVRTeWp3V24wQXVjPQ')
			.setCopyable(false)
			.setVersion(4)
			.setLastModifyingUser(lastModifyingUser)
			.setSharingUser(sharingUser)
			.setUserPermission(userPermission)
			.setPermissions(new ffhttp_GoogleDriveModelPermission[]{userPermission})
			.setProperties(new ffhttp_GoogleDriveModelProperty[]{property})
			.setImageMediaMetaData(imageMediaMetaData)
			.setVideoMediaMetaData(videoMediaMetaData)
			.setParents(new ffhttp_GoogleDriveModelParent[]{parent})
			.setThumbnail(thumbnail)
			.setDownloadUrl('https://doc-00-4s-docs.googleusercontent.com/docs/securesc/df4trhacu2hp54rraeo4a99sam3mq7hh/r5pbb2t8luit695t4t36l3rlpaumo137/1414958400000/13058876669334088843/13098600474491268363/0B943_02Tka2HbjRnUm9fbkVqUkk?h=09719523284502038548&e=download&gd=true')
			.setIndexableText(indexableText);
		
		//Assert that we get the appropriate return values.	
		System.assertEquals(file.getKind(), 'drive#file');
		System.assertEquals(file.getId(), '0B943_02Tka2HV0xGalhIZkQ0M0E');
		System.assertEquals(file.getEtag(), '"M4l5RvCt2StP2jOGfgyJPGdTZTc/MTQwOTA1Nzk3NjAwMA"');
		System.assertEquals(file.getSelfLink(), 'https://www.googleapis.com/drive/v2/files/0B943_02Tka2HbjRnUm9fbkVqUkk');
		System.assertEquals(file.getWebContentLink(), 'https://docs.google.com/a/financialforce.com/uc?id=0B943_02Tka2HbjRnUm9fbkVqUkk&export=download');
  		System.assertEquals(file.getAlternateLink(), 'https://docs.google.com/a/financialforce.com/file/d/0B943_02Tka2HbjRnUm9fbkVqUkk/edit?usp=drivesdk');
   		System.assertEquals(file.getEmbedLink(), 'https://docs.google.com/a/financialforce.com/document/d/1i28zwVvJTLLLXV-q-a06Zj4TRMyNW4saU4qKYmTOVjs/preview');
   		System.assertEquals(file.getIconLink(), 'https://ssl.gstatic.com/docs/doclist/images/icon_11_image_list.png');
   		System.assertEquals(file.getThumbnailLink(), 'https://lh3.googleusercontent.com/kQjvgOD2cOx62HfZwIZAPPQapX-QWwtejNOQ1IZ7zFpXPyCY5rMZvQO4a9aPu2BjYbywsA=s220');
   		System.assertEquals(file.getWebViewLink(), 'https://docs.google.com/a/financialforce.com/document/d/1i28zwVvJTLLLXV-q-a06Zj4TRMyNW4saU4qKYmTOVjt/preview');
   		System.assertEquals(file.getDefaultOpenWithLink(), 'https://docs.google.com/a/financialforce.com/uc?id=0B943_02Tka2HbjRnUm9fbkVqUkl');
   		System.assertEquals(file.getTitle(), 'DSCN3227.JPG');
   		System.assertEquals(file.getMimeType(), 'image/jpeg');
   		System.assertEquals(file.getDescription(), 'Test Description');
		System.assertEquals(file.getLabels().getStarred(), false);
		System.assertEquals(file.getLabels().getTrashed(), false);
		System.assertEquals(file.getLabels().getRestricted(), false);
		System.assertEquals(file.getLabels().getViewed(), false);
		System.assertEquals(file.getCreatedDate(), DateTime.newInstance(2014, 10, 01));
		System.assertEquals(file.getModifiedDate(), DateTime.newInstance(2014, 10, 02));
		System.assertEquals(file.getModifiedByMeDate(), DateTime.newInstance(2014, 10, 03));
		System.assertEquals(file.getSharedWithMeDate(), DateTime.newInstance(2014, 10, 04));
		System.assertEquals(file.getLastViewedByMeDate(), DateTime.newInstance(2014, 10, 05));
		System.assertEquals(file.getMarkedViewedByMeDate(), DateTime.newInstance(2014, 10, 06));
		System.assertEquals(file.getFileExtension(), 'jpg');
		System.assertEquals(file.getMd5CheckSum(), '33b43ff55d2c0f16aecc99ac03356934');
		System.assertEquals(file.getFileSize(), 84435);
		System.assertEquals(file.getOriginalFileName(), 'DSCN3228.JPG');
		System.assertEquals(file.getQuotaBytesUsed(), 84436);
		System.assertEquals(file.getOwnerNames()[0], 'Matthew Wood');
		System.assertEquals(file.getExportLinks(), new Map<String, String>{'Export Link 1' => 'Test Export'});
		System.assertEquals(file.getOpenWithLinks(), new Map<String, String>{'Link 1' => 'Test Link'});
		System.assertEquals(file.getWritersCanShare(), false);
		System.assertEquals(file.getLastModifyingUserName(), 'David Smith');
		System.assertEquals(file.getEditable(), false);
		System.assertEquals(file.getExplicitlyTrashed(), false);
		System.assertEquals(file.getShared(), true);
		System.assertEquals(file.getAppDataContents(), false);
		System.assertEquals(file.getHeadRevisionId(), '0B943_02Tka2HalJ0ZEIxWEk0MGNIQjJHQVRTeWp3V24wQXVjPQ');
		System.assertEquals(file.getCopyable(), false);
		System.assertEquals(file.getVersion(), 4);
		System.assertEquals(file.getVideoMediaMetaData().getWidth(), 720);
		System.assertEquals(file.getVideoMediaMetaData().getHeight(), 480);
		System.assertEquals(file.getVideoMediaMetaData().getDurationMillis(), 30000);
		System.assertEquals(file.getThumbnail().getImage(), 'Test');
		System.assertEquals(file.getThumbnail().getMimeType(), 'image/jpeg');
		System.assertEquals(file.getDownloadUrl(), 'https://doc-00-4s-docs.googleusercontent.com/docs/securesc/df4trhacu2hp54rraeo4a99sam3mq7hh/r5pbb2t8luit695t4t36l3rlpaumo137/1414958400000/13058876669334088843/13098600474491268363/0B943_02Tka2HbjRnUm9fbkVqUkk?h=09719523284502038548&e=download&gd=true');
		System.assertEquals(file.getIndexableText().getText(), 'Test Index');
		
		assertPermission(file.getUserPermission());
		assertPermission(file.getPermissions()[0]);
		assertProperty(file.getProperties()[0]);
		assertParent(file.getParents()[0]);
		assertUser(file.getOwners()[0]);
		assertUser(file.getSharingUser());
		assertUser(file.getLastModifyingUser());
		assertImageMediaMetaData(file.getImageMediaMetaData());
	}
	
	private static ffhttp_GoogleDriveModelFile.ImageMediaMetadata createImageMediaMetaData()
	{
		ffhttp_GoogleDriveModelFile.ImageMediaMetadata_Location location = createImageMediaMetaDataLocation();
		
		ffhttp_GoogleDriveModelFile.ImageMediaMetadata imageMediaMetaData = new ffhttp_GoogleDriveModelFile.ImageMediaMetadata();
		imageMediaMetaData.setWidth(2992)
						  .setHeight(2992)
						  .setRotation(0)
						  .setDateTaken('2014:08:26 12:59:36')
						  .setCameraMake('NIKON')
						  .setCameraModel('COOLPIX P500')
						  .setExposureTime(0.00066666666D)
						  .setAperture(4.2D)
						  .setFlashUsed(false)
						  .setFocalLength(8.1D)
						  .setIsoSpeed(280)
						  .setMeteringMode('Pattern')
						  .setSensor(null)
						  .setExposureMode('Auto')
						  .setColorSpace('sRGB')
						  .setWhiteBalance('Auto')
						  .setExposureBias(0)
						  .setMaxApertureValue(3.5D)
						  .setSubjectDistance(0)
						  .setLens(null)
						  .setLocation(location);
						  
		assertImageMediaMetaData(imageMediaMetaData);
		
		return imageMediaMetaData;
	}
	
	private static ffhttp_GoogleDriveModelFile.ImageMediaMetadata_Location createImageMediaMetaDataLocation()
	{
		ffhttp_GoogleDriveModelFile.ImageMediaMetadata_Location location = new ffhttp_GoogleDriveModelFile.ImageMediaMetadata_Location();
		location.setLatitude(434.2D)
				.setLongitude(254.4D)
				.setAltitude(85.1D);
		return location;
	}
	
	private static void assertImageMediaMetaDataLocation(ffhttp_GoogleDriveModelFile.ImageMediaMetadata_Location location)
	{
		System.assertEquals(location.getLatitude(), 434.2D);
		System.assertEquals(location.getLongitude(), 254.4D);
		System.assertEquals(location.getAltitude(), 85.1D);	
	}
	
	private static void assertImageMediaMetaData(ffhttp_GoogleDriveModelFile.ImageMediaMetadata imageMediaMetaData)
	{
		System.assertEquals(imageMediaMetaData.getWidth(), 2992);
		System.assertEquals(imageMediaMetaData.getHeight(), 2992);
		System.assertEquals(imageMediaMetaData.getRotation(), 0);
		System.assertEquals(imageMediaMetaData.getDateTaken(), '2014:08:26 12:59:36');
		System.assertEquals(imageMediaMetaData.getCameraMake(), 'NIKON');
		System.assertEquals(imageMediaMetaData.getCameraModel(), 'COOLPIX P500');
		System.assertEquals(imageMediaMetaData.getExposureTime(), 0.00066666666);
		System.assertEquals(imageMediaMetaData.getAperture(), 4.2D);
		System.assertEquals(imageMediaMetaData.getFlashUsed(), false);
		System.assertEquals(imageMediaMetaData.getFocalLength(), 8.1D);
		System.assertEquals(imageMediaMetaData.getIsoSpeed(), 280);
		System.assertEquals(imageMediaMetaData.getMeteringMode(), 'Pattern');
		System.assertEquals(imageMediaMetaData.getSensor(), null);
		System.assertEquals(imageMediaMetaData.getExposureMode(), 'Auto');
		System.assertEquals(imageMediaMetaData.getColorSpace(), 'sRGB');
		System.assertEquals(imageMediaMetaData.getWhiteBalance(), 'Auto');
		System.assertEquals(imageMediaMetaData.getExposureBias(), 0);
		System.assertEquals(imageMediaMetaData.getMaxApertureValue(), 3.5D);
		System.assertEquals(imageMediaMetaData.getSubjectDistance(), 0);
		System.assertEquals(imageMediaMetaData.getLens(), null);
		
		assertImageMediaMetaDataLocation(imageMediaMetaData.getLocation());
	}
	
	static testMethod void ffhttp_GoogleDriveModelFileItemList()
	{
		ffhttp_GoogleDriveModelFile.ItemList fileList = new ffhttp_GoogleDriveModelFile.ItemList();
	 	System.assertEquals(fileList.getKind(), 'drive#fileList');
	 	System.assertEquals(fileList.getItems(), null);
	}
	
	static testMethod void ffhttp_GoogleDriveModelParent()
	{
		//Create the parent class. Chain the set calls so that we can check that we correctly return the parent object.
		ffhttp_GoogleDriveModelParent parent = createParent();
			  		
		//Assert that we get the appropriate return values.
		assertParent(parent);
	}
	
	private static ffhttp_GoogleDriveModelParent createParent()
	{
		ffhttp_GoogleDriveModelParent parent = new ffhttp_GoogleDriveModelParent();
		parent.setId('0B943_02Tka2HYlVfRUs4UmVHZWc')
			  .setSelfLink('https://www.googleapis.com/drive/v2/files/0B943_02Tka2HUl9NLVN0cGVyN1k/parents/0B943_02Tka2HYlVfRUs4UmVHZWc')
			  .setParentLink('https://www.googleapis.com/drive/v2/files/0B943_02Tka2HYlVfRUs4UmVHZWc')
			  .setIsRoot(false);
		return parent;
	}
	
	private static void assertParent(ffhttp_GoogleDriveModelParent parent)
	{
		System.assertEquals(parent.getKind(), 'drive#parentReference');	
		System.assertEquals(parent.getId(), '0B943_02Tka2HYlVfRUs4UmVHZWc');
		System.assertEquals(parent.getSelfLink(), 'https://www.googleapis.com/drive/v2/files/0B943_02Tka2HUl9NLVN0cGVyN1k/parents/0B943_02Tka2HYlVfRUs4UmVHZWc');
     	System.assertEquals(parent.getParentLink(), 'https://www.googleapis.com/drive/v2/files/0B943_02Tka2HYlVfRUs4UmVHZWc');
     	System.assertEquals(parent.getIsRoot(), false);
	}
	
	static testMethod void ffhttp_GoogleDriveModelParentReferenceItemList()
	{
		ffhttp_GoogleDriveModelParent.ItemList parentReferenceList = new ffhttp_GoogleDriveModelParent.ItemList();
	 	System.assertEquals(parentReferenceList.getKind(), 'drive#parentList');
	 	System.assertEquals(parentReferenceList.getItems(), null);
	}
	
	static testMethod void ffhttp_GoogleDriveModelPermission()
	{
		//Create the permission class. Chain the set calls so that we can check that we correctly return the permission object.
		ffhttp_GoogleDriveModelPermission permission = createPermission();
		
		//Assert that we get the appropriate return values.
		assertPermission(permission);
	}
	
	private static ffhttp_GoogleDriveModelPermission createPermission()
	{
		ffhttp_GoogleDriveModelPermission permission = new ffhttp_GoogleDriveModelPermission();
		permission.setEtag('"M4l5RvCt2StP2jOGfgyJPGdTZTc/TsMRSMKbGpCX07EK8a88FL9nn_M"')
				  .setId('13098600474491268363')
				  .setSelfLink('https://www.googleapis.com/drive/v2/files/0B943_02Tka2HdGJRZ1Z1MlhNeG8/permissions/13098600474491268363')
				  .setName('Matthew Wood')
				  .setEmailAddress('mwood@financialforce.com')
				  .setDomain('financialforce.com')
				  .setRole(ffhttp_GoogleDriveModelPermission.PERMISSION_ROLE_OWNER)
				  .setType(ffhttp_GoogleDriveModelPermission.PERMISSION_TYPE_USER)
				  .setValue('mwood@financialforce.com')
				  .setAdditionalRoles(new String[]{ffhttp_GoogleDriveModelPermission.PERMISSION_ROLE_COMMENTER})
				  .setAuthKey('AuthKey')
				  .setWithLink(true)
				  .setPhotoLink('https://www.googleapis.com/drive/v2/files/0B943_02Tka2HdGJRZ1Z1MlhNeG8/permissions/13098600474491268363');
		return permission;
	}
	
	private static void assertPermission(ffhttp_GoogleDriveModelPermission permission)
	{
		System.assertEquals(permission.getKind(), 'drive#permission');
		System.assertEquals(permission.getEtag(), '"M4l5RvCt2StP2jOGfgyJPGdTZTc/TsMRSMKbGpCX07EK8a88FL9nn_M"');
		System.assertEquals(permission.getId(), '13098600474491268363');
		System.assertEquals(permission.getSelfLink(), 'https://www.googleapis.com/drive/v2/files/0B943_02Tka2HdGJRZ1Z1MlhNeG8/permissions/13098600474491268363');
		System.assertEquals(permission.getName(), 'Matthew Wood');
		System.assertEquals(permission.getEmailAddress(), 'mwood@financialforce.com');
		System.assertEquals(permission.getDomain(), 'financialforce.com');
		System.assertEquals(permission.getRole(), 'owner');
		System.assertEquals(permission.getType(), 'user');
		System.assertEquals(permission.getValue(), 'mwood@financialforce.com');
		System.assertEquals(permission.getAdditionalRoles()[0], 'commenter');
		System.assertEquals(permission.getAuthKey(), 'AuthKey');
		System.assertEquals(permission.isWithLink(), true);
		System.assertEquals(permission.getPhotoLink(), 'https://www.googleapis.com/drive/v2/files/0B943_02Tka2HdGJRZ1Z1MlhNeG8/permissions/13098600474491268363');
	}
	
	static testMethod void ffhttp_GoogleDriveModelPermissionItemList()
	{
		ffhttp_GoogleDriveModelPermission.ItemList permissionList = new ffhttp_GoogleDriveModelPermission.ItemList();
	 	System.assertEquals(permissionList.getKind(), 'drive#permissionList');
	 	System.assertEquals(permissionList.getItems(), null);
	}
	
	static testMethod void ffhttp_GoogleDriveModelPermissionId()
	{
		//Create the permissionId class.
		ffhttp_GoogleDriveModelPermissionId permissionId = new ffhttp_GoogleDriveModelPermissionId();
		permissionId.setId('13098600474491268364');
		
		//Assert that we get the appropriate return values.
		System.assertEquals(permissionId.getKind(), 'drive#permissionId');
		System.assertEquals(permissionId.getId(), '13098600474491268364');
	}
	
	static testMethod void ffhttp_GoogleDriveModelProperty()
	{
		//Create the property class. Chain the set calls so that we can check that we correctly return the property object.
		ffhttp_GoogleDriveModelProperty property = createProperty();
			    
		//Assert that we get the appropriate return values.
		assertProperty(property);
	}
	
	private static ffhttp_GoogleDriveModelProperty createProperty()
	{
		ffhttp_GoogleDriveModelProperty property = new ffhttp_GoogleDriveModelProperty();
		property.setEtag('"M4l5RvCt2StP2jOGfgyJPGdTZTc/-TijuZ_j98NxSmtsJ_DIobA-BKg"')
			    .setSelfLink('https://www.googleapis.com/drive/v2/files/0B943_02Tka2HM3hkVV8xYnYxbzA/properties/TestKey?visibility=PUBLIC')
			    .setKey('TestKey')
			    .setVisibility('PUBLIC')
			    .setValue('TestValue');
		return property;
	}
	
	private static void assertProperty(ffhttp_GoogleDriveModelProperty property)
	{
		System.assertEquals(property.getKind(), 'drive#property');
		System.assertEquals(property.getEtag(), '"M4l5RvCt2StP2jOGfgyJPGdTZTc/-TijuZ_j98NxSmtsJ_DIobA-BKg"');
		System.assertEquals(property.getSelfLink(), 'https://www.googleapis.com/drive/v2/files/0B943_02Tka2HM3hkVV8xYnYxbzA/properties/TestKey?visibility=PUBLIC');
		System.assertEquals(property.getKey(), 'TestKey');
		System.assertEquals(property.getVisibility(), 'PUBLIC');
		System.assertEquals(property.getValue(), 'TestValue');
	}
	
	static testMethod void ffhttp_GoogleDriveModelPropertyItemList()
	{
		ffhttp_GoogleDriveModelProperty.ItemList propertyList = new ffhttp_GoogleDriveModelProperty.ItemList();
	 	System.assertEquals(propertyList.getKind(), 'drive#propertyList');
	 	System.assertEquals(propertyList.getItems(), null);
	}
	
	static testMethod void ffhttp_GoogleDriveModelRevision()
	{
		//Create all the required sub-classes
		ffhttp_GoogleDriveModelUser user = createUser();
		
		//Create the revision class. Chain the set calls so that we can check that we correctly return the revision object.
		ffhttp_GoogleDriveModelRevision revision = new ffhttp_GoogleDriveModelRevision();
		revision.setEtag('"M4l5RvCt2StP2jOGfgyJPGdTZTc/oLJFx9yXC4NwnzOHt9RJjY5eKSk"')
				.setId('0B943_02Tka2HQ3o3RjY5WXRGZGRFTFdPYk1XVUd3cnJMbm1RPQ')
				.setSelfLink('https://www.googleapis.com/drive/v2/files/0B943_02Tka2HM3M5RXNmRDgwSlU/revisions/0B943_02Tka2HQ3o3RjY5WXRGZGRFTFdPYk1XVUd3cnJMbm1RPQ')
	 			.setMimeType('text/plain')
	 			.setModifiedDate(Datetime.newInstance(2014, 10, 31))
	 			.setPinned(false)
	 			.setPublished(false)
	 			.setDownloadUrl('https://doc-10-4s-docs.googleusercontent.com/docs/securesc/df4trhacu2hp54rraeo4a99sam3mq7hh/61lsadimtf9r68ie4akvpfnpo3jpjuro/1414756800000/13058876669334088843/13098600474491268363/0B943_02Tka2HM3M5RXNmRDgwSlU?rid=0B943_02Tka2HQ3o3RjY5WXRGZGRFTFdPYk1XVUd3cnJMbm1RPQ&h=09719523284502038548&e=download&gd=true')
	 			.setLastModifyingUserName('Matthew Wood')
	 			.setLastModifyingUser(user)
	 			.setOriginalFilename('Test file')
	 			.setMd5Checksum('c9fb58865f2888482e9c07fe8660d7db')
	 			.setFileSize(12)
	 			.setPublishedLink('https://doc-10-4s-docs.googleusercontent.com/')
	 			.setPublishAuto(false)
	 			.setPublishedOutsideDomain(false)
	 			.setExportLinks(new Map<String, String>{'txt' => 'https://doc-10-4s-docs.googleusercontent.com/'});
		
		//Assert that we get the appropriate return values.
	 	System.assertEquals(revision.getKind(), 'drive#revision');
	 	System.assertEquals(revision.getEtag(), '"M4l5RvCt2StP2jOGfgyJPGdTZTc/oLJFx9yXC4NwnzOHt9RJjY5eKSk"');
	 	System.assertEquals(revision.getId(), '0B943_02Tka2HQ3o3RjY5WXRGZGRFTFdPYk1XVUd3cnJMbm1RPQ');
	 	System.assertEquals(revision.getSelfLink(), 'https://www.googleapis.com/drive/v2/files/0B943_02Tka2HM3M5RXNmRDgwSlU/revisions/0B943_02Tka2HQ3o3RjY5WXRGZGRFTFdPYk1XVUd3cnJMbm1RPQ');
	 	System.assertEquals(revision.getMimeType(), 'text/plain');
	 	System.assertEquals(revision.getModifiedDate(), Datetime.newInstance(2014, 10, 31));
	 	System.assertEquals(revision.getPinned(), false);
	 	System.assertEquals(revision.getPublished(), false);
	 	System.assertEquals(revision.getDownloadUrl(), 'https://doc-10-4s-docs.googleusercontent.com/docs/securesc/df4trhacu2hp54rraeo4a99sam3mq7hh/61lsadimtf9r68ie4akvpfnpo3jpjuro/1414756800000/13058876669334088843/13098600474491268363/0B943_02Tka2HM3M5RXNmRDgwSlU?rid=0B943_02Tka2HQ3o3RjY5WXRGZGRFTFdPYk1XVUd3cnJMbm1RPQ&h=09719523284502038548&e=download&gd=true');
	 	System.assertEquals(revision.getLastModifyingUserName(), 'Matthew Wood');
	 	System.assertEquals(revision.getOriginalFilename(), 'Test file');
	 	System.assertEquals(revision.getMd5Checksum(), 'c9fb58865f2888482e9c07fe8660d7db');
	 	System.assertEquals(revision.getFileSize(), 12);
	 	System.assertEquals(revision.getPublishedLink(), 'https://doc-10-4s-docs.googleusercontent.com/');
	 	System.assertEquals(revision.getPublishAuto(), false);
	 	System.assertEquals(revision.getPublishedOutsideDomain(), false);
	 	System.assertEquals(revision.getExportLinks(), new Map<String, String>{'txt' => 'https://doc-10-4s-docs.googleusercontent.com/'});
	
		assertUser(revision.getLastModifyingUser());
	}
	
	static testMethod void ffhttp_GoogleDriveModelRevisionItemList()
	{
		ffhttp_GoogleDriveModelRevision.ItemList revisionList = new ffhttp_GoogleDriveModelRevision.ItemList();
	 	System.assertEquals(revisionList.getKind(), 'drive#revisionList');
	 	System.assertEquals(revisionList.getItems(), null);
	}
	
	static testMethod void ffhttp_GoogleDriveModelUser()
	{
		//Create the user class. Chain the set calls so that we can check that we correctly return the user object.
		ffhttp_GoogleDriveModelUser user = createUser();
		
		//Assert that we get the appropriate return values.
		assertUser(user);
	}
	
	/**
	 * Creates a default user
	 */
	private static ffhttp_GoogleDriveModelUser createUser()
	{
		ffhttp_GoogleDriveModelUser.Picture userPicture = new ffhttp_GoogleDriveModelUser.Picture();
		userPicture.setUrl('https://lh6.googleusercontent.com/-NBNROxZe69I/AAAAAAAAAAI/AAAAAAAAAEk/s4JcLi3bdro/s64/photo.jpg');
		
		ffhttp_GoogleDriveModelUser user = new ffhttp_GoogleDriveModelUser();
		user.setDisplayName('Matthew Wood')
					   .setIsAuthenticatedUser(true)
					   .setPermissionId('13098600474491268344')
					   .setEmailAddress('mwood@financialforce.com')
					   .setPicture(userPicture);
		
		assertUser(user);
		
		return user;
	}
	
	private static void assertUser(ffhttp_GoogleDriveModelUser user)
	{
		System.assertEquals(user.getKind(), 'drive#user');
		System.assertEquals(user.getDisplayName(), 'Matthew Wood');
		System.assertEquals(user.getIsAuthenticatedUser(), true);
		System.assertEquals(user.getPermissionId(), '13098600474491268344');
		System.assertEquals(user.getEmailAddress(), 'mwood@financialforce.com');
		System.assertEquals(user.getPicture().getUrl(), 'https://lh6.googleusercontent.com/-NBNROxZe69I/AAAAAAAAAAI/AAAAAAAAAEk/s4JcLi3bdro/s64/photo.jpg');
	}
	
	static testMethod void ffhttp_GoogleDriveModelWatch()
	{
		//Create the watch class. Chain the set calls so that we can check that we correctly return the watch object.
		ffhttp_GoogleDriveModelWatch watch = new ffhttp_GoogleDriveModelWatch();
		watch.setId('WatchId')
			 .setToken('WatchToken')
			 .setExpiration(23519873897129L)
			 .setType('WatchType')
			 .setAddress('WatchAddress');
		
		//Assert that we get the appropriate return values.
		System.assertEquals(watch.getId(), 'WatchId');
		System.assertEquals(watch.getToken(), 'WatchToken');
		System.assertEquals(watch.getExpiration(), 23519873897129L);
		System.assertEquals(watch.getType(), 'WatchType');
		System.assertEquals(watch.getAddress(), 'WatchAddress');
	}
}
