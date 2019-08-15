class School
def method_missing(m,*a,&b)
s=:students
@g||@g=Hash.new{|h,k|h[k]=[]}
return@g[a[0]]if m==s
return@g.keys.sort.map{|k|{grade:k,s=>@g[k]}}if m.to_s==(s.to_s+'_by_grade')
(@g[a[1]]<<a[0]).sort!
end end
module BookKeeping VERSION=3 end
