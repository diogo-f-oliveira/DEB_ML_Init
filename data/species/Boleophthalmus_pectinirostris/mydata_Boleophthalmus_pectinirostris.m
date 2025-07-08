function [data, auxData, metaData, txtData, weights] = mydata_Boleophthalmus_pectinirostris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Oxudercidae';
metaData.species    = 'Boleophthalmus_pectinirostris'; 
metaData.species_en = 'Great blue spotted mudskipper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 12 30];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 30];

%% set data
% zero-variate data

data.ab = 7.5;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Take2008';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 7*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Take2008';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'fishbase'; 
data.Li  = 22;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'Take2008';

data.Wwb = 2.1e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'WansQiyo2004';
  comment.Wwb = 'based on egg length of 1.1 mm and width of 0.6 mm: pi/6*0.11*0.06^2';
data.Wwp = 3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00933*Lp^2.97, see F1';
data.Wwi = 90.5;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for males';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^2.97, see F1';

data.Ri  = 3.5e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.95';


% uni-variate data
% time-length
data.tL_f = [... %  yr class (yr), standard length (mm)
 (35/365) 18*0.8654
 1    67.29
 2    97.72
 3   102.46
 4   106.23
 5   108.58
 6   109.19
 7   112.35];
data.tL_f(:,1) = 365 * data.tL_f(:,1);
data.tL_f(:,2) = data.tL_f(:,2)/ 8.654; % convert SL in mm to TL in cm, based on photo 
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(28);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'NanaTake2005';
comment.tL_f = 'Data for females';
%
data.tL_m = [... %  yr class (yr), standard length (mm)
 (35/365) 18*0.8654
1  64.53
2  95.58
3 105.89
4 110.46
5 111.98
6 113.18
7 108.91
8 127.43];
data.tL_m(:,1) = 365 * data.tL_m(:,1); 
data.tL_m(:,2) = data.tL_m(:,2)/ 8.654; % convert SL in mm to TL in cm, based on photo 
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(28);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'NanaTake2005';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;
weights.tL_m(end) = 0;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Weight-length: Ww in g = 0.00933*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5WMTZ'; % Cat of Life
metaData.links.id_ITIS = '637042'; % ITIS
metaData.links.id_EoL = '46576719'; % Ency of Life
metaData.links.id_Wiki = 'Boleophthalmus'; % Wikipedia
metaData.links.id_ADW = 'Boleophthalmus_pectinirostris'; % ADW
metaData.links.id_Taxo = '46564'; % Taxonomicon
metaData.links.id_WoRMS = '279926'; % WoRMS
metaData.links.id_fishbase = 'Boleophthalmus-pectinirostris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Boleophthalmus}}';
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
bibkey = 'NanaTake2005'; type = 'Article'; bib = [ ... 
'author = {Atsushi Nanamia, Takeshi Takegaki}, ' ... 
'year = {2005}, ' ...
'title = {Age and growth of the mudskipper \emph{Boleophthalmus pectinirostris} in {A}riake {B}ay, {K}yushu, {J}apan}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {74}, ' ...
'pages = {24-34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Take2008'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10641-007-9226-5}, ' ...
'author = {Takegaki, Takeshi}, ' ... 
'year = {2008}, ' ...
'title = {Threatened fishes of the world: \emph{Boleophthalmus pectinirostris} ({L}innaeus 1758) ({G}obiidae)}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {81}, ' ...
'pages = {373-374}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WansQiyo2004'; type = 'Article'; bib = [ ...
'author = {Hong Wanshu and Zhnag Qiyong }, ' ... 
'year = {2004}, ' ...
'title = {Induced nest spawning and artificial hatching of the fertilized eggs of mudskipper, \emph{Boleophthalmus pectinirostris}}, ' ...
'journal = {Chinese Journal of Oceanology and Limnology}, ' ...
'volume = {22}, ' ...
'pages = {408-413}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Boleophthalmus-pectinirostris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

