# Configuring and synchronizing content

In this section we will configure and synchronize content, by enabling repositories and configuring products synchronization.

## Enabling repositories

In this first section we will enable relevant repositories for RHEL8 and RHEL9 that we will use later.

- In Red Hat Satellite Web UI go in the *Content-> Red Hat Repositories* section. 
- Toggle the **Recommended Repositories** button
- Select the following repositories:
    - Red Hat Enterprise Linux 8 for x86_64 - AppStream (RPMs) - x86_64 8
    - Red Hat Enterprise Linux 8 for x86_64 - BaseOS (RPMs) - x86_64 8
    - Red Hat Enterprise Linux 9 for x86_64 - AppStream (RPMs) - x86_64 9
    - Red Hat Enterprise Linux 9 for x86_64 - BaseOS (RPMs) - x86_64 9

The result of this operation will give you this output.

![](./assets/configured-repos.png)

## Synchronize content

Now that the repos are in place, we can proceed populating content synchronizing our Satellite repositories with Red Hat certified content.

- In Red Hat Satellite Web UI go in the *Content-> Products* section
- Click on *Red Hat Enterprise Linux for x86_64*

> [!TIP]
> Note that no content is in sync right now, as the full *0* on the packages information shows

- Select all repositories and click on *Sync All* and grab a cup of coffee. 

![](./assets/products-pre-sync.png)

> [!WARNING]
> The operation can take a while based on connection speed

- Verify that the content is correctly synchronized

![](./assets/products-post-sync.png)

## Schedule a sync plan

During the weeks, patches, bugfixes and enhancement could be released, and in order to keep your Satellite content up to date, synchronization tasks can be scheduled.

- In Red Hat Satellite Web UI go in the *Content-> Sync Plans* section. 
- On the top right of the window, click on _Create Sync Plan_
- Fill in the fields and choose a suitable schedule that works for you
- Save the plan

You will be directed to the fresh created sync plan, and you will be able to issue a sync by clicking on the _Select Action_ button and select _Run Sync Plan_

> [!NOTE]
> Sync plans start date is challenged against the current date/time. You can use a date in the past if you want the first planned sync to happen early.
