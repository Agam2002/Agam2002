- 👋 Hi, I’m @Agam2002
- 👀 I’m interested in ...
- 🌱 I’m currently learning ...
- 💞️ I’m looking to collaborate on ...
- 📫 How to reach me ...

<!---
Agam2002/Agam2002 is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
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
