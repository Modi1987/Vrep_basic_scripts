

%% Declare V-rep objects
vrep=remApi('remoteApi');
vrep.simxFinish(-1); 
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);
jHandle=0;
if (clientID>-1)    
    s='triggerJoint';
    [res, daHandle]=vrep.simxGetObjectHandle(clientID,s,vrep.simx_opmode_oneshot_wait);
    jHandle=daHandle;
else 
    return;
end


while 1
    disp('* Enter any POSITIVE number to draw a line between two dummies')
    disp('* Enter any NEGATIVE number to clear any drawn line')
    y=input('* Enter ZERO to terminate');
    if y==0
        break;
    else
        errorCode=vrep.simxSetJointPosition(clientID,jHandle...
        ,y,vrep.simx_opmode_oneshot_wait);
    end                    
end

%% End simulation
vrep.simxFinish(clientID);
vrep.delete();
