# Content Lifecycle Management

!!! warning
    Before proceeding with any use case, the first thing to do is to generate a Manifest and upload it to satellite.
    
    <details>
    <summary><i>Create the manifest and export it</i></summary>
    
    - From the [Hybrid Cloud Console](https://console.redhat.com) home page, click Services > Subscriptions and Spend > Manifests. 
    - From the Manifests page, click Create new manifest. 
    - In the Name field, enter a unique name for the manifest. 
    - From the Type list, select the application type and version number that corresponds to your Red Hat Satellite Server. 
    - Click Create. 
    
    More details in [the documentation](https://docs.redhat.com/en/documentation/subscription_central/1-latest/html/creating_and_managing_manifests_for_a_connected_satellite_server/proc-creating-manifest-satellite-connected#proc-creating-manifest-satellite-connected)

    You can then allocate the subscriptions you want to associate to the freshly created manifest by using e [Subscription Allocation page](https://access.redhat.com/management/subscription_allocations)
    
    Then you can export the freshly created manifest withing the [manifest page in Cloud Console](https:/onsole.redhat.com/subscriptions/manifests).
    </details>
    <details>
    <summary><i>Upload manifest to Red Hat Satellite</i></summary>

    - In the Satellite web UI, ensure the context is set to the organization you want to use.  

    - In the Satellite web UI, navigate to Content > Subscriptions and click Manage Manifest.  

    - In the Manage Manifest window, click Choose File. 

    - Navigate to the location that contains the Red Hat subscription manifest file, then click Open. 

    - Verify that in the "Content > Subscriptions" menu you see listed the subscriptions you allocated before 
    
    </details>

    In this section we will configure and synchronize content, by enabling repositories and configuring products synchronization.

One of the powerful features of Red Hat Satellite is the lifecycle management for content.
In this section we will create two 