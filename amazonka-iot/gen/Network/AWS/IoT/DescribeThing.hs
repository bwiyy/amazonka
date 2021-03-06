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
-- Module      : Network.AWS.IoT.DescribeThing
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Gets information about the specified thing.
--
--
module Network.AWS.IoT.DescribeThing
    (
    -- * Creating a Request
      describeThing
    , DescribeThing
    -- * Request Lenses
    , dThingName

    -- * Destructuring the Response
    , describeThingResponse
    , DescribeThingResponse
    -- * Response Lenses
    , dtrsDefaultClientId
    , dtrsThingTypeName
    , dtrsAttributes
    , dtrsVersion
    , dtrsThingName
    , dtrsResponseStatus
    ) where

import           Network.AWS.IoT.Types
import           Network.AWS.IoT.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | The input for the DescribeThing operation.
--
--
--
-- /See:/ 'describeThing' smart constructor.
newtype DescribeThing = DescribeThing'
    { _dThingName :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DescribeThing' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dThingName' - The name of the thing.
describeThing
    :: Text -- ^ 'dThingName'
    -> DescribeThing
describeThing pThingName_ =
    DescribeThing'
    { _dThingName = pThingName_
    }

-- | The name of the thing.
dThingName :: Lens' DescribeThing Text
dThingName = lens _dThingName (\ s a -> s{_dThingName = a});

instance AWSRequest DescribeThing where
        type Rs DescribeThing = DescribeThingResponse
        request = get ioT
        response
          = receiveJSON
              (\ s h x ->
                 DescribeThingResponse' <$>
                   (x .?> "defaultClientId") <*> (x .?> "thingTypeName")
                     <*> (x .?> "attributes" .!@ mempty)
                     <*> (x .?> "version")
                     <*> (x .?> "thingName")
                     <*> (pure (fromEnum s)))

instance Hashable DescribeThing

instance NFData DescribeThing

instance ToHeaders DescribeThing where
        toHeaders = const mempty

instance ToPath DescribeThing where
        toPath DescribeThing'{..}
          = mconcat ["/things/", toBS _dThingName]

instance ToQuery DescribeThing where
        toQuery = const mempty

-- | The output from the DescribeThing operation.
--
--
--
-- /See:/ 'describeThingResponse' smart constructor.
data DescribeThingResponse = DescribeThingResponse'
    { _dtrsDefaultClientId :: !(Maybe Text)
    , _dtrsThingTypeName   :: !(Maybe Text)
    , _dtrsAttributes      :: !(Maybe (Map Text Text))
    , _dtrsVersion         :: !(Maybe Integer)
    , _dtrsThingName       :: !(Maybe Text)
    , _dtrsResponseStatus  :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DescribeThingResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dtrsDefaultClientId' - The default client ID.
--
-- * 'dtrsThingTypeName' - The thing type name.
--
-- * 'dtrsAttributes' - The thing attributes.
--
-- * 'dtrsVersion' - The current version of the thing record in the registry.
--
-- * 'dtrsThingName' - The name of the thing.
--
-- * 'dtrsResponseStatus' - -- | The response status code.
describeThingResponse
    :: Int -- ^ 'dtrsResponseStatus'
    -> DescribeThingResponse
describeThingResponse pResponseStatus_ =
    DescribeThingResponse'
    { _dtrsDefaultClientId = Nothing
    , _dtrsThingTypeName = Nothing
    , _dtrsAttributes = Nothing
    , _dtrsVersion = Nothing
    , _dtrsThingName = Nothing
    , _dtrsResponseStatus = pResponseStatus_
    }

-- | The default client ID.
dtrsDefaultClientId :: Lens' DescribeThingResponse (Maybe Text)
dtrsDefaultClientId = lens _dtrsDefaultClientId (\ s a -> s{_dtrsDefaultClientId = a});

-- | The thing type name.
dtrsThingTypeName :: Lens' DescribeThingResponse (Maybe Text)
dtrsThingTypeName = lens _dtrsThingTypeName (\ s a -> s{_dtrsThingTypeName = a});

-- | The thing attributes.
dtrsAttributes :: Lens' DescribeThingResponse (HashMap Text Text)
dtrsAttributes = lens _dtrsAttributes (\ s a -> s{_dtrsAttributes = a}) . _Default . _Map;

-- | The current version of the thing record in the registry.
dtrsVersion :: Lens' DescribeThingResponse (Maybe Integer)
dtrsVersion = lens _dtrsVersion (\ s a -> s{_dtrsVersion = a});

-- | The name of the thing.
dtrsThingName :: Lens' DescribeThingResponse (Maybe Text)
dtrsThingName = lens _dtrsThingName (\ s a -> s{_dtrsThingName = a});

-- | -- | The response status code.
dtrsResponseStatus :: Lens' DescribeThingResponse Int
dtrsResponseStatus = lens _dtrsResponseStatus (\ s a -> s{_dtrsResponseStatus = a});

instance NFData DescribeThingResponse
