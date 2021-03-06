{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Route53.ListTrafficPolicyInstancesByHostedZone
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Gets information about the traffic policy instances that you created in a specified hosted zone.
--
--
-- Send a @GET@ request to the @//Amazon Route 53 API version/ /trafficpolicyinstance@ resource and include the ID of the hosted zone.
--
-- Amazon Route 53 returns a maximum of 100 items in each response. If you have a lot of traffic policy instances, you can use the @MaxItems@ parameter to list them in groups of up to 100.
--
-- The response includes four values that help you navigate from one group of @MaxItems@ traffic policy instances to the next:
--
--     * __IsTruncated__
--
-- If the value of IsTruncated in the response is @true@ , there are more traffic policy instances associated with the current AWS account.
--
-- If @IsTruncated@ is @false@ , this response includes the last traffic policy instance that is associated with the current account.
--
--     * __MaxItems__
--
-- The value that you specified for the @MaxItems@ parameter in the request that produced the current response.
--
--     * __TrafficPolicyInstanceNameMarker__ and __TrafficPolicyInstanceTypeMarker__
--
-- If @IsTruncated@ is @true@ , these two values in the response represent the first traffic policy instance in the next group of @MaxItems@ traffic policy instances. To list more traffic policy instances, make another call to @ListTrafficPolicyInstancesByHostedZone@ , and specify these values in the corresponding request parameters.
--
-- If @IsTruncated@ is @false@ , all three elements are omitted from the response.
--
--
--
module Network.AWS.Route53.ListTrafficPolicyInstancesByHostedZone
    (
    -- * Creating a Request
      listTrafficPolicyInstancesByHostedZone
    , ListTrafficPolicyInstancesByHostedZone
    -- * Request Lenses
    , ltpibhzTrafficPolicyInstanceTypeMarker
    , ltpibhzMaxItems
    , ltpibhzTrafficPolicyInstanceNameMarker
    , ltpibhzHostedZoneId

    -- * Destructuring the Response
    , listTrafficPolicyInstancesByHostedZoneResponse
    , ListTrafficPolicyInstancesByHostedZoneResponse
    -- * Response Lenses
    , ltpibhzrsTrafficPolicyInstanceTypeMarker
    , ltpibhzrsTrafficPolicyInstanceNameMarker
    , ltpibhzrsResponseStatus
    , ltpibhzrsTrafficPolicyInstances
    , ltpibhzrsIsTruncated
    , ltpibhzrsMaxItems
    ) where

import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.Route53.Types
import           Network.AWS.Route53.Types.Product

-- | A request for the traffic policy instances that you created in a specified hosted zone.
--
--
--
-- /See:/ 'listTrafficPolicyInstancesByHostedZone' smart constructor.
data ListTrafficPolicyInstancesByHostedZone = ListTrafficPolicyInstancesByHostedZone'
    { _ltpibhzTrafficPolicyInstanceTypeMarker :: !(Maybe RecordType)
    , _ltpibhzMaxItems                        :: !(Maybe Text)
    , _ltpibhzTrafficPolicyInstanceNameMarker :: !(Maybe Text)
    , _ltpibhzHostedZoneId                    :: !ResourceId
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ListTrafficPolicyInstancesByHostedZone' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ltpibhzTrafficPolicyInstanceTypeMarker' - For the first request to @ListTrafficPolicyInstancesByHostedZone@ , omit this value. If the value of @IsTruncated@ in the previous response was @true@ , @TrafficPolicyInstanceTypeMarker@ is the DNS type of the first traffic policy instance in the next group of @MaxItems@ traffic policy instances. If the value of @IsTruncated@ in the previous response was @false@ , there are no more traffic policy instances to get for this hosted zone.
--
-- * 'ltpibhzMaxItems' - The maximum number of traffic policy instances to be included in the response body for this request. If you have more than @MaxItems@ traffic policy instances, the value of the @IsTruncated@ element in the response is @true@ , and the values of @HostedZoneIdMarker@ , @TrafficPolicyInstanceNameMarker@ , and @TrafficPolicyInstanceTypeMarker@ represent the first traffic policy instance in the next group of @MaxItems@ traffic policy instances.
--
-- * 'ltpibhzTrafficPolicyInstanceNameMarker' - For the first request to @ListTrafficPolicyInstancesByHostedZone@ , omit this value. If the value of @IsTruncated@ in the previous response was @true@ , @TrafficPolicyInstanceNameMarker@ is the name of the first traffic policy instance in the next group of @MaxItems@ traffic policy instances. If the value of @IsTruncated@ in the previous response was @false@ , there are no more traffic policy instances to get for this hosted zone. If the value of @IsTruncated@ in the previous response was @false@ , omit this value.
--
-- * 'ltpibhzHostedZoneId' - The ID of the hosted zone for which you want to list traffic policy instances.
listTrafficPolicyInstancesByHostedZone
    :: ResourceId -- ^ 'ltpibhzHostedZoneId'
    -> ListTrafficPolicyInstancesByHostedZone
listTrafficPolicyInstancesByHostedZone pHostedZoneId_ =
    ListTrafficPolicyInstancesByHostedZone'
    { _ltpibhzTrafficPolicyInstanceTypeMarker = Nothing
    , _ltpibhzMaxItems = Nothing
    , _ltpibhzTrafficPolicyInstanceNameMarker = Nothing
    , _ltpibhzHostedZoneId = pHostedZoneId_
    }

-- | For the first request to @ListTrafficPolicyInstancesByHostedZone@ , omit this value. If the value of @IsTruncated@ in the previous response was @true@ , @TrafficPolicyInstanceTypeMarker@ is the DNS type of the first traffic policy instance in the next group of @MaxItems@ traffic policy instances. If the value of @IsTruncated@ in the previous response was @false@ , there are no more traffic policy instances to get for this hosted zone.
ltpibhzTrafficPolicyInstanceTypeMarker :: Lens' ListTrafficPolicyInstancesByHostedZone (Maybe RecordType)
ltpibhzTrafficPolicyInstanceTypeMarker = lens _ltpibhzTrafficPolicyInstanceTypeMarker (\ s a -> s{_ltpibhzTrafficPolicyInstanceTypeMarker = a});

-- | The maximum number of traffic policy instances to be included in the response body for this request. If you have more than @MaxItems@ traffic policy instances, the value of the @IsTruncated@ element in the response is @true@ , and the values of @HostedZoneIdMarker@ , @TrafficPolicyInstanceNameMarker@ , and @TrafficPolicyInstanceTypeMarker@ represent the first traffic policy instance in the next group of @MaxItems@ traffic policy instances.
ltpibhzMaxItems :: Lens' ListTrafficPolicyInstancesByHostedZone (Maybe Text)
ltpibhzMaxItems = lens _ltpibhzMaxItems (\ s a -> s{_ltpibhzMaxItems = a});

-- | For the first request to @ListTrafficPolicyInstancesByHostedZone@ , omit this value. If the value of @IsTruncated@ in the previous response was @true@ , @TrafficPolicyInstanceNameMarker@ is the name of the first traffic policy instance in the next group of @MaxItems@ traffic policy instances. If the value of @IsTruncated@ in the previous response was @false@ , there are no more traffic policy instances to get for this hosted zone. If the value of @IsTruncated@ in the previous response was @false@ , omit this value.
ltpibhzTrafficPolicyInstanceNameMarker :: Lens' ListTrafficPolicyInstancesByHostedZone (Maybe Text)
ltpibhzTrafficPolicyInstanceNameMarker = lens _ltpibhzTrafficPolicyInstanceNameMarker (\ s a -> s{_ltpibhzTrafficPolicyInstanceNameMarker = a});

-- | The ID of the hosted zone for which you want to list traffic policy instances.
ltpibhzHostedZoneId :: Lens' ListTrafficPolicyInstancesByHostedZone ResourceId
ltpibhzHostedZoneId = lens _ltpibhzHostedZoneId (\ s a -> s{_ltpibhzHostedZoneId = a});

instance AWSRequest
         ListTrafficPolicyInstancesByHostedZone where
        type Rs ListTrafficPolicyInstancesByHostedZone =
             ListTrafficPolicyInstancesByHostedZoneResponse
        request = get route53
        response
          = receiveXML
              (\ s h x ->
                 ListTrafficPolicyInstancesByHostedZoneResponse' <$>
                   (x .@? "TrafficPolicyInstanceTypeMarker") <*>
                     (x .@? "TrafficPolicyInstanceNameMarker")
                     <*> (pure (fromEnum s))
                     <*>
                     (x .@? "TrafficPolicyInstances" .!@ mempty >>=
                        parseXMLList "TrafficPolicyInstance")
                     <*> (x .@ "IsTruncated")
                     <*> (x .@ "MaxItems"))

instance Hashable
         ListTrafficPolicyInstancesByHostedZone

instance NFData
         ListTrafficPolicyInstancesByHostedZone

instance ToHeaders
         ListTrafficPolicyInstancesByHostedZone where
        toHeaders = const mempty

instance ToPath
         ListTrafficPolicyInstancesByHostedZone where
        toPath
          = const
              "/2013-04-01/trafficpolicyinstances/hostedzone"

instance ToQuery
         ListTrafficPolicyInstancesByHostedZone where
        toQuery ListTrafficPolicyInstancesByHostedZone'{..}
          = mconcat
              ["trafficpolicyinstancetype" =:
                 _ltpibhzTrafficPolicyInstanceTypeMarker,
               "maxitems" =: _ltpibhzMaxItems,
               "trafficpolicyinstancename" =:
                 _ltpibhzTrafficPolicyInstanceNameMarker,
               "id" =: _ltpibhzHostedZoneId]

-- | A complex type that contains the response information for the request.
--
--
--
-- /See:/ 'listTrafficPolicyInstancesByHostedZoneResponse' smart constructor.
data ListTrafficPolicyInstancesByHostedZoneResponse = ListTrafficPolicyInstancesByHostedZoneResponse'
    { _ltpibhzrsTrafficPolicyInstanceTypeMarker :: !(Maybe RecordType)
    , _ltpibhzrsTrafficPolicyInstanceNameMarker :: !(Maybe Text)
    , _ltpibhzrsResponseStatus                  :: !Int
    , _ltpibhzrsTrafficPolicyInstances          :: ![TrafficPolicyInstance]
    , _ltpibhzrsIsTruncated                     :: !Bool
    , _ltpibhzrsMaxItems                        :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ListTrafficPolicyInstancesByHostedZoneResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ltpibhzrsTrafficPolicyInstanceTypeMarker' - If @IsTruncated@ is true, @TrafficPolicyInstanceTypeMarker@ is the DNS type of the resource record sets that are associated with the first traffic policy instance in the next group of @MaxItems@ traffic policy instances.
--
-- * 'ltpibhzrsTrafficPolicyInstanceNameMarker' - If @IsTruncated@ is @true@ , @TrafficPolicyInstanceNameMarker@ is the name of the first traffic policy instance in the next group of @MaxItems@ traffic policy instances.
--
-- * 'ltpibhzrsResponseStatus' - -- | The response status code.
--
-- * 'ltpibhzrsTrafficPolicyInstances' - A list that contains one @TrafficPolicyInstance@ element for each traffic policy instance that matches the elements in the request.
--
-- * 'ltpibhzrsIsTruncated' - A flag that indicates whether there are more traffic policy instances to be listed. If the response was truncated, you can get the next group of @MaxItems@ traffic policy instances by calling @ListTrafficPolicyInstancesByHostedZone@ again and specifying the values of the @HostedZoneIdMarker@ , @TrafficPolicyInstanceNameMarker@ , and @TrafficPolicyInstanceTypeMarker@ elements in the corresponding request parameters.
--
-- * 'ltpibhzrsMaxItems' - The value that you specified for the @MaxItems@ parameter in the call to @ListTrafficPolicyInstancesByHostedZone@ that produced the current response.
listTrafficPolicyInstancesByHostedZoneResponse
    :: Int -- ^ 'ltpibhzrsResponseStatus'
    -> Bool -- ^ 'ltpibhzrsIsTruncated'
    -> Text -- ^ 'ltpibhzrsMaxItems'
    -> ListTrafficPolicyInstancesByHostedZoneResponse
listTrafficPolicyInstancesByHostedZoneResponse pResponseStatus_ pIsTruncated_ pMaxItems_ =
    ListTrafficPolicyInstancesByHostedZoneResponse'
    { _ltpibhzrsTrafficPolicyInstanceTypeMarker = Nothing
    , _ltpibhzrsTrafficPolicyInstanceNameMarker = Nothing
    , _ltpibhzrsResponseStatus = pResponseStatus_
    , _ltpibhzrsTrafficPolicyInstances = mempty
    , _ltpibhzrsIsTruncated = pIsTruncated_
    , _ltpibhzrsMaxItems = pMaxItems_
    }

-- | If @IsTruncated@ is true, @TrafficPolicyInstanceTypeMarker@ is the DNS type of the resource record sets that are associated with the first traffic policy instance in the next group of @MaxItems@ traffic policy instances.
ltpibhzrsTrafficPolicyInstanceTypeMarker :: Lens' ListTrafficPolicyInstancesByHostedZoneResponse (Maybe RecordType)
ltpibhzrsTrafficPolicyInstanceTypeMarker = lens _ltpibhzrsTrafficPolicyInstanceTypeMarker (\ s a -> s{_ltpibhzrsTrafficPolicyInstanceTypeMarker = a});

-- | If @IsTruncated@ is @true@ , @TrafficPolicyInstanceNameMarker@ is the name of the first traffic policy instance in the next group of @MaxItems@ traffic policy instances.
ltpibhzrsTrafficPolicyInstanceNameMarker :: Lens' ListTrafficPolicyInstancesByHostedZoneResponse (Maybe Text)
ltpibhzrsTrafficPolicyInstanceNameMarker = lens _ltpibhzrsTrafficPolicyInstanceNameMarker (\ s a -> s{_ltpibhzrsTrafficPolicyInstanceNameMarker = a});

-- | -- | The response status code.
ltpibhzrsResponseStatus :: Lens' ListTrafficPolicyInstancesByHostedZoneResponse Int
ltpibhzrsResponseStatus = lens _ltpibhzrsResponseStatus (\ s a -> s{_ltpibhzrsResponseStatus = a});

-- | A list that contains one @TrafficPolicyInstance@ element for each traffic policy instance that matches the elements in the request.
ltpibhzrsTrafficPolicyInstances :: Lens' ListTrafficPolicyInstancesByHostedZoneResponse [TrafficPolicyInstance]
ltpibhzrsTrafficPolicyInstances = lens _ltpibhzrsTrafficPolicyInstances (\ s a -> s{_ltpibhzrsTrafficPolicyInstances = a}) . _Coerce;

-- | A flag that indicates whether there are more traffic policy instances to be listed. If the response was truncated, you can get the next group of @MaxItems@ traffic policy instances by calling @ListTrafficPolicyInstancesByHostedZone@ again and specifying the values of the @HostedZoneIdMarker@ , @TrafficPolicyInstanceNameMarker@ , and @TrafficPolicyInstanceTypeMarker@ elements in the corresponding request parameters.
ltpibhzrsIsTruncated :: Lens' ListTrafficPolicyInstancesByHostedZoneResponse Bool
ltpibhzrsIsTruncated = lens _ltpibhzrsIsTruncated (\ s a -> s{_ltpibhzrsIsTruncated = a});

-- | The value that you specified for the @MaxItems@ parameter in the call to @ListTrafficPolicyInstancesByHostedZone@ that produced the current response.
ltpibhzrsMaxItems :: Lens' ListTrafficPolicyInstancesByHostedZoneResponse Text
ltpibhzrsMaxItems = lens _ltpibhzrsMaxItems (\ s a -> s{_ltpibhzrsMaxItems = a});

instance NFData
         ListTrafficPolicyInstancesByHostedZoneResponse
