function M = load_off(file_name)

M = [];

f = fopen(file_name, 'rt');

n = '';
while isempty(n)
    fgetl(f);
    n = sscanf(fgetl(f), '%d %d %d');
end

nv = n(1);
nt = n(2);
data = fscanf(f, '%f');

if length(data) == nv*3+nt*4
    data(3*nv+1:4:end)=[];
elseif length(data) ~= nv*3+nt*3
    fclose(f);
    error('load_off(): The mesh seems to be composed of non-triangular faces.');
end

M.TRIV = reshape(data(end-3*nt+1:end), [3 nt])';
data = data(1:end-3*nt);
data = reshape(data, [length(data)/nv nv]);
M.VERT = data';

fclose(f);

if min(min(M.TRIV))==0
    M.TRIV = 1+M.TRIV;
end

M.n = size(M.VERT,1);
M.m = size(M.TRIV,1);

end