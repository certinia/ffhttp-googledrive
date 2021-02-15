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
 * ffhttp_GoogleDriveTest
 *
 * Test class for the GoogleDrive 'package'.
 * 
 * This class currently provides test code coverage for this package. 
 * It checks that all base URLs are what Google Drive requires.
 */
@isTest
private class ffhttp_GoogleDriveTest 
{
	static testMethod void testGoogleDriveClient()
	{
		ffhttp_Client.IAccessTokenCredentials credentials = new ffhttp_Client.AccessTokenCredentials('Bearer', 'Test');
		ffhttp_GoogleDrive gd = new ffhttp_GoogleDrive(credentials);
		
		System.assertEquals(((ffhttp_Client.IAccessTokenCredentials)gd.getCredentials()).getAccessToken(), 'Test');
	}
	
	/**
	 * ffhttp_GoogleDriveFiles tests
	 */
	static testMethod void ffhttp_GoogleDriveFilesGetRequest()
	{
		ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
		ffhttp_GoogleDriveFiles.GetRequest getRequest = files.getRequest('0B94302Tka2HWkNrOElaaUxQaUU');
		assertRequestEndpointAndMethod(getRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU', 'GET');
	
		System.assertEquals(getRequest.getUpdateViewedDate(), false);
		System.assertEquals(getRequest.getPrettyPrint(), true);
		getRequest.setUpdateViewedDate(true);
		getRequest.setPrettyPrint(false);
		System.assertEquals(getRequest.getUpdateViewedDate(), true);
		System.assertEquals(getRequest.getPrettyPrint(), false);
	}
	
	static testMethod void ffhttp_GoogleDriveFilesInsertRequest()
	{
		ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
		file.setId('0B94302Tka2HWkNrOElaaUxQaUU');
		file.setMimeType('text/plain');
		
		ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
		
		ffhttp_GoogleDriveFiles.InsertRequest insertRequest = files.insertRequest(file, null);
		assertRequestEndpointAndMethod(insertRequest, 'https://www.googleapis.com/drive/v2/files/', 'POST');
		
		insertRequest = files.insertRequest(file, Blob.valueOf('Testing Blob'));
		assertRequestEndpointAndMethod(insertRequest, 'https://www.googleapis.com/upload/drive/v2/files/?uploadType=media', 'POST');
	
		System.assertEquals(insertRequest.getConvert(), false);
		System.assertEquals(insertRequest.getOcr(), false);
		System.assertEquals(insertRequest.getOcrLanguage(), null);
		System.assertEquals(insertRequest.getPinned(), false);
		System.assertEquals(insertRequest.getTimedTextLanguage(), null);
		System.assertEquals(insertRequest.getTimedTextTrackName(), null);
		System.assertEquals(insertRequest.getUseContentAsIndexableText(), false);
		System.assertEquals(insertRequest.getVisibility(), 'DEFAULT');
		
		insertRequest.setConvert(true).setOcr(true).setOcrLanguage('en-GB').setPinned(true)
					 .setTimedTextLanguage('en-US').setTimedTextTrackName('en-UK').setUseContentAsIndexableText(true)
					 .setVisibility('PRIVATE');
					 
		System.assertEquals(insertRequest.getConvert(), true);
		System.assertEquals(insertRequest.getOcr(), true);
		System.assertEquals(insertRequest.getOcrLanguage(), 'en-GB');
		System.assertEquals(insertRequest.getPinned(), true);
		System.assertEquals(insertRequest.getTimedTextLanguage(),'en-US');
		System.assertEquals(insertRequest.getTimedTextTrackName(), 'en-UK');
		System.assertEquals(insertRequest.getUseContentAsIndexableText(), true);
		System.assertEquals(insertRequest.getVisibility(), 'PRIVATE');	
	}
	
	static testMethod void ffhttp_GoogleDriveFilesUpdateRequest()
	{
		ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
		file.setId('0B94302Tka2HWkNrOElaaUxQaUU');
		file.setMimeType('text/plain');
		
		ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
		ffhttp_GoogleDriveFiles.UpdateRequest updateRequest = files.updateRequest(file, null);
		assertRequestEndpointAndMethod(updateRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU', 'PUT');
		
		updateRequest = files.updateRequest(file, Blob.valueOf('Testing Blob'));
		assertRequestEndpointAndMethod(updateRequest, 'https://www.googleapis.com/upload/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU?uploadType=media', 'PUT');
		
		System.assertEquals(updateRequest.getAddParents(), null);
		System.assertEquals(updateRequest.getConvert(), false);
		System.assertEquals(updateRequest.getNewRevision(), true);
		System.assertEquals(updateRequest.getOcr(), false);
		System.assertEquals(updateRequest.getOcrLanguage(), null);
		System.assertEquals(updateRequest.getPinned(), false);
		System.assertEquals(updateRequest.getRemoveParents(), null);
		System.assertEquals(updateRequest.getSetModifiedDate(), false);
		System.assertEquals(updateRequest.getTimedTextLanguage(), null);
		System.assertEquals(updateRequest.getTimedTextTrackName(), null);
		System.assertEquals(updateRequest.getUpdateViewedDate(), true);
		System.assertEquals(updateRequest.getUseContentAsIndexableText(), false);
		
		updateRequest.setAddParents('Parent1').setConvert(true).setNewRevision(false)
					 .setOcr(true).setOcrLanguage('en-GB').setPinned(true).setRemoveParents('Parent2')
					 .setSetModifiedDate(true).setTimedTextLanguage('en-US').setTimedTextTrackName('en-UK')
					 .setUpdateViewedDate(false).setUseContentAsIndexableText(true);
		
		System.assertEquals(updateRequest.getAddParents(), 'Parent1');
		System.assertEquals(updateRequest.getConvert(), true);
		System.assertEquals(updateRequest.getNewRevision(), false);
		System.assertEquals(updateRequest.getOcr(), true);
		System.assertEquals(updateRequest.getOcrLanguage(), 'en-GB');
		System.assertEquals(updateRequest.getPinned(), true);
		System.assertEquals(updateRequest.getRemoveParents(), 'Parent2');
		System.assertEquals(updateRequest.getSetModifiedDate(), true);
		System.assertEquals(updateRequest.getTimedTextLanguage(), 'en-US');
		System.assertEquals(updateRequest.getTimedTextTrackName(), 'en-UK');
		System.assertEquals(updateRequest.getUpdateViewedDate(), false);
		System.assertEquals(updateRequest.getUseContentAsIndexableText(), true);
	}
	
	static testMethod void ffhttp_GoogleDriveFilesCopyRequest()
	{
		ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
		file.setId('0B94302Tka2HWkNrOElaaUxQaUU');
		file.setMimeType('text/plain');
		
		ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
		ffhttp_GoogleDriveFiles.CopyRequest copyRequest = files.copyRequest('0B94302Tka2HWkNrOElaaUxQaUU', file);
		assertRequestEndpointAndMethod(copyRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/copy', 'POST');
		
		System.assertEquals(copyRequest.getConvert(), false);
		System.assertEquals(copyRequest.getOcr(), false);
		System.assertEquals(copyRequest.getOcrLanguage(), null);
		System.assertEquals(copyRequest.getPinned(), false);
		System.assertEquals(copyRequest.getTimedTextLanguage(), null);
		System.assertEquals(copyRequest.getTimedTextTrackName(), null);
		System.assertEquals(copyRequest.getVisibility(), 'DEFAULT');
		
		copyRequest.setConvert(true).setOcr(true).setOcrLanguage('en-GB').setPinned(true)
				   .setTimedTextLanguage('en-US').setTimedTextTrackName('en-UK')
				   .setVisibility('PRIVATE');
		
		System.assertEquals(copyRequest.getConvert(), true);
		System.assertEquals(copyRequest.getOcr(), true);
		System.assertEquals(copyRequest.getOcrLanguage(), 'en-GB');
		System.assertEquals(copyRequest.getPinned(), true);
		System.assertEquals(copyRequest.getTimedTextLanguage(), 'en-US');
		System.assertEquals(copyRequest.getTimedTextTrackName(), 'en-UK');
		System.assertEquals(copyRequest.getVisibility(), 'PRIVATE');
	}
	 
	static testMethod void ffhttp_GoogleDriveFilesDeleteRequest()
	{
		ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
		ffhttp_GoogleDriveFiles.DeleteRequest deleteRequest = files.deleteRequest('0B94302Tka2HWkNrOElaaUxQaUU');
		assertRequestEndpointAndMethod(deleteRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU', 'DELETE');
	}
	
	static testMethod void ffhttp_GoogleDriveFilesListRequest()
	{
		ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
		ffhttp_GoogleDriveFiles.ListRequest listRequest = files.listRequest();
		assertRequestEndpointAndMethod(listRequest, 'https://www.googleapis.com/drive/v2/files/', 'GET');
		
		System.assertEquals(listRequest.getCorpus(), 'DEFAULT');
		System.assertEquals(listRequest.getMaxResults(), 100);
		System.assertEquals(listRequest.getPageToken(), null);
		System.assertEquals(listRequest.getQ(), null);
		System.assertEquals(listRequest.getFields(), null);

		listRequest.setCorpus('DOMAIN').setMaxResults(20).setPageToken('ghdjgh').setQ('title=\'Testing\'')
				   .setFields('items(id,title)');
				   
		System.assertEquals(listRequest.getCorpus(), 'DOMAIN');
		System.assertEquals(listRequest.getMaxResults(), 20);
		System.assertEquals(listRequest.getPageToken(), 'ghdjgh');
		System.assertEquals(listRequest.getQ(), 'title=\'Testing\'');
		System.assertEquals(listRequest.getFields(), 'items(id,title)');
	}
	
	static testMethod void ffhttp_GoogleDriveFilesTouchRequest()
	{
		ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
		ffhttp_GoogleDriveFiles.TouchRequest touchRequest = files.touchRequest('0B94302Tka2HWkNrOElaaUxQaUU');
		assertRequestEndpointAndMethod(touchRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/touch', 'POST');
	}
	
	static testMethod void ffhttp_GoogleDriveFilesTrashRequest()
	{
		ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
		ffhttp_GoogleDriveFiles.TrashRequest trashRequest = files.trashRequest('0B94302Tka2HWkNrOElaaUxQaUU');
		assertRequestEndpointAndMethod(trashRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/trash', 'POST');
	}
	
	static testMethod void ffhttp_GoogleDriveFilesUntrashRequest()
	{
		ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
		ffhttp_GoogleDriveFiles.UntrashRequest untrashRequest = files.untrashRequest('0B94302Tka2HWkNrOElaaUxQaUU');
		assertRequestEndpointAndMethod(untrashRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/untrash', 'POST');
	}
	 
	static testMethod void ffhttp_GoogleDriveFilesWatchRequest()
	{
		ffhttp_GoogleDriveModelWatch watch = new ffhttp_GoogleDriveModelWatch();
		
		ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
		ffhttp_GoogleDriveFiles.WatchRequest watchRequest = files.watchRequest('0B94302Tka2HWkNrOElaaUxQaUU', watch);
		assertRequestEndpointAndMethod(watchRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/watch', 'POST');
	}
	
	static testMethod void ffhttp_GoogleDriveFilesEmptyTrashRequest()
	{
		ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
		ffhttp_GoogleDriveFiles.EmptyTrashRequest emptyTrashRequest = files.emptyTrashRequest();
		assertRequestEndpointAndMethod(emptyTrashRequest, 'https://www.googleapis.com/drive/v2/files/trash', 'DELETE');
	}

	static testMethod void ffhttp_GoogleDriveFilesExportRequest()
	{
		ffhttp_GoogleDriveFiles files = createGoogleDriveFiles();
		ffhttp_GoogleDriveFiles.ExportRequest exportRequest = files.exportRequest('0B94302Tka2HWkNrOElaaUxQaUU');
		assertRequestEndpointAndMethod(exportRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/export', 'GET');
	
		System.assertEquals(exportRequest.getMimeType(), null);
		exportRequest.setMimeType('text/html');
		System.assertEquals(exportRequest.getMimeType(), 'text/html');
	}
	
	private static ffhttp_GoogleDrive createGoogleDrive()
	{
		return new ffhttp_GoogleDrive(new ffhttp_Client.AccessTokenCredentials('Bearer', 'Dummy Access Token'));
	}
	
	private static ffhttp_GoogleDriveFiles createGoogleDriveFiles()
	{
		ffhttp_GoogleDrive gd = createGoogleDrive();
		ffhttp_GoogleDriveFiles files = gd.files();
		System.assert(files != null, 'Files should not be null.');
		System.assertEquals(files.getService(), gd);
		
		files.setService(null);
		System.assertEquals(files.getService(), null);
		
		files.setService(gd);
		
		return files;
	}
	
	/**
	 * ffhttp_GoogleDriveAbout tests
	 */
	static testMethod void ffhttp_GoogleDriveAbout()
	{
		ffhttp_GoogleDrive gd = createGoogleDrive();
		ffhttp_GoogleDriveAbout about = gd.about();
		System.assert(about != null, 'About should not be null.');
		
		ffhttp_GoogleDriveAbout.GetRequest getRequest = about.getRequest();
		assertRequestEndpointAndMethod(getRequest, 'https://www.googleapis.com/drive/v2/about/', 'GET');
		
		System.assertEquals(getRequest.getIncludeSubscribed(), true);
		System.assertEquals(getRequest.getMaxChangeIdCount(), 1000);
		System.assertEquals(getRequest.getStartChangeId(), 0);

		getRequest.setIncludeSubscribed(false).setMaxChangeIdCount(500).setStartChangeId(10);
		
		System.assertEquals(getRequest.getIncludeSubscribed(), false);
		System.assertEquals(getRequest.getMaxChangeIdCount(), 500);
		System.assertEquals(getRequest.getStartChangeId(), 10);
	}
	
	/**
	 * ffhttp_GoogleDriveApps tests
	 */
	static testMethod void ffhttp_GoogleDriveAppsGetRequest()
	{
		ffhttp_GoogleDrive gd = createGoogleDrive();
		ffhttp_GoogleDriveApps apps = gd.apps();
		System.assert(apps != null, 'Apps should not be null.');
		
		ffhttp_GoogleDriveApps.GetRequest getRequest = apps.getRequest('6728679268');
		assertRequestEndpointAndMethod(getRequest, 'https://www.googleapis.com/drive/v2/apps/6728679268', 'GET');
	}
	
	static testMethod void ffhttp_GoogleDriveAppListRequest()
	{
		ffhttp_GoogleDrive gd = createGoogleDrive();
		ffhttp_GoogleDriveApps apps = gd.apps();
		System.assert(apps != null, 'Apps should not be null.');
		
		ffhttp_GoogleDriveApps.ListRequest listRequest = apps.listRequest();
		assertRequestEndpointAndMethod(listRequest, 'https://www.googleapis.com/drive/v2/apps/', 'GET');
		
		System.assertEquals(listRequest.getAppFilterExtensions(), null);
		System.assertEquals(listRequest.getAppFilterMimeTypes(), null);
		System.assertEquals(listRequest.getLanguageCode(), null);
		
		listRequest.setAppFilterExtensions('doc').setAppFilterMimeTypes('application/vnd.google-apps.drawing').setLanguageCode('en-GB');

		assertRequestEndpointAndMethod(listRequest, 'https://www.googleapis.com/drive/v2/apps/?appFilterExtensions=doc&appFilterMimeTypes=application%2Fvnd.google-apps.drawing&languageCode=en-GB', 'GET');
		
		System.assertEquals(listRequest.getAppFilterExtensions(), 'doc');
		System.assertEquals(listRequest.getAppFilterMimeTypes(), 'application/vnd.google-apps.drawing');
		System.assertEquals(listRequest.getLanguageCode(), 'en-GB');
	}
	
	/**
	 * ffhttp_GoogleDriveChanges tests
	 */
	static testMethod void ffhttp_GoogleDriveChangesGetRequest()
	{
		ffhttp_GoogleDriveChanges changes = createGoogleDriveChanges();
		ffhttp_GoogleDriveChanges.GetRequest getRequest = changes.getRequest('685');
		assertRequestEndpointAndMethod(getRequest, 'https://www.googleapis.com/drive/v2/changes/685', 'GET');
	}
	
	static testMethod void ffhttp_GoogleDriveChangesListRequest()
	{
		ffhttp_GoogleDriveChanges changes = createGoogleDriveChanges();
		ffhttp_GoogleDriveChanges.ListRequest listRequest = changes.listRequest();
		assertRequestEndpointAndMethod(listRequest, 'https://www.googleapis.com/drive/v2/changes/', 'GET');
	
		System.assertEquals(listRequest.getIncludeDeleted(), true);
		System.assertEquals(listRequest.getIncludeSubscribed(), true);
		System.assertEquals(listRequest.getMaxResults(), 100);
		System.assertEquals(listRequest.getPageToken(), null);
		System.assertEquals(listRequest.getStartChangeId(), null);
		
		listRequest.setIncludeDeleted(false).setIncludeSubscribed(false).setMaxResults(500)
				   .setPageToken('HE-ty7').setStartChangeId(100);
			
		System.assertEquals(listRequest.getIncludeDeleted(), false);
		System.assertEquals(listRequest.getIncludeSubscribed(), false);
		System.assertEquals(listRequest.getMaxResults(), 500);
		System.assertEquals(listRequest.getPageToken(), 'HE-ty7');
		System.assertEquals(listRequest.getStartChangeId(), 100);
	}
	
	static testMethod void ffhttp_GoogleDriveChangesWatchRequest()
	{
		ffhttp_GoogleDriveChanges changes = createGoogleDriveChanges();	
		ffhttp_GoogleDriveChanges.WatchRequest watchRequest = changes.watchRequest(new ffhttp_GoogleDriveModelWatch());
		assertRequestEndpointAndMethod(watchRequest, 'https://www.googleapis.com/drive/v2/changes/watch', 'POST');
	}
	
	private static ffhttp_GoogleDriveChanges createGoogleDriveChanges()
	{
		ffhttp_GoogleDrive gd = createGoogleDrive();
		ffhttp_GoogleDriveChanges changes = gd.changes();
		System.assert(changes != null, 'Changes should not be null.');

		return changes;
	}
	
	/**
	 * ffhttp_GoogleDriveChannels tests
	 */
	static testMethod void ffhttp_GoogleDriveChannelsStopRequest()
	{
		ffhttp_GoogleDrive gd = createGoogleDrive();
		ffhttp_GoogleDriveChannels channels = gd.channels();
		System.assert(channels != null, 'Channels should not be null.');
		
		ffhttp_GoogleDriveChannels.StopRequest stopRequest = channels.stopRequest(new ffhttp_GoogleDriveModelChannelStop());
		assertRequestEndpointAndMethod(stopRequest, 'https://www.googleapis.com/drive/v2/channels/stop', 'POST');
	}
	
	/**
	 * ffhttp_GoogleDriveChildren tests
	 */
	static testMethod void ffhttp_GoogleDriveChildrenDeleteRequest()
	{
		ffhttp_GoogleDriveChildren children = createGoogleDriveChildren();
		ffhttp_GoogleDriveChildren.DeleteRequest deleteRequest = children.deleteRequest('0B943_02Tka2HWkNrOElaaUxQaUU');
		assertRequestEndpointAndMethod(deleteRequest, 'https://www.googleapis.com/drive/v2/files/root/children/0B943_02Tka2HWkNrOElaaUxQaUU', 'DELETE');
	}
	
	static testMethod void ffhttp_GoogleDriveChildrenGetRequest()
	{
		ffhttp_GoogleDriveChildren children = createGoogleDriveChildren();
		ffhttp_GoogleDriveChildren.GetRequest getRequest = children.getRequest('0B943_02Tka2HWkNrOElaaUxQaUU');
		assertRequestEndpointAndMethod(getRequest, 'https://www.googleapis.com/drive/v2/files/root/children/0B943_02Tka2HWkNrOElaaUxQaUU', 'GET');
	}
	
	static testMethod void ffhttp_GoogleDriveChildrenInsertRequest()
	{
		ffhttp_GoogleDriveChildren children = createGoogleDriveChildren();
		ffhttp_GoogleDriveChildren.InsertRequest insertRequest = children.insertRequest(new ffhttp_GoogleDriveModelChild());
		assertRequestEndpointAndMethod(insertRequest, 'https://www.googleapis.com/drive/v2/files/root/children/', 'POST');
	}
	
	static testMethod void ffhttp_GoogleDriveChildrenListRequest()
	{
		ffhttp_GoogleDriveChildren children = createGoogleDriveChildren();
		
		ffhttp_GoogleDriveChildren.ListRequest listRequest = children.listRequest();
		assertRequestEndpointAndMethod(listRequest, 'https://www.googleapis.com/drive/v2/files/root/children/', 'GET');
		
		System.assertEquals(listRequest.getMaxResults(), 100);
		System.assertEquals(listRequest.getPageToken(), null);
		System.assertEquals(listRequest.getQ(), null);
		
		listRequest.setMaxResults(20).setPageToken('ghja55').setQ('title=\'Test\'');
		System.assertEquals(listRequest.getMaxResults(), 20);
		System.assertEquals(listRequest.getPageToken(), 'ghja55');
		System.assertEquals(listRequest.getQ(), 'title=\'Test\'');
	}
	
	private static ffhttp_GoogleDriveChildren createGoogleDriveChildren()
	{
		ffhttp_GoogleDriveModelFile folder = new ffhttp_GoogleDriveModelFile().setId('root');
		
		ffhttp_GoogleDrive gd = createGoogleDrive();
		ffhttp_GoogleDriveChildren children = gd.children();
		System.assert(children != null, 'Children should not be null.');
		System.assertEquals(children.getService(), gd);
		System.assertEquals(children.getFile(), null);
		
		children = new ffhttp_GoogleDriveChildren(gd);
		System.assert(children != null, 'Children should not be null.');
		System.assertEquals(children.getService(), gd);
		System.assertEquals(children.getFile(), null);
		
		children = new ffhttp_GoogleDriveChildren(gd, folder);
		System.assert(children != null, 'Children should not be null.');
		System.assertEquals(children.getService(), gd);
		System.assertEquals(children.getFile(), folder);
		
		return children;
	}
	
	/**
	 * ffhttp_GoogleDriveComments tests
	 */
	static testMethod void ffhttp_GoogleDriveCommentsDeleteRequest()
	{
		ffhttp_GoogleDriveComments comments = createGoogleDriveComments();
		ffhttp_GoogleDriveComments.DeleteRequest deleteRequest = comments.deleteRequest('AAAAALWnPkE');
		assertRequestEndpointAndMethod(deleteRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/comments/AAAAALWnPkE', 'DELETE');
	}
	
	static testMethod void ffhttp_GoogleDriveCommentsGetRequest()
	{
		ffhttp_GoogleDriveComments comments = createGoogleDriveComments();
		ffhttp_GoogleDriveComments.GetRequest getRequest = comments.getRequest('AAAAALWnPkE');
		assertRequestEndpointAndMethod(getRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/comments/AAAAALWnPkE', 'GET');
		
		System.assertEquals(getRequest.getIncludeDeleted(), false);
		getRequest.setIncludeDeleted(true);
		System.assertEquals(getRequest.getIncludeDeleted(), true);
	}
	
	static testMethod void ffhttp_GoogleDriveCommentsInsertRequest()
	{
		ffhttp_GoogleDriveComments comments = createGoogleDriveComments();
		ffhttp_GoogleDriveComments.InsertRequest insertRequest = comments.insertRequest(new ffhttp_GoogleDriveModelComment());
		assertRequestEndpointAndMethod(insertRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/comments/', 'POST');
	}
	
	static testMethod void ffhttp_GoogleDriveCommentsListRequest()
	{
		ffhttp_GoogleDriveComments comments = createGoogleDriveComments();
		ffhttp_GoogleDriveComments.ListRequest listRequest = comments.listRequest();
		assertRequestEndpointAndMethod(listRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/comments/', 'GET');
		
		System.assertEquals(listRequest.getIncludeDeleted(), false);
		System.assertEquals(listRequest.getMaxResults(), 20);
		System.assertEquals(listRequest.getPageToken(), null);
		System.assertEquals(listRequest.getUpdatedMin(), null);
		
		listRequest.setIncludeDeleted(true).setMaxResults(80).setPageToken('ghja55').setUpdatedMin('2014-10-16T15:36:50.381Z');
		System.assertEquals(listRequest.getIncludeDeleted(), true);
		System.assertEquals(listRequest.getMaxResults(), 80);
		System.assertEquals(listRequest.getPageToken(), 'ghja55');
		System.assertEquals(listRequest.getUpdatedMin(), '2014-10-16T15:36:50.381Z');
	}
	
	static testMethod void ffhttp_GoogleDriveCommentsUpdateRequest()
	{
		ffhttp_GoogleDriveModelComment comment = new ffhttp_GoogleDriveModelComment();
		comment.setCommentId('AAAAALWnPkG');
		
		ffhttp_GoogleDriveComments comments = createGoogleDriveComments();
		ffhttp_GoogleDriveComments.UpdateRequest updateRequest = comments.updateRequest(comment);
		assertRequestEndpointAndMethod(updateRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/comments/AAAAALWnPkG', 'PUT');
	}
	
	private static ffhttp_GoogleDriveComments createGoogleDriveComments()
	{
		ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
		file.setId('0B94302Tka2HWkNrOElaaUxQaUU');
		
		ffhttp_GoogleDrive gd = createGoogleDrive();
		ffhttp_GoogleDriveComments comments = gd.comments();
		System.assert(comments != null, 'Comments should not be null.');
		System.assertEquals(comments.getService(), gd);
		System.assertEquals(comments.getFile(), null);
		
		comments.setFile(file);
		System.assertEquals(comments.getFile(), file);
		
		comments = new ffhttp_GoogleDriveComments(gd);
		System.assert(comments != null, 'Comments should not be null.');
		System.assertEquals(comments.getService(), gd);
		System.assertEquals(comments.getFile(), null);
		
		comments = new ffhttp_GoogleDriveComments(gd, file);
		System.assert(comments != null, 'Comments should not be null.');
		System.assertEquals(comments.getService(), gd);
		System.assertEquals(comments.getFile(), file);
		
		return comments;
	}
	
	/**
	 * ffhttp_GoogleDriveParents tests
	 */
	static testMethod void ffhttp_GoogleDriveParentsDeleteRequest()
	{
		ffhttp_GoogleDriveParents parents = createGoogleDriveParents();
		ffhttp_GoogleDriveParents.DeleteRequest deleteRequest = parents.deleteRequest('AAAAALWnPkE');
		assertRequestEndpointAndMethod(deleteRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/parents/AAAAALWnPkE', 'DELETE');
	}
	
	static testMethod void ffhttp_GoogleDriveParentsGetRequest()
	{
		ffhttp_GoogleDriveParents parents = createGoogleDriveParents();
		ffhttp_GoogleDriveParents.GetRequest getRequest = parents.getRequest('AAAAALWnPkF');
		assertRequestEndpointAndMethod(getRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/parents/AAAAALWnPkF', 'GET');
	}
	
	static testMethod void ffhttp_GoogleDriveParentsInsertRequest()
	{
		ffhttp_GoogleDriveParents parents = createGoogleDriveParents();
		ffhttp_GoogleDriveParents.InsertRequest insertRequest = parents.insertRequest(new ffhttp_GoogleDriveModelParent());
		assertRequestEndpointAndMethod(insertRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/parents/', 'POST');
	}
	
	static testMethod void ffhttp_GoogleDriveParentsListRequest()
	{
		ffhttp_GoogleDriveParents parents = createGoogleDriveParents();
		ffhttp_GoogleDriveParents.ListRequest listRequest = parents.listRequest();
		assertRequestEndpointAndMethod(listRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/parents/', 'GET');
	}
	
	private static ffhttp_GoogleDriveParents createGoogleDriveParents()
	{
		ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
		file.setId('0B94302Tka2HWkNrOElaaUxQaUU');
		
		ffhttp_GoogleDrive gd = createGoogleDrive();
		ffhttp_GoogleDriveParents parents = gd.parents();
		System.assert(parents != null, 'Parents should not be null.');
		System.assertEquals(parents.getFile(), null);
		
		parents = new ffhttp_GoogleDriveParents(gd);
		System.assert(parents != null, 'Parents should not be null.');
		System.assertEquals(parents.getFile(), null);
		
		parents = new ffhttp_GoogleDriveParents(gd, file);
		System.assert(parents != null, 'Parents should not be null.');
		System.assertEquals(parents.getFile(), file);
		
		return parents;
	}
	
	/**
	 * ffhttp_GoogleDrivePermissions tests
	 */
	static testMethod void ffhttp_GoogleDrivePermissionsDeleteRequest()
	{
		ffhttp_GoogleDrivePermissions permissions = createGoogleDrivePermissions();
		ffhttp_GoogleDrivePermissions.DeleteRequest deleteRequest = permissions.deleteRequest('AAAAALWnPkF');
		assertRequestEndpointAndMethod(deleteRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/permissions/AAAAALWnPkF', 'DELETE');
	}
	
	static testMethod void ffhttp_GoogleDrivePermissionsGetRequest()
	{
		ffhttp_GoogleDrivePermissions permissions = createGoogleDrivePermissions();
		ffhttp_GoogleDrivePermissions.GetRequest getRequest = permissions.getRequest('AAAAALWnPkF');
		assertRequestEndpointAndMethod(getRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/permissions/AAAAALWnPkF', 'GET');
	}
	
	static testMethod void ffhttp_GoogleDrivePermissionsInsertRequest()
	{
		ffhttp_GoogleDriveModelPermission permission = new ffhttp_GoogleDriveModelPermission();
	
		ffhttp_GoogleDrivePermissions permissions = createGoogleDrivePermissions();
		ffhttp_GoogleDrivePermissions.InsertRequest insertRequest = permissions.insertRequest(permission);
		assertRequestEndpointAndMethod(insertRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/permissions/', 'POST');
		
		System.assertEquals(insertRequest.getEmailMessage(), null);
		System.assertEquals(insertRequest.getSendNotificationEmails(), true);
		
		insertRequest.setEmailMessage('Test Message').setSendNotificationEmails(false);
		System.assertEquals(insertRequest.getEmailMessage(), 'Test Message');
		System.assertEquals(insertRequest.getSendNotificationEmails(), false);
	}
	
	static testMethod void ffhttp_GoogleDrivePermissionsListRequest()
	{
		ffhttp_GoogleDrivePermissions permissions = createGoogleDrivePermissions();
		ffhttp_GoogleDrivePermissions.ListRequest listRequest = permissions.listRequest();
		assertRequestEndpointAndMethod(listRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/permissions/', 'GET');
	}
	
	static testMethod void ffhttp_GoogleDrivePermissionsUpdateRequest()
	{
		ffhttp_GoogleDriveModelPermission permission = new ffhttp_GoogleDriveModelPermission();
		
		ffhttp_GoogleDrivePermissions permissions = createGoogleDrivePermissions();
		ffhttp_GoogleDrivePermissions.UpdateRequest updateRequest = permissions.updateRequest(permission);
		assertRequestEndpointAndMethod(updateRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/permissions/', 'PUT');
		
		System.assertEquals(updateRequest.getTransferOwnership(), false);
		updateRequest.setTransferOwnership(true);
		System.assertEquals(updateRequest.getTransferOwnership(), true);
	}
	
	static testMethod void ffhttp_GoogleDrivePermissionsGetIdForEmailRequest()
	{
		ffhttp_GoogleDrivePermissions permissions = createGoogleDrivePermissions();
		ffhttp_GoogleDrivePermissions.GetIdForEmailRequest getIdForEmailRequest = permissions.getIdForEmailRequest('test@email.com');
		assertRequestEndpointAndMethod(getIdForEmailRequest, 'https://www.googleapis.com/drive/v2/permissionIds/test%40email.com', 'GET');
	}
	
	private static ffhttp_GoogleDrivePermissions createGoogleDrivePermissions()
	{
		ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
		file.setId('0B94302Tka2HWkNrOElaaUxQaUU');
		
		ffhttp_GoogleDrive gd = createGoogleDrive();
		ffhttp_GoogleDrivePermissions permissions = gd.permissions();
		System.assert(permissions != null, 'Permissions should not be null.');
		System.assertEquals(permissions.getService(), gd);
		System.assertEquals(permissions.getFile(), null);
		
		permissions.setFile(file);
		System.assertEquals(permissions.getFile(), file);
		
		permissions = new ffhttp_GoogleDrivePermissions(gd);
		System.assert(permissions != null, 'Permissions should not be null.');
		System.assertEquals(permissions.getService(), gd);
		System.assertEquals(permissions.getFile(), null);
		
		permissions = new ffhttp_GoogleDrivePermissions(gd, file);
		System.assert(permissions != null, 'Permissions should not be null.');
		System.assertEquals(permissions.getService(), gd);
		System.assertEquals(permissions.getFile(), file);
		
		return permissions;
	}
	
	/**
	 * ffhttp_GoogleDriveProperties tests
	 */
	static testMethod void ffhttp_GoogleDrivePropertiesDeleteRequest()
	{
		ffhttp_GoogleDriveProperties properties = createGoogleDriveProperties();
		ffhttp_GoogleDriveProperties.DeleteRequest deleteRequest = properties.deleteRequest('Key');
		assertRequestEndpointAndMethod(deleteRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/properties/Key', 'DELETE');
	
		System.assertEquals(deleteRequest.getVisibility(), null);
		
		deleteRequest.setVisibility('PUBLIC');
		
		System.assertEquals(deleteRequest.getVisibility(), 'PUBLIC');
	}
	
	static testMethod void ffhttp_GoogleDrivePropertiesGetRequest()
	{
		ffhttp_GoogleDriveProperties properties = createGoogleDriveProperties();
		ffhttp_GoogleDriveProperties.GetRequest getRequest = properties.getRequest('Key');
		assertRequestEndpointAndMethod(getRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/properties/Key', 'GET');
	
		System.assertEquals(getRequest.getVisibility(), null);
		
		getRequest.setVisibility('PUBLIC');
		
		System.assertEquals(getRequest.getVisibility(), 'PUBLIC');
	}
	
	static testMethod void ffhttp_GoogleDrivePropertiesInsertRequest()
	{
		ffhttp_GoogleDriveModelProperty property = new ffhttp_GoogleDriveModelProperty();
	
		ffhttp_GoogleDriveProperties properties = createGoogleDriveProperties();
		ffhttp_GoogleDriveProperties.InsertRequest insertRequest = properties.insertRequest(property);
		assertRequestEndpointAndMethod(insertRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/properties/', 'POST');
	}
	
	static testMethod void ffhttp_GoogleDrivePropertiesListRequest()
	{
		ffhttp_GoogleDriveProperties properties = createGoogleDriveProperties();
		ffhttp_GoogleDriveProperties.ListRequest listRequest = properties.listRequest();
		assertRequestEndpointAndMethod(listRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/properties/', 'GET');
	}
	
	static testMethod void ffhttp_GoogleDrivePropertiesUpdateRequest()
	{
		ffhttp_GoogleDriveModelProperty property = new ffhttp_GoogleDriveModelProperty();
		property.setKey('AAAAALWnPkE');
		
		ffhttp_GoogleDriveProperties properties = createGoogleDriveProperties();
		ffhttp_GoogleDriveProperties.UpdateRequest updateRequest = properties.updateRequest(property);
		assertRequestEndpointAndMethod(updateRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/properties/AAAAALWnPkE', 'PUT');
	
		System.assertEquals(updateRequest.getVisibility(), null);
		
		updateRequest.setVisibility('PUBLIC');
		
		System.assertEquals(updateRequest.getVisibility(), 'PUBLIC');
	}
	
	private static ffhttp_GoogleDriveProperties createGoogleDriveProperties()
	{
		ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
		file.setId('0B94302Tka2HWkNrOElaaUxQaUU');
		
		ffhttp_GoogleDrive gd = createGoogleDrive();
		ffhttp_GoogleDriveProperties properties = gd.properties();
		System.assert(properties != null, 'Properties should not be null.');
		System.assertEquals(properties.getService(), gd);
		System.assertEquals(properties.getFile(), null);
		
		properties.setFile(file);
		System.assertEquals(properties.getFile(), file);
		
		properties = new ffhttp_GoogleDriveProperties(gd);
		System.assert(properties != null, 'Properties should not be null.');
		System.assertEquals(properties.getService(), gd);
		System.assertEquals(properties.getFile(), null);
		
		properties = new ffhttp_GoogleDriveProperties(gd, file);
		System.assert(properties != null, 'Properties should not be null.');
		System.assertEquals(properties.getService(), gd);
		System.assertEquals(properties.getFile(), file);
		
		return properties;
	}
	
	/**
	 * ffhttp_GoogleDriveReplies tests
	 */
	static testMethod void ffhttp_GoogleDriveRepliesDeleteRequest()
	{
		ffhttp_GoogleDriveReplies replies = createGoogleDriveReplies();
		ffhttp_GoogleDriveReplies.DeleteRequest deleteRequest = replies.deleteRequest('AAAAALWnPkE');
		assertRequestEndpointAndMethod(deleteRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/comments/AAAAALWnPkF/replies/AAAAALWnPkE', 'DELETE');
	}
	
	static testMethod void ffhttp_GoogleDriveRepliesGetRequest()
	{
		ffhttp_GoogleDriveReplies replies = createGoogleDriveReplies();
		ffhttp_GoogleDriveReplies.GetRequest getRequest = replies.getRequest('AAAAALWnPkE');
		assertRequestEndpointAndMethod(getRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/comments/AAAAALWnPkF/replies/AAAAALWnPkE', 'GET');
		
		System.assertEquals(getRequest.getIncludeDeleted(), false);
		getRequest.setIncludeDeleted(true);
		System.assertEquals(getRequest.getIncludeDeleted(), true);
	}
	
	static testMethod void ffhttp_GoogleDriveRepliesInsertRequest()
	{
		ffhttp_GoogleDriveModelReply reply = new ffhttp_GoogleDriveModelReply();
		reply.setReplyId('BBBBBLWnPkG');
		
		ffhttp_GoogleDriveReplies replies = createGoogleDriveReplies();
		ffhttp_GoogleDriveReplies.InsertRequest insertRequest = replies.insertRequest(reply);
		assertRequestEndpointAndMethod(insertRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/comments/AAAAALWnPkF/replies/', 'POST');
	}
	
	static testMethod void ffhttp_GoogleDriveRepliesListRequest()
	{
		ffhttp_GoogleDriveReplies replies = createGoogleDriveReplies();
		ffhttp_GoogleDriveReplies.ListRequest listRequest = replies.listRequest();
		assertRequestEndpointAndMethod(listRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/comments/AAAAALWnPkF/replies/', 'GET');
		
		System.assertEquals(listRequest.getIncludeDeleted(), false);
		System.assertEquals(listRequest.getMaxResults(), 20);
		System.assertEquals(listRequest.getPageToken(), null);
		
		listRequest.setIncludeDeleted(true).setMaxResults(80).setPageToken('ghja55');
		System.assertEquals(listRequest.getIncludeDeleted(), true);
		System.assertEquals(listRequest.getMaxResults(), 80);
		System.assertEquals(listRequest.getPageToken(), 'ghja55');
	}
	
	static testMethod void ffhttp_GoogleDriveRepliesUpdateRequest()
	{
		ffhttp_GoogleDriveModelReply reply = new ffhttp_GoogleDriveModelReply();
		reply.setReplyId('BBBBBLWnPkG');
		
		ffhttp_GoogleDriveReplies replies = createGoogleDriveReplies();
		ffhttp_GoogleDriveReplies.UpdateRequest updateRequest = replies.updateRequest(reply);
		assertRequestEndpointAndMethod(updateRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/comments/AAAAALWnPkF/replies/BBBBBLWnPkG', 'PUT');
	}
	
	private static ffhttp_GoogleDriveReplies createGoogleDriveReplies()
	{
		ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
		file.setId('0B94302Tka2HWkNrOElaaUxQaUU');
		
		ffhttp_GoogleDriveModelComment comment = new ffhttp_GoogleDriveModelComment();
		comment.setCommentId('AAAAALWnPkF');
		
		ffhttp_GoogleDrive gd = createGoogleDrive();
		ffhttp_GoogleDriveReplies replies = gd.replies();
		System.assert(replies != null, 'Replies should not be null.');
		System.assertEquals(replies.getService(), gd);
		System.assertEquals(replies.getFile(), null);
		System.assertEquals(replies.getComment(), null);
		
		replies.setFile(file);
		System.assertEquals(replies.getFile(), file);
		System.assertEquals(replies.getComment(), null);
		
		replies.setComment(comment);
		System.assertEquals(replies.getFile(), file);
		System.assertEquals(replies.getComment(), comment);
		
		replies = new ffhttp_GoogleDriveReplies(gd);
		System.assert(replies != null, 'Replies should not be null.');
		System.assertEquals(replies.getService(), gd);
		System.assertEquals(replies.getFile(), null);
		System.assertEquals(replies.getComment(), null);
		
		replies = new ffhttp_GoogleDriveReplies(gd, file);
		System.assert(replies != null, 'Replies should not be null.');
		System.assertEquals(replies.getService(), gd);
		System.assertEquals(replies.getFile(), file);
		System.assertEquals(replies.getComment(), null);
		
	 	replies = new ffhttp_GoogleDriveReplies(gd, file, comment);
		System.assert(replies != null, 'Replies should not be null.');
		System.assertEquals(replies.getService(), gd);
		System.assertEquals(replies.getFile(), file);
		System.assertEquals(replies.getComment(), comment);
		
		return replies;
	}
	
	/**
	 * ffhttp_GoogleDriveRevisions tests
	 */
	static testMethod void ffhttp_GoogleDriveRevisionsDeleteRequest()
	{
		ffhttp_GoogleDriveRevisions revisions = createGoogleDriveRevisions();
		ffhttp_GoogleDriveRevisions.DeleteRequest deleteRequest = revisions.deleteRequest('AAAAALWnPkE');
		assertRequestEndpointAndMethod(deleteRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/revisions/AAAAALWnPkE', 'DELETE');
	}
	
	static testMethod void ffhttp_GoogleDriveRevisionsGetRequest()
	{
		ffhttp_GoogleDriveRevisions revisions = createGoogleDriveRevisions();
		ffhttp_GoogleDriveRevisions.GetRequest getRequest = revisions.getRequest('AAAAALWnPkE');
		assertRequestEndpointAndMethod(getRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/revisions/AAAAALWnPkE', 'GET');
	}
	
	static testMethod void ffhttp_GoogleDriveRevisionsListRequest()
	{
		ffhttp_GoogleDriveRevisions revisions = createGoogleDriveRevisions();
		ffhttp_GoogleDriveRevisions.ListRequest listRequest = revisions.listRequest();
		assertRequestEndpointAndMethod(listRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/revisions/', 'GET');
	}
	
	static testMethod void ffhttp_GoogleDriveRevisionsUpdateRequest()
	{
		ffhttp_GoogleDriveModelRevision revision = new ffhttp_GoogleDriveModelRevision();
		revision.setId('BBBBBLWnPkG');
		
		ffhttp_GoogleDriveRevisions revisions = createGoogleDriveRevisions();
		ffhttp_GoogleDriveRevisions.UpdateRequest updateRequest = revisions.updateRequest(revision);
		assertRequestEndpointAndMethod(updateRequest, 'https://www.googleapis.com/drive/v2/files/0B94302Tka2HWkNrOElaaUxQaUU/revisions/BBBBBLWnPkG', 'PUT');
	}
	
	private static ffhttp_GoogleDriveRevisions createGoogleDriveRevisions()
	{
		ffhttp_GoogleDriveModelFile file = new ffhttp_GoogleDriveModelFile();
		file.setId('0B94302Tka2HWkNrOElaaUxQaUU');
		
		ffhttp_GoogleDrive gd = createGoogleDrive();
		ffhttp_GoogleDriveRevisions revisions = gd.revisions();
		System.assert(revisions != null, 'Revisions should not be null.');
		System.assertEquals(revisions.getService(), gd);
		System.assertEquals(revisions.getFile(), null);
		
		revisions.setFile(file);
		System.assertEquals(revisions.getFile(), file);
		
		revisions = new ffhttp_GoogleDriveRevisions(gd);
		System.assert(revisions != null, 'Revisions should not be null.');
		System.assertEquals(revisions.getService(), gd);
		System.assertEquals(revisions.getFile(), null);
		
		revisions = new ffhttp_GoogleDriveRevisions(gd, file);
		System.assert(revisions != null, 'Revisions should not be null.');
		System.assertEquals(revisions.getService(), gd);
		System.assertEquals(revisions.getFile(), file);
		
		return revisions;
	}
	
	private static void assertRequestEndpointAndMethod(ffhttp_GoogleDriveResource.GoogleDriveRequest request, 
													   String endpoint, String method)
	{
		System.HttpRequest httpRequest = request.buildHttpRequest();
		System.assertEquals(httpRequest.getEndpoint(), endpoint);
		System.assertEquals(httpRequest.getMethod(), method);
	}
}
