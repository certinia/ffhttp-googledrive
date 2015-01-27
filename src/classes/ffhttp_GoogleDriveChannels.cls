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
 * ffhttp_GoogleDriveChannels
 *
 * Class to encapsulate all the Google Drive Channels API calls.
 * https://developers.google.com/drive/v2/reference/#Channels
 */
public with sharing class ffhttp_GoogleDriveChannels extends ffhttp_GoogleDriveResource
{
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @return Access to the Channels API calls.
	 */
	public ffhttp_GoogleDriveChannels(ffhttp_GoogleDrive service) 
	{
		super(service);
	}
	
	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	 
	/**
     * Stop watching resources through this channel
     *
     * Create a request for the method "channels.stop".
     *
     * @param channelStop The {@link ffhttp_GoogleDriveModelChannelStop}.
     * @return the request
     */
	public StopRequest stopRequest(ffhttp_GoogleDriveModelChannelStop channelStop)
	{
		return new StopRequest(this, channelStop);
	}
		
	/*********************************************************************************************************
	 * API Callout Inner Classes
	 *********************************************************************************************************/
	
	public class StopRequest extends GoogleDriveRequest
	{
		StopRequest(ffhttp_GoogleDriveChannels channels, ffhttp_GoogleDriveModelChannelStop channelStop)
		{
			super(channels, METADATA_ENDPOINT, ENDPOINT_CHANNELS + COMMAND_STOP, REQUEST_METHOD_POST, channelStop, null);
		}
	}
}
