- š Hi, Iām @Agam2002
- š Iām interested in ...
- š± Iām currently learning ...
- šļø Iām looking to collaborate on ...
- š« How to reach me ...

<!---
Agam2002/Agam2002 is a āØ special āØ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->
void kadane(int arr[],int n)
{
int max=0;
int msf=INT16_MIN;

for(int i=0;i<n;i++)
{
max+=arr[i];
if(max<arr[i])
{
max=arr[i];

}

if(msf<max)
{msf=max;}

}

cout<<"The possible sub-array with largest sum:"<<msf;
}
