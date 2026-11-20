if not cam then return end
local sh=UIS:IsKeyDown(Enum.KeyCode.LeftShift) or UIS:IsKeyDown(Enum.KeyCode.RightShift)
if sh~=S.shl then S.shl=sh yad(sh) end
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
for _,v in ipairs({r0.CFrame.RightVector,r0.CFrame.LookVector}) do
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
S.rg={}
local rgf=IN("Frame",gui)
rgf.Size=FO(100,100)
rgf.AnchorPoint=Vector2.new(0.5,0.5)
rgf.Position=UDim2.fromScale(0.5,0.5)
rgf.BackgroundTransparency=1
rgf.Visible=false
for i=1,24 do
local a=(i-1)/24*6.2832
local d=IN("Frame",rgf)
d.Size=FO(7,7)
d.AnchorPoint=Vector2.new(0.5,0.5)
d.Position=UDim2.new(0.5,mS(a)*42,0.5,-mO(a)*42)
d.BorderSizePixel=0
IN("UICorner",d).CornerRadius=UDim.new(1,0)
S.rg[i]=d
end
S.ur=function(p)
rgf.Visible=p~=nil
if p then
for i,d in S.rg do
local fr=i/24
if fr<=p then
d.BackgroundColor3=fr<0.5 and RGB(60,200,60) or fr<0.8 and RGB(230,200,40) or RGB(230,50,40)
d.BackgroundTransparency=0
else
d.BackgroundColor3=WH
d.BackgroundTransparency=0.8
end
end
end
end
local yag=false
if gethui then yag=pcall(function() gui.Parent=gethui() end) end
if not yag or not gui.Parent then yag=pcall(function() gui.Parent=GS("CoreGui") end) end
if not yag or not gui.Parent then gui.Parent=lp:WaitForChild("PlayerGui") end
local yab=IN("Frame")
yab.Size=FO(340,322)
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
local ybl={{"Grabpack","vis"},{"Anims","anim"},{"FOV On","fov"},{"FOV","fovVal",5,20,120},{"Bob","bob",0.25,0,3},{"Left/Right","x",0.1,-3,3},{"Down/Up","y",0.1,-3,3},{"Far/Near","z",0.1,-3,3},{"PC Mode","pc"}}
for i,r in ipairs(ybl) do
local y=52+(i-1)*30
local k=r[2]
local lb=mk("TextLabel",r[1],14,y,170,26)
local vl=mk("TextLabel","",216,y,80,26)
local function upd()
local v=S[k]
vl.Text=type(v)=="boolean" and (v and "ON" or "OFF") or tostring(math.floor(v*100+0.5)/100)
end
if k=="pc" then S.upc=upd end
local function go(d)
local v=S[k]
if type(v)=="boolean" then
if k=="vis" then
if os.clock()<yax then return end
yax=os.clock()+3
end
S[k]=not v
if k=="pc" and S.pm then S.pm(S.pc) end
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
function yad(v)
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
local vb=big("v",-398,-159,yan,52)
local function pcm(h)
S.pc=h
if S.upc then S.upc() end
for _,x in {yae,ybf,yar,vb} do x.Visible=not h end
end
S.pm=pcm
pcm(UIS.KeyboardEnabled and not UIS.TouchEnabled)
local yaq3=UIS.InputBegan:Connect(function(i)
if i.UserInputType==Enum.UserInputType.Keyboard and not S.pa then S.pa=true pcm(true) end
end)
local gb=big("⚙",0,0,function() yab.Visible=not yab.Visible end,48)
gb.Position=UDim2.new(0,12,0,100)
gb.TextSize=30
local n=0
for _,it in yac do
if it.name==it.g or it.name=="Glowby" then
local g=it.name=="Glowby"
if not g then n=n+1 end
local b=big("",0,0,function() if not g then zw(it.g) end end,g and 68 or 76)
b.Position=UDim2.new(1,g and -74 or -410+n*82,0,g and 138 or 50)
if g then
S.tg=function()
S.fl=(S.fl+1)%3
SL.Enabled=S.fl>0
local cc=S.fl==2 and HC.Purple or WH
SL.Color=cc
b.BackgroundColor3=S.fl==2 and cc or S.fl==1 and RGB(80,80,80) or RGB(0,0,0)
end
b.Activated:Connect(S.tg)
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
for _,o in ipairs(yac) do
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
if i.KeyCode==Enum.KeyCode.C or i.KeyCode==Enum.KeyCode.LeftControl then yan() end
if i.KeyCode==Enum.KeyCode.Tab and S.tg then S.tg() end
if i.KeyCode==Enum.KeyCode.Q then yai("L") end
if i.KeyCode==Enum.KeyCode.E then yai("R") end
for k,n in pairs({One="Pressure",Two="OldRed",Three="Conductive",Four="Purple"}) do
if i.KeyCode==Enum.KeyCode[k] then zw(n) end
end
if i.UserInputType==Enum.UserInputType.MouseButton1 then yai("L") end
if i.UserInputType==Enum.UserInputType.MouseButton2 then yai("R") end
end)
_G.GFStop=function()
pcall(function() RS:UnbindFromRenderStep("GFU") end)
yap:Disconnect()
yaq3:Disconnect()
S.ps:Destroy()
pcall(yad,false)
zs:Disconnect()
if zz and cam then cam.FieldOfView=zz end
pcall(function() lp.Character:FindFirstChildOfClass("Humanoid").CameraOffset=V3(0,0,0) end)
vm:Destroy()
gui:Destroy()
_G.GFStop=nil
end
