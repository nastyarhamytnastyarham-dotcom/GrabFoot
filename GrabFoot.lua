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
pcall(sethiddenproperty,lp,"SimulationRadius",1e9)
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
local S={vis=true,anim=true,fov=true,fovVal=50,run=false,rs=1,hd={},fl=0,hand="Pressure",ic={},x=0,y=0,z=0,bob=1}
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
for _,d in D do
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
for _,x in d[7] do
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
for _,c in it.dec do c.Transparency=t end
end
end
end
zv()
local yaz=60
local yay=120
local yaa={}
for _,k in {"L","R"} do
local c=zx("Cable"..k,V3(0.05,0.05,1))
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
local zbd
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
for i,it in list do f.rel[i]=f.main:ToObjectSpace(it.rest) end
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
if hit then yaq=mX((hit.Position-from).Magnitude-0.25,0) end
f.obj=nil
local o=hit and hit.Instance
if o and not o.Anchored and o.AssemblyMass<300 and not o.Parent:FindFirstChildOfClass("Humanoid") then f.obj=o end
f.start=CN(from)*W.Rotation
f.goal=CN(from+dir*yaq)*W.Rotation
f.dur=mC(yaq/yay,0.12,1.2)
f.t=0
f.state="out"
f.kickV=7
f.hit=false
sfx(zl)
end
local function zt(dt)
local any=false
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
if f.obj then sfx(R.."84990619034539") f.off=f.obj.CFrame:ToObjectSpace(f.goal) end
end
elseif f.state=="hold" then
f.t=f.t+dt
cur=f.goal
local o=f.obj
local q=k=="L" and 1 or 2
local pl=o and o.Parent and (S.hd[k] or UIS:IsKeyDown(q==1 and Enum.KeyCode[q==1 and"Q"or"E"]) or UIS:IsMouseButtonPressed(Enum.UserInputType["MouseButton"..q]))
local tp
if pl then
any=true
f.pt=(f.pt or 0)+dt
local v=(cam.CFrame.Position+cam.CFrame.LookVector*4-o.Position)*1.5
if v.Magnitude>14 then v=v.Unit*14 end
o.AssemblyLinearVelocity=v
elseif f.pt then
tp=f.pt<.3
f.pt=nil
end
if o and f.off then cur=o.CFrame*f.off f.goal=cur end
if f.t>=0.4 and (tp or not(o and o.Parent)) then
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
for i,it in f.list do it.p.CFrame=cur*f.rel[i] end
local c=f.cable
if f.state=="idle" then
c.Transparency=1
else
local a=f.arm.p.CFrame:PointToWorldSpace(f.anchor)
local b=cur.Position
local len=(b-a).Magnitude
if len>0.05 then
c.Size=V3(0.05,0.05,len)
c.CFrame=CFrame.lookAt(a:Lerp(b,0.5),b)
c.Transparency=0
end
end
end
end
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
ybe=res[4]
twistA=res[5]
break
end
end
end
local yas=vm:GetPivot()
local rot=CN(zj)*CA(yau,0,0)*CN(-zj)
local ybd=cam.CFrame.UpVector*(-ybe)
for _,it in yac do
if it.g~="fixed" then
local P=it.rest.Position
local ybb=CN(P)*CA(0,yaw,twistA)*CN(-P)
it.p.CFrame=yas*rot*ybb*it.rest+ybd
elseif it.name=="RArmPrototype" then
it.p.CFrame=yas*rot*it.rest+ybd
end
end
if yag then zbd=nil end
end
local zg,zy,zz,zbg,zh,zbh
local amp,yam,yal,jy,yao,zc,yaj,zba,za,zb,zbi=0,0,0,0,0,0,0,0,0,0,0
local SHL,SHR=V3(-1.8,3.3,0.5),V3(1.8,3.3,0.5)
local HH=V3(0,3.7,-1.8)
local zbj,zbk,zbl,zbm,zbn,zbb,zf,ze,zd,zbo=1,0,0,0,0,0,0,0,0,0
local CR={g=0,k=0,p=0,s=0,b=0,t=9}
local function ybk(dt)
cam=workspace.CurrentCamera
if not cam then return end
for n,k in pairs(S.ic) do
local c=n==S.hand and 0.3 or 0
k.BackgroundColor3=Color3.new(c,c,c)
end
local c0=lp.Character
local r0=c0 and c0:FindFirstChild("HumanoidRootPart")
if r0 then
local rp=S.rp or RaycastParams.new()
S.rp=rp
rp.FilterType=Enum.RaycastFilterType.Exclude
rp.RespectCanCollide=true
rp.FilterDescendantsInstances={c0,vm}
S.gap=false
for _,v in {r0.CFrame.RightVector,r0.CFrame.LookVector} do
local a=workspace:Raycast(r0.Position,v*4,rp)
local b=workspace:Raycast(r0.Position,-v*4,rp)
if a and b and a.Distance+b.Distance<6 then S.gap=true end
end
end
local V=S.vis and not S.gap
if S.ch then S.ch.Visible=V end
if not V then S.h=true end
if S.h then
if zbi>=1 then
zbh=false
if V then
S.h=false
else
vm.Parent=nil
return
end
else
if zbi==0 then sfx(zq) end
zbi=mN(zbi+dt/0.65,1)
end
end
if not S.h and not zbh then
zbh=true
zbi=0
zg=true
sfx(zp)
zbj=1
zbk=0
end
local e=zbi*zbi*(3-2*zbi)
do
local d=mN(dt,0.033)
zbk=zbk+(-81*zbj-10.8*zbk)*d
zbj=zbj+zbk*d
end
S.busy=S.h or mA(zbj)>0.03
if vm.Parent~=cam then vm.Parent=cam end
if S.fov then
if not zz then zz=cam.FieldOfView end
cam.FieldOfView=S.fovVal
elseif zz then
cam.FieldOfView=zz
zz=nil
end
local chr=lp.Character
local hum=chr and chr:FindFirstChildOfClass("Humanoid")
local yah=chr and chr:FindFirstChild("HumanoidRootPart")
local vy=0
local zbe=true
if hum and yah then
zbe=hum.FloorMaterial~=Enum.Material.Air
vy=yah.AssemblyLinearVelocity.Y
end
if zbe then
yaj=0
zh=false
else
yaj=yaj+dt
end
if not zbe and not zh and vy>10 then
zh=true
sfx(zo,5)
end
local zbf=yaj>0.15
if yaj>zba then zba=yaj end
if zbf and vy<zbb then zbb=vy end
local yav=0
if zbf then yav=mC(-vy/40,-1,1) end
jy=jy+(yav-jy)*mN(dt*6,1)
if zbg and not zbf then
if zba>0.35 then
zc=0.2
zd=mC(-zbb/60,0,1)*0.6
end
zba=0
zbb=0
end
zbg=zbf
zc=zc*(1-mN(dt*4,1))
yao=yao+(zc-yao)*mN(dt*10,1)
local spd=0
if yah then
local rv=yah.AssemblyLinearVelocity
spd=V3(rv.X,0,rv.Z).Magnitude
end
local hg=0
if spd>0.5 and not zbf then hg=1 end
zf=zf+(hg-zf)*mN(dt*8,1)
ze=ze+dt*mC(spd,0,24)*0.55*(1+0.4*zbn)
zd=zd*(1-mN(dt*4,1))
zbo=zbo+(zd-zbo)*mN(dt*10,1)
CR.k=CR.k+(CR.g*1.6-CR.k)*mN(dt*6,1)
CR.t=CR.t+dt
CR.p=CR.t<0.9 and mS(CR.t*3.49)^2*(0.045-0.2*(1-CR.t/0.9)^3) or 0
CR.s=CR.s+(CR.p-CR.s)*mN(dt*9,1)
CR.b=CR.t<2 and math.exp(-4*CR.t)*mS(8*CR.t) or 0
if hum then
hum.CameraOffset=V3(mO(ze)*0.03*zf,mA(mS(ze))*0.06*zf-zbo-CR.k,0)
end
zbn=zbn+((S.run and 1 or 0)-zbn)*mN(dt*5,1)
local hk=0
local off=ybg
if S.anim then
local lx,lz=0,0
if yah then
local v=yah.AssemblyLinearVelocity
local lv=cam.CFrame:VectorToObjectSpace(V3(v.X,0,v.Z))
lx=lv.X
lz=lv.Z
end
zbl=zbl+(mC(lx/16,-1,1)-zbl)*mN(dt*5,1)
zbm=zbm+(mC(-lz/16,-1,1)-zbm)*mN(dt*5,1)
zb=zb+(spd-zb)*mN(dt*6,1)
local goal=0
if not zbf then goal=mC(zb/10,0,1) end
amp=amp+(goal-amp)*mN(dt*5,1)
za=za+dt*(7+zbn*3)
local t=os.clock()
local idle=mS(t*1.5)*0.015
local k=amp*S.bob*(1+0.1*zbn)
hk=k
local w=mS(za)*k
local c=mS(za*0.5)*k
local ybo=w*0.06
local ybi=-w*0.05
local ybj=c*0.05
local ybm=-c*0.04
local ybn=mO(za)*k*0.02
off=ybg*CN(ybj,idle+ybo,ybn)*CN(HH)*CA(ybi,0,ybm)*CN(-HH)
off=off*CN(HH)*CA(-zbm*0.05,-zbl*0.08,-zbl*0.06)*CN(-HH)
off=off*CN(0,jy*0.15-yao,0)*CA(-jy*0.1,0,0)
end
if zy then
local rx,ry=zy:ToObjectSpace(cam.CFrame):ToEulerAnglesYXZ()
local d=mX(dt,0.001)
local tx=mC(ry/d*0.03,-0.25,0.25)
local ty=mC(-rx/d*0.03,-0.2,0.2)
local a=mN(dt*10,1)
yam=yam+(tx-yam)*a
yal=yal+(ty-yal)*a
end
zy=cam.CFrame
off=CN(yam,yal,0)*off*CA(yal*0.5,-yam*0.5,0)
off=CN(-0.03*CR.b,-2*zbj-2.4*e+0.1*CR.b+2*CR.s-0.05*CR.k,0)*off*CN(HH)*CA(-0.6*zbj-0.8*e+CR.s,0,0)*CN(-HH)
vm:PivotTo(cam.CFrame*CN(S.x,S.y,S.z)*off)
local yaf=false
for _,f in pairs(yaa) do
local d=mN(dt,0.033)
f.kickV=f.kickV+(-120*f.kick-12*f.kickV)*d
f.kick=f.kick+f.kickV*d
f.dipV=f.dipV+(-120*f.dip-12*f.dipV)*d
f.dip=f.dip+f.dipV*d
if mA(f.kick)+mA(f.kickV)+mA(f.dip)+mA(f.dipV)>0.01 then yaf=true end
end
if hk>0.001 or zg or yaf or zbi>0 then
zg=hk>0.001 or yaf or zbi>0
local up=cam.CFrame.UpVector*(mS(za)*0.02*hk)
local yas=vm:GetPivot()
local ybc=mS(za+0.6)*0.035*hk
for _,it in yac do
local sh=SHL
local fk=yaa.L.kick
local fd=yaa.L.dip
if it.rest.X>0 then
sh=SHR
fk=yaa.R.kick
fd=yaa.R.dip
end
local rot=CN(sh)*CA(ybc+fk*0.12-0.5*e,0,0)*CN(-sh)
local hr=CN()
if e>0 and (it.g~="fixed" or it.name=="OldBlue") then
local P=it.rest.Position
hr=CN(P)*CA(1.2*mS(3.14*zbi)-1.1*e,0,0)*CN(-P)
end
it.p.CFrame=yas*rot*hr*it.rest+up+cam.CFrame.LookVector*(-0.3*fk)+cam.CFrame.LookVector*fd
end
end
zt(dt)
zu(dt)
end
RS:BindToRenderStep("GFU",Enum.RenderPriority.Camera.Value+1,ybk)
local gui=IN("ScreenGui")
gui.ResetOnSpawn=false
gui.DisplayOrder=999
gui.IgnoreGuiInset=true
local ch=IN("Frame")
ch.Size=FO(8,8)
ch.Position=UDim2.new(0.5,-4,0.5,-4)
ch.BackgroundColor3=WH
ch.Parent=gui
S.ch=ch
local yag=false
if gethui then yag=pcall(function() gui.Parent=gethui() end) end
if not yag or not gui.Parent then yag=pcall(function() gui.Parent=GS("CoreGui") end) end
if not yag or not gui.Parent then gui.Parent=lp:WaitForChild("PlayerGui") end
local yab=IN("Frame")
yab.Size=FO(340,290)
yab.Position=UDim2.new(0,60,0,60)
yab.BackgroundColor3=RGB(14,2,2)
yab.BorderColor3=RGB(220,40,40)
yab.Active=true
yab.Draggable=true
yab.Visible=false
yab.Parent=gui
local function mk(cls,txt,x,y,w,h)
local o=IN(cls,yab)
o.Text=txt
o.Size=FO(w,h)
o.Position=FO(x,y)
o.BackgroundTransparency=1
o.TextColor3=WH
return o
end
local t=mk("TextLabel","SETTINGS",14,6,220,40)
t.TextSize=30
t.TextColor3=RGB(220,40,40)
mk("TextButton","X",300,10,30,30).Activated:Connect(function()
if _G.GFStop then _G.GFStop() end
end)
local ON=RGB(170,35,35)
local OFF=RGB(55,55,60)
local function yan()
CR.g=1-CR.g
CR.t=0
end
local yax=0
local function ybh(b,v)
b.BackgroundColor3=v and ON or OFF
end
local ybl={{"Grabpack","vis"},{"Anims","anim"},{"FOV On","fov"},{"FOV","fovVal",5,20,120},{"Bob","bob",0.25,0,3},{"Left/Right","x",0.1,-3,3},{"Down/Up","y",0.1,-3,3},{"Far/Near","z",0.1,-3,3}}
for i,r in ybl do
local y=52+(i-1)*30
local k=r[2]
local lb=mk("TextLabel",r[1],14,y,170,26)
local vl=mk("TextLabel","",216,y,80,26)
local function upd()
local v=S[k]
vl.Text=type(v)=="boolean" and (v and "ON" or "OFF") or tostring(math.floor(v*100+0.5)/100)
end
local function go(d)
local v=S[k]
if type(v)=="boolean" then
if k=="vis" then
if os.clock()<yax then return end
yax=os.clock()+3
end
S[k]=not v
else
S[k]=mC(v+d*r[3],r[4],r[5])
end
upd()
end
mk("TextButton","<",186,y,30,26).Activated:Connect(function() go(-1) end)
mk("TextButton",">",296,y,30,26).Activated:Connect(function() go(1) end)
upd()
end
local function big(txt,x,y,fn,z)
z=z or 64
local b=IN("TextButton")
b.Text=txt
b.TextSize=z*0.28
b.Size=FO(z,z)
b.Position=UDim2.new(1,x,1,y)
b.BackgroundColor3=Color3.new(0,0,0)
b.BackgroundTransparency=0.45
b.TextColor3=WH
b.Parent=gui
local k=IN("UIStroke",b)
k.Color=WH
k.Thickness=2
IN("UICorner",b).CornerRadius=UDim.new(1,0)
b.Activated:Connect(fn)
return b
end
local yae
local function yad(v)
local hm=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
if hm and v~=S.run then hm.WalkSpeed=hm.WalkSpeed*(v and 1.25 or 0.8) end
S.run=v
S.rs=v and 1.3 or 1
if S.snd then S.snd.PlaybackSpeed=S.rs end
if yae then ybh(yae,v) end
end
yae=big("RUN",-402,-351,function() yad(not S.run) end,60)
yad(false)
local function hold(b,k)
b.InputBegan:Connect(function(i)
if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then S.hd[k]=true end
end)
b.InputEnded:Connect(function() S.hd[k]=false end)
end
local ybf=big("L",-459,-261,function() yai("L") end,72)
hold(ybf,"L")
ybf.TextColor3=RGB(60,110,255)
yar=big("R",-357,-261,function() yai("R") end,72)
hold(yar,"R")
big("v",-398,-159,yan,52)
local gb=big("⚙",0,0,function() yab.Visible=not yab.Visible end,48)
gb.Position=UDim2.new(0,12,0,100)
gb.TextSize=30
local n=0
for _,it in yac do
if it.name==it.g or it.name=="Glowby" then
local g=it.name=="Glowby"
if not g then n=n+1 end
local b=big("",0,0,function() if not g then zw(it.g) end end,g and 92 or 76)
b.Position=UDim2.new(1,g and -98 or -410+n*82,0,g and 138 or 50)
if g then
b.Activated:Connect(function()
S.fl=(S.fl+1)%3
SL.Enabled=S.fl>0
local cc=S.fl==2 and HC.Purple or WH
SL.Color=cc
b.BackgroundColor3=S.fl==2 and cc or S.fl==1 and RGB(80,80,80) or RGB(0,0,0)
end)
else
S.ic[it.g]=b
end
b.BackgroundTransparency=0
local vp=IN("ViewportFrame",b)
vp.Size=UDim2.fromScale(1,1)
vp.BackgroundTransparency=1
vp.Ambient=WH
local c=IN("Camera",vp)
vp.CurrentCamera=c
task.spawn(function()
local m=it.p:FindFirstChildOfClass("SpecialMesh")
repeat task.wait(0.2) until not m or m.Scale.X>0.0002
if g then task.wait(1) end
local rb=it.rest.Rotation
if g then rb=CA(-0.3,0.6,0)*CFrame.lookAt(V3(),V3(-0.78,-0.6,-0.18)):Inverse()*rb end
local q
for _,o in yac do
if o==it or (g and o.g=="fixed" and (o.name=="Screen" or o.name=="Glass")) then
local w=o.p:Clone()
w.CFrame=rb*it.rest:ToObjectSpace(o.rest)
w.Parent=vp
if o==it then q=w end
end
end
q.Transparency=0
if it.g=="Purple" then
q.Color=HC.Purple
q:FindFirstChildOfClass("SpecialMesh").TextureId=""
end
c.CFrame=CN(0,0,q.Size.Magnitude*(g and 0.85 or 0.75))
end)
end
end
zv()
local yap=UIS.InputBegan:Connect(function(i,gp)
if gp then return end
if i.KeyCode==Enum.KeyCode.C then yan() end
if i.KeyCode==Enum.KeyCode.Q then yai("L") end
if i.KeyCode==Enum.KeyCode.E then yai("R") end
for k,n in pairs({One="Pressure",Two="OldRed",Three="Conductive",Four="Purple"}) do
if i.KeyCode==Enum.KeyCode[k] then zw(n) end
end
if i.UserInputType==Enum.UserInputType.MouseButton1 then yai("L") end
if i.UserInputType==Enum.UserInputType.MouseButton2 then yai("R") end
end)
_G.GFStop=function()
pcall(RS.UnbindFromRenderStep,RS,"GFU")
yap:Disconnect()
S.ps:Destroy()
pcall(yad,false)
zs:Disconnect()
if zz and cam then cam.FieldOfView=zz end
pcall(function() lp.Character:FindFirstChildOfClass("Humanoid").CameraOffset=V3(0,0,0) end)
vm:Destroy()
gui:Destroy()
_G.GFStop=nil
end
