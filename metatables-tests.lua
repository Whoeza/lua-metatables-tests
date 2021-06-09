print('')
Base = { value = 'default' }
Base.__index = Base
function Base:new(value)
    local b = {}
    setmetatable(b, self)
    b.value = value
    return b
end
function Base:render() print("I'm the B A S E! : "..self.value) end
function Base:hehe() print('hehe!') end

Button = Base:new() -- Button is an instance of Base
Button.__index = Button
--function Button:new(value)
--    local b = Base:new(value)
--    setmetatable(b, self)
--    return b
--end
Button:new("This should say base"):render()
function Button:render() print("I'm a BUTTON! : "..self.value) end
Button:new("TestBtn"):render()
Button:new("will I print hehe?"):hehe()

ThirdButton = Button:new() -- ThirdButton instance of Button
ThirdButton.__index = ThirdButton
--function ThirdButton:new(value)
--    local b = Button:new(value)
--    setmetatable(b, self)
--    return b
--end
ThirdButton:new("this should say button"):render()
--function ThirdButton:render() print("I'm a THIRD BUTTON! : "..self.value) end
function ThirdButton:render()
    setmetatable(self, Base)
    self:render()
    setmetatable(self, Button)
    self:render()
    setmetatable(self, ThirdButton)
    print("I'm a THIRD BUTTON! : "..self.value)
end
ThirdButton:new("TestThirdBtn"):render()
Button:new("TestThirdBtn2"):render()
ThirdButton:new("TestThirdBtn3"):render()
Button:new("TestThirdBtn4"):render()
ThirdButton:new("will I print hehe?"):hehe()