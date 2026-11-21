local R="rbxassetid://"
local WH=Color3.new(1,1,1)
local CN,V3,CA,RGB,IN,FO=CFrame.new,Vector3.new,CFrame.Angles,Color3.fromRGB,Instance.new,UDim2.fromOffset
local function GS(n)
return game:GetService(n)
end
local mN,mX,mC,mA,mS,mO=math.min,math.max,math.clamp,math.abs,math.sin,math.cos
local RS=GS("RunService")
local UIS=GS("UserInputService")
local lp=GS("Players").LocalPlayer
if _G.GFStop then pcall(_G.GFStop) end
pcall(function() sethiddenproperty(lp,"SimulationRadius",1e9) end)
local D={
{"LArmPrototype","fixed","127351287285117","99652070521229",{0.576,1.074,3.024},{-1.83,3.292,-0.977,-1,0,0,0,1,-0.015,0,-0.015,-1},{}},
{"RArmPrototype","fixed","133477817143623","99652070521229",{0.576,1.074,3.025},{1.771,3.292,-0.977,-1,0,0,0,1,-0.015,0,-0.015,-1},{}},
{"OldBlue","fixed","16207785344","140666443339143",{1.09,1.417,0.407},{-1.671,3.905,-2.71,1,0,0,0,1,0.007,0,-0.007,1},{}},
{"Pressure","Pressure","139743052739292","133879359914138",{1.055,1.419,0.397},{1.641,3.852,-2.714,-1,0,0,0,1,-0.007,0,-0.007,-1},{}},
{"OldRed","OldRed","16446568033","106320124170511",{1.09,1.417,0.407},{1.661,3.906,-2.715,-1,0,0,0,1,-0.007,0,-0.007,-1},{}},
{"Conductive","Conductive","103769828818530","136209525670434",{1.094,1.495,0.39},{1.661,3.863,-2.729,-1,0,0,0,1,-0.007,0,-0.007,-1},{}},
{"Screen","Conductive","78161437073880","",{0.309,0.25,0.004},{1.786,3.751,-2.601,-1,0,0,0,1,-0.007,0,-0.007,-1},{}},
{"Glowby","fixed","127053938456363","137016379563966",{0.869,0.878,0.21},{-1.641,3.616,-2.146,-0.226,-0.579,-0.783,0.001,0.804,-0.595,0.974,-0.135,-0.181},{}},
{"Screen","fixed","92175119740156","",{0.441,0.441,0.003},{-1.535,3.617,-2.121,-0.226,-0.579,-0.783,0.001,0.804,-0.595,0.974,-0.135,-0.181},{{"138075590951818",5},{"76493299033255",5}}},
{"Glass","fixed","","",{0.004,0.45,0.45},{-1.53,3.617,-2.12,0.783,-0.579,-0.226,0.595,0.804,0.001,0.181,-0.135,0.974},{{"104546635301135",0}}},
}
D[#D+1]={"Purple","Purple",D[5][3],D[5][4],D[5][5],D[5][6],{}}
local ybg=CN(0,-4.8,-1.5)
local S={vis=true,anim=true,fov=true,fovVal=50,run=false,rs=1,hd={},fl=0,hand="Pressure",pc=false,ic={},x=0,y=0,z=0,bob=1}
local cam=workspace.CurrentCamera
local function zx(name,size)
local p=IN("Part")
p.Name=name
p.Size=size
p.Anchored=true
p.CanCollide=false
return p
end
local vm=IN("Model")
local yak=zx("Pivot",V3(0.2,0.2,0.2))
yak.Transparency=1
yak.Parent=vm
vm.PrimaryPart=yak
local yac={}
local SL
for _,d in ipairs(D) do
local p=zx(d[1],V3(d[5][1],d[5][2],d[5][3]))
p.CFrame=CN(unpack(d[6]))
if d[1]=="Glowby" then
SL=IN("SpotLight",p)
SL.Range=80
SL.Brightness=3
SL.Face=Enum.NormalId.Left
SL.Enabled=false
end
if d[3]~="" then
local m=IN("SpecialMesh")
m.MeshType=Enum.MeshType.FileMesh
m.MeshId=R..d[3]
if d[4]~="" then m.TextureId=R..d[4] end
m.Scale=V3(0.0001,0.0001,0.0001)
if d[1]=="Purple" then m.VertexColor=V3(0.7,1.4,5) end
m.Parent=p
local yba=p.Size
local id=m.MeshId
task.spawn(function()
local mp
pcall(function()
mp=GS("InsertService"):CreateMeshPartAsync(id,Enum.CollisionFidelity.Box,Enum.RenderFidelity.Automatic)
end)
local sc=Vector3.one
if mp and mp.Size.Magnitude>0 then
sc=V3(yba.X/mp.Size.X,yba.Y/mp.Size.Y,yba.Z/mp.Size.Z)
mp:Destroy()
end
m.Scale=sc
end)
elseif d[1]=="Glass" then
p.Material=Enum.Material.Glass
p.Transparency=0.4
p.Color=WH
end
local dec={}
for _,x in ipairs(d[7]) do
local c=IN("Decal")
c.Texture=R..x[1]
c.Face=Enum.NormalId:FromValue(x[2])
c.Parent=p
dec[#dec+1]=c
end
p.Parent=vm
yac[#yac+1]={p=p,g=d[2],dec=dec,name=d[1],rest=CN(unpack(d[6]))}
end
vm.Parent=cam
local yar=nil
local HC={Pressure=RGB(140,140,145),OldRed=RGB(200,40,40),Conductive=RGB(235,190,30),Purple=RGB(150,60,220)}
local function zv()
if yar then yar.TextColor3=HC[S.hand] end
for _,it in yac do
if it.g~="fixed" then
local t=(it.g==S.hand) and 0 or 1
it.p.Transparency=t
for _,c in ipairs(it.dec) do c.Transparency=t end
end
end
end
zv()
local yaz=60
local yay=120
local yaa={}
for _,k in ipairs({"L","R"}) do
local c=zx("Cable"..k,V3(0.08,0.08,1))
c.Color=RGB(35,35,40)
c.Transparency=1
c.Parent=vm
yaa[k]={state="idle",kick=0,kickV=0,dip=0,dipV=0,cable=c}
end
local yat=V3(1.7,3.25,-2.45)
for _,it in yac do
if it.name=="LArmPrototype" then
yaa.L.arm=it
yaa.L.anchor=it.rest:PointToObjectSpace(V3(-yat.X,yat.Y,yat.Z))
elseif it.name=="RArmPrototype" then
yaa.R.arm=it
yaa.R.anchor=it.rest:PointToObjectSpace(yat)
end
end
local zl=R.."109515285989353"
local zm=R.."103751410300272"
local zn=R.."120354763901426"
local zo=R.."84033615361833"
local zk=R.."140182143545890"
local zp=R.."122664177608388"
local zq=R.."114915576864214"
S.ps=IN("Sound",GS("SoundService"))
S.ps.SoundId=R.."92086671433437"
S.ps.Looped=true
local function sfx(id,vol)
pcall(function()
local snd=IN("Sound")
snd.SoundId=id
snd.Volume=vol or 1
snd.Parent=GS("SoundService")
snd:Play()
GS("Debris"):AddItem(snd,6)
end)
end
local function zr(ch)
local hrp=ch:WaitForChild("HumanoidRootPart",10)
if not hrp then return end
local function sw(snd)
if snd and snd:IsA("Sound") then
snd.SoundId=zk
snd.Volume=0.5
S.snd=snd
snd.PlaybackSpeed=S.rs
snd.Changed:Connect(function()
if snd.SoundId~=zk then snd.SoundId=zk end
if snd.PlaybackSpeed~=S.rs then snd.PlaybackSpeed=S.rs end
end)
end
end
sw(hrp:FindFirstChild("Running"))
hrp.ChildAdded:Connect(function(c)
if c.Name=="Running" then sw(c) end
end)
end
if lp.Character then task.spawn(zr,lp.Character) end
local zs=lp.CharacterAdded:Connect(zr)
task.spawn(function()
pcall(function()
GS("ContentProvider"):PreloadAsync({zl,zm,zn,zo,zp,zq})
end)
end)
local zbd,yad
local function yai(side)
local f=yaa[side]
if f.state~="idle" or not S.vis or S.busy or not cam or (side=="R" and zbd) then return end
local list={}
for _,it in yac do
if (side=="L" and it.name=="OldBlue") or (side=="R" and it.g==S.hand) then list[#list+1]=it end
end
if #list==0 then return end
f.list=list
f.main=list[1].rest
f.rel={}
for i,it in ipairs(list) do f.rel[i]=f.main:ToObjectSpace(it.rest) end
local W=vm:GetPivot()*f.main
local rp=RaycastParams.new()
rp.FilterType=Enum.RaycastFilterType.Exclude
rp.RespectCanCollide=true
rp.FilterDescendantsInstances={lp.Character,vm}
local from=W.Position
local cp=cam.CFrame.Position
local cl=cam.CFrame.LookVector*yaz
local wb=workspace:Raycast(cp,from-cp,rp)
if wb then from=wb.Position-(from-cp).Unit*0.5 end
local ray=workspace:Raycast(cp,cl,rp)
local tp=ray and ray.Position or cp+cl
local dir=(tp-from).Unit
local yaq=mN(yaz,(tp-from).Magnitude)
local hit=workspace:Blockcast(CN(from)*W.Rotation,V3(1.3,1.6,0.6),dir*yaq,rp)
if hit then yaq=mX(hit.Distance-0.1,0) end
f.obj=nil
f.jmp=side=="R" and S.hand=="Purple" and hit and hit.Normal.Y>0.7
local o=hit and hit.Instance
f.gl=nil
f.pt=nil
f.rl=false
if side=="R" and S.hand=="Pressure" and o and (o.Material==Enum.Material.Glass or o.Material==Enum.Material.ForceField or o.Material==Enum.Material.Ice or o.Material==Enum.Material.Glacier or o.Name:lower():find("glass") or o.Name:lower():find("ice") or o.Name:lower():find("forcefield")) then f.gl=o end
if o and not f.gl and not o.Anchored and o.AssemblyMass<300 and not o.Parent:FindFirstChildOfClass("Humanoid") then f.obj=o end
f.start=CN(from)*W.Rotation
f.goal=CN(from+dir*yaq)*W.Rotation
f.dur=mC(yaq/yay,0.12,1.2)
f.t=0
f.state="out"
f.kickV=7
f.hit=false
sfx(zl)
end
local function brk(g,pos)
g.CanCollide=false
g.CanQuery=false
local ot=g.Transparency
g.Transparency=1
local rn=math.random
local sz=g.Size
local ax={sz.X,sz.Y,sz.Z}
local t=1
for q=2,3 do
if ax[q]<ax[t] then t=q end
end
local a=t%3+1
local b=a%3+1
local cs=1.8
while (ax[a]/cs)*(ax[b]/cs)>60 do cs=cs*1.2 end
local na=mX(1,math.floor(ax[a]/cs+0.5))
local nb=mX(1,math.floor(ax[b]/cs+0.5))
local ts=GS("TweenService")
local pn=g.CFrame.LookVector
for i=1,na do
for j=1,nb do
local off={0,0,0}
off[a]=(i-0.5)/na*ax[a]-ax[a]/2
off[b]=(j-0.5)/nb*ax[b]-ax[b]/2
local size={0,0,0}
size[a]=ax[a]/na*0.96
size[b]=ax[b]/nb*0.96
size[t]=ax[t]
local p=IN("Part")
p.Size=V3(size[1],size[2],size[3])
p.Material=g.Material
p.Color=g.Color
p.Transparency=mC(ot,0.2,0.6)
p.CanTouch=false
p.CFrame=g.CFrame*CN(off[1],off[2],off[3])
local d=p.Position-pos
d=d.Magnitude>0.01 and d.Unit or V3(0,1,0)
p.AssemblyLinearVelocity=d*(1.5+rn()*3)+V3(rn()-0.5,rn()-0.2,rn()-0.5)*3
p.AssemblyAngularVelocity=V3(rn()-0.5,rn()-0.5,rn()-0.5)*4
p.Parent=workspace
task.delay(5+rn()*2,function()
local tw=ts:Create(p,TweenInfo.new(1),{Transparency=1})
tw:Play()
tw.Completed:Connect(function() p:Destroy() end)
end)
end
end
local e=zx("Dust",V3(1,1,1))
e.Transparency=1
e.CFrame=CN(pos)
e.Parent=workspace
local pe=IN("ParticleEmitter",e)
pe.Texture="rbxasset://textures/particles/smoke_main.dds"
pe.Color=ColorSequence.new(RGB(220,235,245))
pe.Transparency=NumberSequence.new(0.6,1)
pe.Size=NumberSequence.new(1.5,4)
pe.Lifetime=NumberRange.new(0.6,1.2)
pe.Speed=NumberRange.new(4,10)
pe.SpreadAngle=Vector2.new(180,180)
pe.Rate=0
pe:Emit(18)
GS("Debris"):AddItem(e,2)
sfx(zo,3)
end
local function zt(dt)
local any=false
local gpv
for k,f in pairs(yaa) do
if f.state~="idle" then
local rest=vm:GetPivot()*f.main
local cur=rest
if f.state=="out" then
f.t=f.t+dt/f.dur
local a=mN(f.t,1)
a=1-(1-a)*(1-a)
cur=f.start:Lerp(f.goal,a)
if f.t>=1 then
f.state="hold"
f.t=0
if f.jmp then
local rt=lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
if rt then
local hm=lp.Character:FindFirstChildOfClass("Humanoid")
if hm then hm:ChangeState(Enum.HumanoidStateType.Jumping) end
task.spawn(function()
for _=1,3 do
task.wait()
local v=rt.AssemblyLinearVelocity
rt.AssemblyLinearVelocity=V3(v.X,110,v.Z)
end
end)
sfx(zo,5)
end
end
if f.obj then sfx(R.."84990619034539") f.off=f.obj.CFrame:ToObjectSpace(f.goal) end
end
elseif f.state=="hold" then
f.t=f.t+dt
cur=f.goal
local o=f.obj
local q=k=="L" and 1 or 2
local dn=S.hd[k] or UIS:IsKeyDown(q==1 and Enum.KeyCode.Q or Enum.KeyCode.E) or UIS:IsMouseButtonPressed(Enum.UserInputType["MouseButton"..q])
local pl=o and o.Parent and dn
local gl=f.gl
if gl then
if dn then
f.pt=(f.pt or 0)+dt
gpv=mN(f.pt/2.5,1)
else
gpv=0
if f.pt then
if f.pt/2.5>=0.8 and gl.Parent then brk(gl,f.goal.Position) end
f.pt=nil
f.rl=true
end
end
end
if pl then
any=true
local v=(cam.CFrame.Position+cam.CFrame.LookVector*4-o.Position)*1.5
if v.Magnitude>14 then v=v.Unit*14 end
o.AssemblyLinearVelocity=v
end
if o and f.off then cur=o.CFrame*f.off f.goal=cur end
if f.t>=0.4 and (gl and f.rl or not gl and not pl) then
f.state="back"
sfx(zm)
f.t=0
f.from=f.goal
f.dur=mC((f.goal.Position-rest.Position).Magnitude/yay*1.1,0.25,1.3)
end
else
f.t=f.t+dt/f.dur
local a=mN(f.t,1)
cur=f.from:Lerp(rest,a*a*(3-2*a))
if a>0.7 and not f.hit then
f.hit=true
f.dipV=-10
end
if f.t>=1 then
f.state="idle"
f.obj=nil
cur=rest
end
end
for i,it in ipairs(f.list) do it.p.CFrame=cur*f.rel[i] end
local c=f.cable
if f.state=="idle" then
c.Transparency=1
else
local a=f.arm.p.CFrame:PointToWorldSpace(f.anchor)
local b=cur.Position
local len=(b-a).Magnitude
if len>0.05 then
c.Size=V3(0.08,0.08,len)
c.CFrame=CFrame.lookAt(a:Lerp(b,0.5),b)
c.Transparency=0
end
end
end
end
if S.ur then S.ur(gpv) end
if any then
if not S.ps.Playing then S.ps:Play() end
else
S.ps:Stop()
end
end
local zj=V3(1.77,3.29,0.5)
local zbc
local zi={
{0,0,0,0,0},
{0.2,0.12,0,0,0},
{0.7,-1.5,0,0.7,0},
{1.05,0.15,-0.25,0,0},
{1.22,-0.03,0.15,0,0},
{1.36,0.012,0,0,0},
{1.5,0,0,0,0},
}
local function zw(name)
if zbd or name==S.hand or yaa.R.state~="idle" then return end
zbc=name
zbd=0
sfx(zn)
end
local function zu(dt)
if not zbd then return end
zbd=zbd+dt
local yag=zbd>=1.5
if zbc and zbd>=0.7 then
S.hand=zbc
zbc=nil
zv()
end
local yau,yaw,ybe,twistA=0,0,0,0
if not yag then
local n=#zi
for i=1,n-1 do
local k0=zi[i]
local k1=zi[i+1]
if zbd>=k0[1] and zbd<=k1[1] then
local h=k1[1]-k0[1]
local u=(zbd-k0[1])/h
local u2=u*u
local u3=u2*u
local kp=zi[i-1]
local kn=zi[i+2]
local res={}
for c=2,5 do
local m0=0
if kp then m0=(k1[c]-kp[c])/(k1[1]-kp[1]) end
local m1=0
if kn then m1=(kn[c]-k0[c])/(kn[1]-k0[1]) end
res[c]=(2*u3-3*u2+1)*k0[c]+(u3-2*u2+u)*h*m0+(-2*u3+3*u2)*k1[c]+(u3-u2)*h*m1
end
yau=res[2]
yaw=res[3]
