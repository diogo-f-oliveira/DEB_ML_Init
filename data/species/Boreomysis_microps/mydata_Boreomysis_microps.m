function [data, auxData, metaData, txtData, weights] = mydata_Boreomysis_microps
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Mysida'; 
metaData.family     = 'Mysidae';
metaData.species    = 'Boreomysis_microps'; 
metaData.species_en = 'Boreal mysid shrimp'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMpe', '0iMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 31];

%% set data
% zero-variate data

data.am = 2*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Mauc1988';   
  temp.am = C2K(6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.269;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
  comment.Lb = 'based on Gastrosaccus_roscoffensis';
data.Lp  = 1.73;   units.Lp  = 'cm';  label.Lp  = 'length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on same relative length compared to Praunus: 1.8/2.6*2.5';
data.Li  = 2.5;   units.Li  = 'cm';  label.Li  = 'ultimate length';   bibkey.Li  = 'Mauc1988';

data.Wdb = 4.16e-5;   units.Wdb = 'g';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'guess';
  comment.Wdb = 'based on (Lb/Li)^3*Wdi';
data.Wdp = 1.1e-2;   units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'guess';
  comment.Wdp = 'based on (Lp/Li)^3*Wdi';
data.Wdi = 3.34e-2;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'guess';
  comment.Wdi = 'based on length-weight of Mysis mixta: (2.5/1.470)^3*6.8e-3';
 
data.Ri  = 0.37;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';
  
% uni-variate data
% time-length
data.tL = [ ... % time since Jan 1 (d), total length (cm)
42.716	0.6112
67.638	0.6365
104.130	0.7453
128.994	0.8415
208.657	1.0269
254.983	1.3095
312.932	1.6112
412.663	1.6610
432.639	1.6349
462.544	1.6666
485.793	1.7048
562.120	1.9031
623.245	2.3851];  
data.tL(:,1) = data.tL(:,1)+60;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Mauc1988';
comment.tL = 'length from base of the eye stalk to the end of the telson neglecting any terminal setae; temp between 4 and 8 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'temperature in C for tL data is assumed to vary as T(t)=7+6*sin((t-t_0)*2*pi/365)';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Females release eggs into a brood pouch or marsupium, where they are held until they hatch';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '68PBW'; % Cat of Life
metaData.links.id_ITIS = '127369'; % ITIS
metaData.links.id_EoL = '342717'; % Ency of Life
metaData.links.id_Wiki = 'Boreomysis'; % Wikipedia
metaData.links.id_ADW = 'Boreomysis_microps'; % ADW
metaData.links.id_Taxo = '281665'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Mysidae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mauc1988'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00391115}, ' ...
'author = {J. Mauchline}, ' ... 
'year = {1988}, ' ...
'title = {Growth and breeding of meso- and bathypelagic organisms of the {R}ockall {T}rough, northeastern {A}tlantic {O}cean and evidence of seasonality}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {98(3)}, ' ...
'pages = {387–393}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
